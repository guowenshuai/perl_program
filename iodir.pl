########################################################################
# File Name: iodir.pl
# Author: WenShuai
# mail: guowenshuai8207@163.com
# Created Time: 2016年11月29日 星期二 16时53分41秒
#########################################################################
#!/use/bin/perl
use strict;
use warnings;

use IO::Dir;

my $dir_fh = IO::Dir->new(".");

while(defined(my $file = $dir_fh->read())) {
	print "read file: $file\n";
}

$dir_fh->rewind();
while(defined(my $file = $dir_fh->read())) {
	print "reread file: $file\n";
}
