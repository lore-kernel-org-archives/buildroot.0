From: Adrian Perez de Castro <aperez@igalia.com>
Date: Fri, 20 Nov 2020 18:19:18 +0200
Subject: [Buildroot] [PATCH 1/1] package/webkitgtk: bump to version 2.30.3
Message-ID: <20201120161918.222066-1-aperez@igalia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is a minor release which solved a build issues and fixes a number
of rendering issues. Release notes:

  https://webkitgtk.org/2020/11/20/webkitgtk2.30.3-released.html

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/webkitgtk/webkitgtk.hash | 8 ++++----
 package/webkitgtk/webkitgtk.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/webkitgtk/webkitgtk.hash b/package/webkitgtk/webkitgtk.hash
index 30b8e4f11f..1849d9eff9 100644
--- a/package/webkitgtk/webkitgtk.hash
+++ b/package/webkitgtk/webkitgtk.hash
@@ -1,7 +1,7 @@
-# From https://webkitgtk.org/releases/webkitgtk-2.30.2.tar.xz.sums
-md5  2163f1f982c63cb8fa75bf1b36396304  webkitgtk-2.30.2.tar.xz
-sha1  e27d336570226645f861b5a00116c17da39f9df4  webkitgtk-2.30.2.tar.xz
-sha256  c467e0bc2bc610c2570928e3fd63cedaadc4719cbf9b04aa99f79dd71ad5682a  webkitgtk-2.30.2.tar.xz
+# From https://webkitgtk.org/releases/webkitgtk-2.30.3.tar.xz.sums
+md5  3db32cffeab82efcade1ce77f94865c2  webkitgtk-2.30.3.tar.xz
+sha1  6eed6e8a3c2f47533821169679fe381ceb0550be  webkitgtk-2.30.3.tar.xz
+sha256  6dea14f03916882816f2fed9497a5103fc54b2ab8602ab145ca991e4951e5e7f  webkitgtk-2.30.3.tar.xz
 
 # Hashes for license files:
 sha256  0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4  Source/WebCore/LICENSE-APPLE
diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index 84078f8b9a..0310f058f1 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WEBKITGTK_VERSION = 2.30.2
+WEBKITGTK_VERSION = 2.30.3
 WEBKITGTK_SITE = https://www.webkitgtk.org/releases
 WEBKITGTK_SOURCE = webkitgtk-$(WEBKITGTK_VERSION).tar.xz
 WEBKITGTK_INSTALL_STAGING = YES
-- 
2.29.2
