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
my $level = 0; ## 广度优先搜索的深度

GetOptions(
	'd|dir=s' => \$path,
	'l|level=i' => \$level,
) or die $!;

if($path) {
	$path =~ s/\\/\//g;
#	1 while $path =~ s/\/\//\//g;
	$path =~ s/ (\/) (?= \g{-1}(?{$dbghd->print ("$`#$&#$'\n")}) )//xg; ##用正前瞻修复处理路径
	$path =~ s/\/$//;
	if(-e $path && -d $path) {
		$dbghd->print("dir: $path\n");
	}else {
		die "E: $path not a directory\n";
	}
	
} else {## 如果没有参数,则选择当前目录
	$path = cwd(); 
}


$dbghd->print("dir: $path\n");

my $data = depth_priority_search($path,$level);

print Dump($data);

sub depth_priority_search
{
	my ($dir,$level) = @_;

	my $data = {};

	my @queue = ([$dir, 0, $data]);  ##  迭代处理的任务队列

	while(my $task = shift @queue ) { ## 从任务队列最左端提取一个任务
		my ($path, $lev, $ref) = @$task;
		my $basename = basename($path); ## 从路径中取出目录名

		$ref->{$basename} = do {  ## do语句块为ref赋值
		if(-f $path or -l $path) {undef;} ## 如果是文件或者软链接,赋值undef
		elsif(-d $path) {
			if($lev > $level && $level) {next} ## 当目录深度达到$level深度,这一层跳过,处理下一个任务
			my $hash = {};
			opendir DH, $path;
			my @arr = map {
				my $newpath = catfile($path, $_);
			} grep {! /^\.\.?$/} readdir DH;
			closedir DH;
			push @queue, map {[$_, $lev+1, $hash]} @arr; ## 将新任务push到任务队列尾端,广度优先级的处理方式是先进先出
			
			
			$hash; ## 为该目录层级返回一个hash的引用,下级子目录处理任务时会填充这个空hash
		}
		}
	}
	$data;
}
