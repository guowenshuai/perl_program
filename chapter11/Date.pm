########################################################################
# File Name: datepre.pm
# Author: WenShuai
# mail: guowenshuai8207@163.com
# Created Time: 2016年12月05日 星期一 14时10分30秒
#########################################################################
#!/use/bin/perl
#
#
package Date;

use strict;
use warnings;

use YAML;

my @day = qw(ark dip wap sen pop sep kir);
my @month = qw(diz pod bob rod sip wax lin sen kun fiz nap dep);

sub number_to_day_name
{
	my $number = shift @_;
	$day[$number];
}

sub number_to_month_name
{
	my $number = shift @_;
	$month[$number];
}

1;
