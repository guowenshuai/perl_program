########################################################################
# File Name: grep_list.pl
# Author: WenShuai
# mail: guowenshuai8207@163.com
# Created Time: 2016年11月17日 星期四 09时24分27秒
#########################################################################
#!/use/bin/perl
use strict;
use warnings;
use Carp qw(croak);
my %hash = (
	name => "bob",
	age => "12",
	home => "beijing",
);

my $ref = \%hash;
my $str = "aaa";
$ref = \$str;

my $nm = 20;
my $did = 0;
my $res = eval {$nm / $did};
print "\$res $res\n" if $res;
croak "hope a hash\n" unless eval {keys %$ref} ;
