use strict;
use Test;

use YoutubeOpen;

BEGIN { plan tests => 8 }

sub youtube_link {
  my $id = shift;
  return "https://youtube.com/watch?v=$id";
}

ok( YoutubeOpen::get_youtube_link(
  "Practical Lambda Calculus - Einar Høst, Jonas Winje-IThVmYaPojw.mp4",
  youtube_link("IThVmYaPojw")));

ok( YoutubeOpen::get_youtube_link(
  "Don Tapscott - Four principles for the open world-jfqwHT3u1-8.mkv",
  youtube_link("jfqwHT3u1-8")));

ok( YoutubeOpen::get_youtube_link(
  "ElixirConf 2015 - Elixir in the Browser  by Bryan Joseph-SK6SyZV_ujw.mkv",
  youtube_link("SK6SyZV_ujw")));

ok( YoutubeOpen::get_youtube_link(
  "ElixirConf 2015 - Embedded Elixir in Action by Garth Hitchens-kpzQrFC55q4.webm",
  youtube_link("kpzQrFC55q4")));

ok(!defined(YoutubeOpen::get_youtube_link("file_name_not_youtube_dl.mp4")));
ok(!defined(YoutubeOpen::get_youtube_link("kpzQrFC55q4")));
ok(!defined(YoutubeOpen::get_youtube_link("file.txt")));
ok(!defined(YoutubeOpen::get_youtube_link("file.webm")));

