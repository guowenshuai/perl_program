#!/usr/bin/perl

#########
# perl dbi study
#####

use warnings;
use strict;
use DBI;
use YAML;

my $database = "school";
my $dsn = "DBI:mysql:$database";

my $username = "root";
my $pwd = "root";
my $dbh = DBI->connect($dsn, $username, $pwd, {RaiseError => 1});
die "$!\n" if $!;

my $results = $dbh->do(q{show tables});
die "$!\n" if $!;

print Dump($results);

my $sth = $dbh->prepare(q{select * from stu}) or die "can't prepare\n";

my $rc = $sth->execute() or die "can't excute\n";

my $arr = $dbh->selectcol_arrayref("select * from stu", {Columns=>[1,2,3]});

print Dump($arr);

#my $res;
#$res = $sth->fetchall_hashref('sname');
#print Dump($res);

$sth->finish();
$dbh->disconnect;
