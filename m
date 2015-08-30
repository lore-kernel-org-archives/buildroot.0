From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 30 Aug 2015 09:44:24 +0200
Subject: [Buildroot] [git commit branch/next] package/Config.in: fix
	alphabetic order
Message-ID: <20150830074451.2143381D4F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a754bb8758ab9b5c314adda687014da9ddf17287
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Commit ebf3a6117c58 (package/libyuv: new package, 2015-08-11) added a
reference to the libyuv Config.in file at the wrong place. Fix that.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index c6244b7..cb548bb 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -962,8 +962,8 @@ menu "Multimedia"
 	source "package/libopenh264/Config.in"
 	source "package/libplayer/Config.in"
 	source "package/libtheora/Config.in"
-	source "package/live555/Config.in"
 	source "package/libyuv/Config.in"
+	source "package/live555/Config.in"
 	source "package/mediastreamer/Config.in"
 	source "package/x264/Config.in"
 endmenu
