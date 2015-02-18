From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 18 Feb 2015 23:31:57 +0100
Subject: [Buildroot] [git commit] mjpg-streamer: limit lines length to 72
	characters
Message-ID: <20150218223234.17C6D81790@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b2ef5c4aa79f4c7a214ffbb7b20f9b22903bb947
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mjpg-streamer/Config.in |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mjpg-streamer/Config.in b/package/mjpg-streamer/Config.in
index db57bc0..f42c2a5 100644
--- a/package/mjpg-streamer/Config.in
+++ b/package/mjpg-streamer/Config.in
@@ -6,9 +6,9 @@ config BR2_PACKAGE_MJPG_STREAMER
 	depends on !BR2_STATIC_LIBS # plugins need dlopen()
 	select BR2_PACKAGE_JPEG
 	help
-	  MJPG-streamer takes JPGs from Linux-UVC compatible webcams, filesystem
-	  or other input plugins and streams them as M-JPEG via HTTP to
-	  webbrowsers, VLC and other software.
+	  MJPG-streamer takes JPGs from Linux-UVC compatible webcams,
+	  filesystem or other input plugins and streams them as
+	  M-JPEG via HTTP to webbrowsers, VLC and other software.
 
 	  http://mjpg-streamer.sourceforge.net
 
