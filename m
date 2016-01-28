From: Jonathan Ben-Avraham <yba@tkos.co.il>
Date: Thu, 28 Jan 2016 17:37:56 +0200
Subject: [Buildroot] [PATCH 1/1] directfb: add help text to Config.in,
	note broken URL
Message-ID: <1453995476-28960-1-git-send-email-yba@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adds descriptive help text to Config.in based on content from elinux.org and
Wikipedia. Notes that http://www.directfb.org/ has been broken for more than
five months and suggests using http://elinux.org/DirectFB instead.

Signed-off-by: Jonathan Ben-Avraham <yba@tkos.co.il>
---
 package/directfb/Config.in | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/directfb/Config.in b/package/directfb/Config.in
index 73425d3..638e4e1 100644
--- a/package/directfb/Config.in
+++ b/package/directfb/Config.in
@@ -8,7 +8,13 @@ config BR2_PACKAGE_DIRECTFB
 	select BR2_PACKAGE_FREETYPE
 	select BR2_PACKAGE_ZLIB
 	help
-	  http://www.directfb.org/
+	  DirectFB (Direct Frame Buffer) is a set of graphics APIs implemented
+	  on top of the Linux Frame Buffer (fbdev) abstraction layer. It is an
+	  alternative to X11 with a smaller memory footprint that still has an
+	  integrated windowing system. As of 4 October 2015, DirectFB's website
+	  http://www.directfb.org/ is down. See alternative site listed below.
+
+	  http://elinux.org/DirectFB
 
 if BR2_PACKAGE_DIRECTFB
 
-- 
2.1.4
