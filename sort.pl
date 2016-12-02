########################################################################
# File Name: sort.pl
# Author: WenShuai
# mail: guowenshuai8207@163.com
# Created Time: 2016年12月01日 星期四 10时06分31秒
#########################################################################
#!/use/bin/perl
use strict;
use warnings;
use YAML;


###### sort by default
my @namelist = qw/bob marry jack simon ann tiger/;
my @sortedNameList = sort @namelist;
print "sortedNameList: @sortedNameList\n";

my @sortedNumber = sort { $a <=> $b } qw/11 33 21 2 1 54 43 3 222/;
print "sortedNumber: @sortedNumber\n";
my %hash = map {$_, $_."Name"} @namelist; ## build a hash for people

my @sort_list = sort {$hash{$a} cmp $hash{$b}} keys %hash;  ## sort keys by values

print "sot: @sort_list\n";


##  施瓦茨变换
my @namelistBysalary =  map {
#							$_->[0] 
							$_->{name}
					} ( ## 此小括号为增加可读性
						sort {
#							$a->[1] cmp $b->[1] or
#							$a->[2] cmp $b->[2]
							$a->{salary} cmp $b->{salary}   or      ## 通过name元素sort	
							$a->{age} cmp $b->{age}       ## 'or'后增加的表达式表明 此排列实现的是多级排列
				
						} ( ## 此小括号为增加可读性
#							map [$_, $_."salary", $_."age"],   ## 返回一个数组引用
							map +{								## 返回一个hash引用
								name => $_,
								salary => $_."salary",				## 这里可以是其他子例程 e.g.  name => asksalary($_), 
								age => $_."age",          ##							  family => getage($_), ...
							},
							@namelist
						)
					);
print "swc: @namelistBysalary\n";

######
my @input = qw(Gilligan Skipper Professor Ginger Mary);

my @sorted_positions = sort {
	$input[$a] cmp $input[$b]
} 0 .. $#input;
print "input: @input\n";
print "sorted position: @sorted_positions\n";


my @ranks;
@ranks[@sorted_positions] = (0 .. $#sorted_positions);

print "name position: @ranks\n";
print "sorted: @input[@sorted_positions]\n";


my @hash_map = map +{
		$_=>1,	
		name => $_,
		family => $_."f",

	}, @namelist;
print @hash_map;
print Dump(\@hash_map);


my @sortednamebyhash = map $_->{name}, @hash_map;

print "@sortednamebyhash";
