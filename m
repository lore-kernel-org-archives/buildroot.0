From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 19 Apr 2015 15:07:16 +0200
Subject: [Buildroot] [PATCH 1/9] package/fbdump: Add project URL to Config.in
Message-ID: <1429448844-12598-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/fbdump/Config.in |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/fbdump/Config.in b/package/fbdump/Config.in
index 7910713..982448d 100644
--- a/package/fbdump/Config.in
+++ b/package/fbdump/Config.in
@@ -5,3 +5,5 @@ config BR2_PACKAGE_FBDUMP
 	  framebuffer  device and write them out as a PPM file. Currently,
 	  most packed-pixel framebuffer formats and the vga16 framebuffer
 	  are supported.
+
+	  http://www.rcdrummond.net/fbdump
-- 
1.7.10.4
