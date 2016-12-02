########################################################################
# File Name: depth_priority.pl
# Author: WenShuai
# mail: guowenshuai8207@163.com
# Created Time: 2016年12月02日 星期五 16时39分38秒
#########################################################################
#!/use/bin/perl
use strict;
use warnings;

use YAML;
use Getopt::Long;
use File::Basename;
use IO::Null;
use Cwd;
use File::Spec::Functions;

my $DEBUG = 1;
my $dbghd = $DEBUG ? *STDOUT : IO::Null->new;

my $path = "";

GetOptions(
	'd|dir=s' => \$path,
) or die $!;

if($path) {
	$path =~ s/\\/\//g;
#	1 while $path =~ s/\/\//\//g;
	$path =~ s/ (\/) (?= \g{-1}(?{$dbghd->print ("$`#$&#$'\n")}) )//xg;
	$path =~ s/\/$//;
	if(-e $path && -d $path) {
		$dbghd->print("dir: $path\n");
	}else {
		die "E: $path not a directory\n";
	}
	
} else {
	$path = cwd(); 
}

$dbghd->print("dir: $path\n");

my $data = depth_priority_search($path);

print Dump($data);

sub depth_priority_search
{
	my $dir = shift;

	my $data = {};

	my @queue = ([$dir, $data]);

	while(my $task = shift @queue ) {
		my ($path, $ref) = @$task;
		my $basename = basename($path);

		$ref->{$basename} = do {
		if(-f $path or -l $path) {undef;}
		elsif(-d $path) {
			my $hash = {};
			opendir DH, $path;
			my @arr = map {
				my $newpath = catfile($path, $_);
			} grep {! /^\.\.?$/} readdir DH;
			closedir DH;
			unshift @queue, map {[$_, $hash]} @arr;
			$hash;
		}
		}
	}
	$data;
}
