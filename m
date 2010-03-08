From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Bump xkbevd to 1.1.0
Message-ID: <20100308133646.DCAA3776E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=3ca7c03bb7e5053465741f5ea1632aa017f0461b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 package/x11r7/xapp_xkbevd/Config.in      |    2 +-
 package/x11r7/xapp_xkbevd/xapp_xkbevd.mk |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xapp_xkbevd/Config.in b/package/x11r7/xapp_xkbevd/Config.in
index 703e11d..b4a2e4a 100644
--- a/package/x11r7/xapp_xkbevd/Config.in
+++ b/package/x11r7/xapp_xkbevd/Config.in
@@ -2,5 +2,5 @@ config BR2_PACKAGE_XAPP_XKBEVD
 	bool "xkbevd"
 	select BR2_PACKAGE_XLIB_LIBXKBFILE
 	help
-	  xkbevd 1.0.2
+	  xkbevd 1.1.0
 	  XKB event daemon
diff --git a/package/x11r7/xapp_xkbevd/xapp_xkbevd.mk b/package/x11r7/xapp_xkbevd/xapp_xkbevd.mk
index 9c508eb..48d6565 100644
--- a/package/x11r7/xapp_xkbevd/xapp_xkbevd.mk
+++ b/package/x11r7/xapp_xkbevd/xapp_xkbevd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XKBEVD_VERSION = 1.0.2
+XAPP_XKBEVD_VERSION = 1.1.0
 XAPP_XKBEVD_SOURCE = xkbevd-$(XAPP_XKBEVD_VERSION).tar.bz2
 XAPP_XKBEVD_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XKBEVD_AUTORECONF = NO
-- 
1.6.3.3
