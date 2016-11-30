########################################################################
# File Name: 8-1.pl
# Author: WenShuai
# mail: guowenshuai8207@163.com
# Created Time: 2016年11月29日 星期二 18时09分55秒
#########################################################################
#!/use/bin/perl
use strict;
use warnings;
use IO::Tee;

my @abbr = qw(Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec); ## the monthes
my @week = qw(Sunday Monday Tuesday Wednesday Thursday Friday Saturday);

my ($sec, $min, $hour, $mday, $mon, $yead, $wday, $yday, $isdst) = localtime(time);

print $yead+1900,"-$abbr[$mon]-$mday-$hour:$min:$sec $week[$wday]\n";

