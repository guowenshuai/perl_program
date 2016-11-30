########################################################################
# File Name: data_dumper.pl
# Author: WenShuai
# mail: guowenshuai8207@163.com
# Created Time: 2016年11月30日 星期三 16时55分52秒
#########################################################################
#!/use/bin/perl
use strict;
use warnings;

use Data::Dumper;
use Data::Printer;
use YAML;
use JSON;
use IO::File;

use Storable qw(nstore store_fd nstore_fd freeze thaw dclone);

my $file = IO::File->new("aa.txt", 'w') or die $!;  ## 打开文件 OO

my %hash = map {$_, $_.$_} 'a'..'j';
my %hash_t = map {$_, $_.$_} 'j'..'z';

print Dumper(\%hash, \%hash_t); ## Data::Dumper 打印输出
print Dump(\%hash, \%hash_t);   ## YAML的输出

p(%hash_t); ##  Data::Printer 打印输出

######## JSON
#
print to_json(\%hash);  ##  perl hash -->> json /  from_json($json_string) 
print "\n";              


########################  Dump 数据编组
my $string =  Data::Dumper->Dump(
[\%hash, \%hash_t],  ## 数据编组的对象

[qw/*d1 *d2/]	## 数据编组要使用的名称
);

print "$string\n";
#$file->print($string); ## 文件输入 OO

############ Storable数据编组
my $frozen = freeze ([\%hash, \%hash_t]); ## freeze 编组数据
$file->print($frozen);

my $data = thaw($frozen);  ##  thaw重建数据     ****** 在代码中使用freeze和thaw实现深复制
##################
p(%{$$data[1]});
$file->close or die $!;
undef $file;
