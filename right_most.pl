########################################################################
# File Name: right_most.pl
# Author: WenShuai
# mail: guowenshuai8207@163.com
# Created Time: 2016年11月30日 星期三 14时44分26秒
#########################################################################
#!/use/bin/perl
use strict;
use warnings;
## 返回匹配到的最右边的一个
#
my %patterns = (
	Gilligan => qr/(?:Willie )?Gilligan/,
	'Mary Ann' => qr/Mary Ann/,
	Ginger => qr/Ginger/,
	Professor => qr/(?:The )?Professor/,
	Skipper => qr/Skipper/,
	'A Howell' => qr/Mrs?. Howell/,

);

my $rkey = rightmost(
	'There is Mrs. Howell, Ginger, and Gilligan',
	\%patterns
);


print "rightkey: $rkey\n" if $rkey;

sub rightmost {
	my($string, $patterns) = @_;

	my $rightmost = -1;
	my $rkey = undef;

	while(my($key, $pattern) = each %$patterns) {
		my $position = $string =~ m/$pattern/ ? $-[0] : -1;
		(($rkey = $key) && ($rightmost = $position)) if $position > $rightmost;
	}
	#return $rightmost;
	return $rkey;
}
