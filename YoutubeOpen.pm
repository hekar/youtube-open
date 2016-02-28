package YoutubeOpen;

use Getopt::Long;
use Exporter;
use vars qw($VERSION @ISA @EXPORT @EXPORT_OK %EXPORT_TAGS);

$VERSION     = 1.00;
@ISA         = qw(Exporter);
@EXPORT      = ();
@EXPORT_OK   = qw(get_youtube_link);
%EXPORT_TAGS = ( DEFAULT => [qw(&get_youtube_link)] );


my $verbose;

sub open_browser {
  my $url = shift;
  # xdg-open is busted on Fedora under i3... does not return an exit code that != 0
  my $cmd = "firefox \"$url\"";
  return system($cmd);
}

sub get_youtube_link {
  my $filename = shift;
  my $match = ($filename =~ /^.*?\-([A-Za-z0-9_-]+).*?$/);
  if ($1) {
    return "https://youtube.com/watch?v=$1";
  } else {
    return undef;
  }
}

sub open_youtube_link {
  my $filename = shift;
  my $url = get_youtube_link($filename);
  if ($url) {
    return open_browser($url);
  } else {
    die("Incorrectly formatted 'youtube-dl' video download name.");
  }
}

$result = GetOptions(
  "verbose"  => \$verbose,
  '<>' => \&open_youtube_link);

