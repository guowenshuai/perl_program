########################################################################
# File Name: test.pl
# Author: WenShuai
# mail: guowenshuai8207@163.com
# Created Time: 2016年12月05日 星期一 14时14分18秒
#########################################################################
#!/use/bin/perl
use strict;
use warnings;

BEGIN {
	use FindBin qw($Bin);
	use lib "$Bin";
}
use Oogaboogoo::Date;
#use Date;

my $day = eval { Oogaboogoo::Date::number_to_day_name(4);};
$@ ? print "$@\n" : print "$day\n";
my $month = eval { Oogaboogoo::Date::number_to_month_name(8);};
$@ ? print "$@\n" :print "$month\n";
