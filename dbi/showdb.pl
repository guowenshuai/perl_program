#!/usr/bin/perl

use DBI;
use warnings;
use strict;
use YAML;

print "ENTER user for connect: ";
chomp(my $user = <STDIN>);
print "ENTER password for $user: ";
chomp(my $pwd = <STDIN>);

my $start = "mysql";

my $dbh = DBI->connect("DBI:mysql:$start", $user, $pwd, {RaiseError => 1, ShowErrorStatement => 1});


my @dbs = ();
my $sth = $dbh->prepare(q{show databases});
$sth->execute();

while(my $aref = $sth->fetchrow_arrayref())
{
    push(@dbs, $aref->[0]);
}




foreach my $db (@dbs){
    $sth = $dbh->prepare(qq{show tables from $db});
    $sth->execute();
    print "$db:\n";
    my @tables = ();
    while(my $aref = $sth->fetchrow_arrayref()) {
	my $table = $aref->[0];
	push(@tables, $table);
    }

    foreach my $table (@tables) {
    	$sth = $dbh->prepare(qq{show columns from $table from $db});
	$sth->execute();
	print "\t$table\n";
	while(my $aref = $sth->fetchrow_arrayref()) {
	    print "\t\t$aref->[0]: \[$aref->[1]\]\n";
	}
    }
}
