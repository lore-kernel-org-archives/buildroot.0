From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 2 Oct 2011 20:58:10 +0200
Subject: [Buildroot] [git commit] mpd: fixup sample config
Message-ID: <20111002191514.CC9CA8E04A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2b16f70148eb4707854df5fc60d8fa9c8a281192
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix sample mpd.conf so that the playlists directory lives inside the
main mpd data directory.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/mpd/mpd.conf |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/multimedia/mpd/mpd.conf b/package/multimedia/mpd/mpd.conf
index 1a08ed0..5956b75 100644
--- a/package/multimedia/mpd/mpd.conf
+++ b/package/multimedia/mpd/mpd.conf
@@ -7,7 +7,7 @@
 music_directory		"/var/lib/mpd/music"
 
 # Directory where user-made playlists are stored (RW)
-playlist_directory	"/mnt/mpd/playlists"
+playlist_directory	"/var/lib/mpd/playlists"
 
 # Database file (RW)
 db_file			"/var/lib/mpd/database"
