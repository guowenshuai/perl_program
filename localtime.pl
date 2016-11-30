########################################################################
# File Name: localtime.pl
# Author: WenShuai
# mail: guowenshuai8207@163.com
# Created Time: 2016年11月29日 星期二 18时09分55秒
#########################################################################
#!/use/bin/perl
use strict;
use warnings;



my $time = getLocalTime();
print "getLocalTime:  $$time{year}-$$time{month}-$$time{day}-$$time{hour}:$$time{minute}:$$time{second} $$time{weekday} \n";


sub getLocalTime 
{
#my @abbr = qw(Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec); ## the months
my @week = qw(Sunday Monday Tuesday Wednesday Thursday Friday Saturday);

my ($sec, $min, $hour, $mday, $mon, $year, $wday, $yday, $isdst) = localtime(time);
#print $year+1900,"-$abbr[$mon]-$mday-$hour:$min:$sec $week[$wday]\n";

$sec = ($sec > 9) ? $sec : "0$sec";
$min = ($min > 9) ? $min : "0$min";
$hour = ($hour > 9) ? $hour : "0$hour";
$mday = ($mday > 9) ? $mday : "0$mday";
$mon = ($mon > 8) ? ($mon+1) : "0".($mon+1);
$year = $year + 1900;

return {
	'second' => $sec,
	'minute' => $min,
	'hour' => $hour,
	'day' => $mday,
	'month' => $mon,
	'year' => $year,
	'weekday' => $week[$wday],
	'yearday' => $yday,
	}

}
