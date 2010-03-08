From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Bump makedepend to 1.0.2
Message-ID: <20100308133640.E5BF3776E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=27a31979c3153e9ee4960d4c4b9cb24c35ee6c36
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 package/x11r7/xutil_makedepend/Config.in           |    2 +-
 package/x11r7/xutil_makedepend/xutil_makedepend.mk |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xutil_makedepend/Config.in b/package/x11r7/xutil_makedepend/Config.in
index 4aff633..f94fadc 100644
--- a/package/x11r7/xutil_makedepend/Config.in
+++ b/package/x11r7/xutil_makedepend/Config.in
@@ -1,5 +1,5 @@
 config BR2_PACKAGE_XUTIL_MAKEDEPEND
 	bool "makedepend"
 	help
-	  makedepend 1.0.0
+	  makedepend 1.0.2
 	  No description available
diff --git a/package/x11r7/xutil_makedepend/xutil_makedepend.mk b/package/x11r7/xutil_makedepend/xutil_makedepend.mk
index cd6801d..660323d 100644
--- a/package/x11r7/xutil_makedepend/xutil_makedepend.mk
+++ b/package/x11r7/xutil_makedepend/xutil_makedepend.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XUTIL_MAKEDEPEND_VERSION = 1.0.1
+XUTIL_MAKEDEPEND_VERSION = 1.0.2
 XUTIL_MAKEDEPEND_SOURCE = makedepend-$(XUTIL_MAKEDEPEND_VERSION).tar.bz2
 XUTIL_MAKEDEPEND_SITE = http://xorg.freedesktop.org/releases/individual/util
 XUTIL_MAKEDEPEND_AUTORECONF = NO
-- 
1.6.3.3
