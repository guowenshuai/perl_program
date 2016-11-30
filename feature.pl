########################################################################
# File Name: feature.pl
# Author: WenShuai
# mail: guowenshuai8207@163.com
# Created Time: 2016年11月30日 星期三 18时37分06秒
#########################################################################
#!/use/bin/perl
use strict;
use warnings;

#
### 用qw加载
use feature qw(say);
#
#
### 通过指定版本号隐式加载
#use v5.10;
#
#
### 加载所有该版本的features
#use feature ':5.10';
#
#
### 在某个语句块中使用
# {
#	use feature 'say';
#	say("hello boy");
# }
# print "can't use say here.\n";
#
#
### no feature
 {
	no feature 'say';
	eval{ say("can i use say?") };
	print "capture \$\@: $@\n" if $@;
 }
say("hello boy");
say("hello boy");
