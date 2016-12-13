########################################################################
# File Name: script/horse.pl
# Author: WenShuai
# mail: guowenshuai8207@163.com
# Created Time: 2016年12月07日 星期三 14时34分18秒
#########################################################################
#!/use/bin/perl
use strict;
use warnings;

use YAML;
use Horse;
use Sheep;

my $tv_horse = Horse->named('Mr. Ed');
$tv_horse->set_name('Mrster Ed');
$tv_horse->set_color('grey');

print $tv_horse->name, " is ", $tv_horse->color, "\n";

print Sheep->name, ' colored ', Sheep->color, ' goes ', Sheep->sound, "\n";

print ref($tv_horse);

print "can eat\n" if $tv_horse->can("eat");

my $red_horse = named Horse:: "Mrs Li";
$red_horse->sing;
eat $red_horse "mimi";
eat Horse "gancao";

print Dump(%$red_horse);

#my $s_red_horse = $red_horse->named("Mrs Li's son");

#sub AUTOLOAD {
#	our $AUTOLOAD;
#	print "$AUTOLOAD\n";
#	(my $method = $AUTOLOAD) =~ s/.*:://s;
#	if($method eq 'eat') {
#		eval q{
#		sub eat {
#		my $class = shift;
#		print "$class eat ",shift,"\n";
#		}
#		};
#		die $@ if $@;
#		goto &eat;
#
#	} else {
#		die "$_[0] doesn't know how to $method\n";
#	}
#}

#Horse->eat("heiheihei");
