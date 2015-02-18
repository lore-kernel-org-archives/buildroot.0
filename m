From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 18 Feb 2015 09:23:57 +0000
Subject: [Buildroot] [PATCH 2/2] mjpg-streamer: limit lines length to 72
	characters
In-Reply-To: <1424251437-8742-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1424251437-8742-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <1424251437-8742-2-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
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
 
-- 
1.7.1
