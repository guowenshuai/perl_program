########################################################################
# File Name: oogatime.pl
# Author: WenShuai
# mail: guowenshuai8207@163.com
# Created Time: 2016年12月05日 星期一 14时46分27秒
#########################################################################
#!/use/bin/perl
use strict;
use warnings;

BEGIN {
	use FindBin qw($Bin);
	use lib "$Bin";
}
use Oogaboogoo::Date;

my ($sec, $min, $hour, $mday, $mon, $year, $wday) = localtime;

print $year+1900,"-",Oogaboogoo::Date::number_to_month_name($mon),"-",
	"$mday-$hour:$min:$sec ",Oogaboogoo::Date::number_to_day_name($wday);
