########################################################################
# File Name: iohandle.pl
# Author: WenShuai
# mail: guowenshuai8207@163.com
# Created Time: 2016年11月29日 星期二 16时01分58秒
#########################################################################
#!/use/bin/perl
use strict;
use warnings;

#use IO::Null;

#my $DEBUG = 1;

#my $debug_fh = $DEBUG ? *STDOUT : IO::Null->new();

#$debug_fh->print("heiheihei\n");
#
open my $filehandle,">","aa.txt" or die $!;

$filehandle->print("hhhhh\n");

$filehandle->close;
