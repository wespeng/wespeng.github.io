use strict;
use POSIX;

my $filename = shift || die "no file\n";
my $title = shift || die "no title\n";
my $date = strftime("%Y-%m-%d",localtime);

my @array;
open HD,"index.html" or die $!;

while(<HD>) {
  if (/<div class="container">/) {
    push @array,$_;

    my $items = <<END;
    <div class="post">
      <h2><a href="$filename">$title</a></h2>
      <time>$date</time>
    </div>
END

    push @array,$items;

  }else {
    push @array,$_;
  }
}
close HD;

open HDW,">","index.html" or die $!;
print HDW for @array;
close HDW;
