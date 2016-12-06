########################################################################
# File Name: script/pasture.pl
# Author: WenShuai
# mail: guowenshuai8207@163.com
# Created Time: 2016年12月06日 星期二 14时01分07秒
#########################################################################
#!/use/bin/perl
use strict;
use warnings;

use Cow;
use Horse;
use Sheep;
use Mouse;


my @pasture = ();

while(chomp(my $animal = <STDIN>)) {
	$animal = ucfirst lc $animal;
	last unless $animal =~ /^(Cow|Horse|Sheep|Mouse)$/;
	push @pasture, $animal;
}

for(@pasture) {
	$_->speak
}

package dog;

use parent qw(Animal);

sub sound {"wangggg"}

dog->speak;
