From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 30 Sep 2011 16:47:31 -0300
Subject: [Buildroot] [PATCH 3/4] mpd: fixup sample config
In-Reply-To: <1317412052-28859-1-git-send-email-gustavo@zacarias.com.ar>
References: <1317412052-28859-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1317412052-28859-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix sample mpd.conf so that the playlists directory lives inside the
main mpd data directory.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
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
-- 
1.7.3.4
