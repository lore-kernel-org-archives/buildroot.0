From: Adrian Perez de Castro <aperez@igalia.com>
Date: Wed, 25 Sep 2019 14:37:52 +0300
Subject: [Buildroot] [PATCH 1/1] package/webkitgtk: bump to version 2.26.1
Message-ID: <20190925113753.9340-1-aperez@igalia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Release notes:

  https://webkitgtk.org/2019/09/23/webkitgtk2.26.1-released.html

This is a bugfix release which fixes a few issues detected in 2.26.0
and includes media playback improvements as well.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/webkitgtk/webkitgtk.hash | 6 +++---
 package/webkitgtk/webkitgtk.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/webkitgtk/webkitgtk.hash b/package/webkitgtk/webkitgtk.hash
index 941e25a3bb..0cf0080e6e 100644
--- a/package/webkitgtk/webkitgtk.hash
+++ b/package/webkitgtk/webkitgtk.hash
@@ -1,7 +1,7 @@
 # From https://webkitgtk.org/releases/webkitgtk-2.26.0.tar.xz.sums
-md5 3a7054843cf9decbf824b8ffae794e65 webkitgtk-2.26.0.tar.xz
-sha1 e0c6f707bdf9edf3d444117736cb3c040eca78e7 webkitgtk-2.26.0.tar.xz
-sha256 d210c0ecd1a89a22c9f8f1f450334f3489c5c50159b3a5e14dd93d5f349dcced webkitgtk-2.26.0.tar.xz
+md5 08145bd6c1587230f135921c142bc150 webkitgtk-2.26.1.tar.xz
+sha1 bd0432281c0463147ec06587c25f226a67acbb2d webkitgtk-2.26.1.tar.xz
+sha256 6b4b21801d2b1008422a1075dbd6fb4ae8b5127503faf657cf9671289d9cd155 webkitgtk-2.26.1.tar.xz
 
 # Hashes for license files:
 sha256 0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4 Source/WebCore/LICENSE-APPLE
diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index 0eef7cafcd..6f72cdb528 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WEBKITGTK_VERSION = 2.26.0
+WEBKITGTK_VERSION = 2.26.1
 WEBKITGTK_SITE = https://www.webkitgtk.org/releases
 WEBKITGTK_SOURCE = webkitgtk-$(WEBKITGTK_VERSION).tar.xz
 WEBKITGTK_INSTALL_STAGING = YES
-- 
2.23.0
