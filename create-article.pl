use strict;
use POSIX;

my $filename = shift || die "no file\n";
my $title = shift || die "no title\n";
my $date = strftime("%Y-%m-%d",localtime);

my @array;
open HD,"index.html" or die $!;

while(<HD>) {
  if (/<ul>/) {
    push @array,$_;
    push @array, "                        <li><a href=\"$filename\">$title</a>\n";
    push @array, "                        <span class=\"post-date\">$date</span></li>\n";
  }else {
    push @array,$_;
  }
}
close HD;

open HDW,">","index.html" or die $!;
print HDW for @array;
close HDW;
