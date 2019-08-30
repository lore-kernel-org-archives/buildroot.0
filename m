From: Adrian Perez de Castro <aperez@igalia.com>
Date: Fri, 30 Aug 2019 15:04:32 +0300
Subject: [Buildroot] [PATCH 1/1] package/webkitgtk: security bump to version
 2.24.4
Message-ID: <20190830120432.28131-1-aperez@igalia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is a minor release which includes fixes for CVE-2019-8644,
CVE-2019-8649, CVE-2019-8658, CVE-2019-8669, CVE-2019-8676,
CVE-2019-8678, CVE-2019-8680, CVE-2019-8683, CVE-2019-8684, and
CVE-2019-8688.

This release also contains many build fixes, a few media playback
improvements, and a Web compatibility fix. For a complete list,
the full release notes at:

  https://webkitgtk.org/2019/08/28/webkitgtk2.24.4-released.html

The detailed security advisory can be found at:

  https://webkitgtk.org/security/WSA-2019-0004.html

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/webkitgtk/webkitgtk.hash | 8 ++++----
 package/webkitgtk/webkitgtk.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/webkitgtk/webkitgtk.hash b/package/webkitgtk/webkitgtk.hash
index f1784da2ad..8653369aa0 100644
--- a/package/webkitgtk/webkitgtk.hash
+++ b/package/webkitgtk/webkitgtk.hash
@@ -1,7 +1,7 @@
-# From https://webkitgtk.org/releases/webkitgtk-2.24.3.tar.xz.sums
-md5 e2a5bbd09a217eba096a2d1562143e35 webkitgtk-2.24.3.tar.xz
-sha1 26a33fd0af8223c130427cd59aaf5ccaba584114 webkitgtk-2.24.3.tar.xz
-sha256 940d746d7e82c357222feb5b3f44c4b201e81df7d81ddca5ca2bf3ae0acf6c51 webkitgtk-2.24.3.tar.xz
+# From https://webkitgtk.org/releases/webkitgtk-2.24.4.tar.xz.sums
+md5 c214963d8c0e7d83460da04a0d8dda87 webkitgtk-2.24.4.tar.xz
+sha1 f978b967422c6b423b11062375bab6506243388c webkitgtk-2.24.4.tar.xz
+sha256 8668b129c026624ec226a4cccf4995f9d26f3e88fc28ab75b0e965f3c32b7dd8 webkitgtk-2.24.4.tar.xz
 
 # Hashes for license files:
 sha256 0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4 Source/WebCore/LICENSE-APPLE
diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index f8cd728351..97e3311654 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WEBKITGTK_VERSION = 2.24.3
+WEBKITGTK_VERSION = 2.24.4
 WEBKITGTK_SITE = https://www.webkitgtk.org/releases
 WEBKITGTK_SOURCE = webkitgtk-$(WEBKITGTK_VERSION).tar.xz
 WEBKITGTK_INSTALL_STAGING = YES
-- 
2.23.0
