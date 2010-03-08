From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Bump xkbutils to 1.0.2
Message-ID: <20100308133647.2047A776E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=02b6529290494e9ba945d6154b8f100eabfc3bda
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 package/x11r7/xapp_xkbutils/Config.in        |    2 +-
 package/x11r7/xapp_xkbutils/xapp_xkbutils.mk |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xapp_xkbutils/Config.in b/package/x11r7/xapp_xkbutils/Config.in
index ff18915..3a85477 100644
--- a/package/x11r7/xapp_xkbutils/Config.in
+++ b/package/x11r7/xapp_xkbutils/Config.in
@@ -3,5 +3,5 @@ config BR2_PACKAGE_XAPP_XKBUTILS
 	select BR2_PACKAGE_XLIB_LIBXAW
 	select BR2_PACKAGE_XLIB_LIBXKBFILE
 	help
-	  xkbutils 1.0.1
+	  xkbutils 1.0.2
 	  X.Org xkbutils application
diff --git a/package/x11r7/xapp_xkbutils/xapp_xkbutils.mk b/package/x11r7/xapp_xkbutils/xapp_xkbutils.mk
index d66164e..07a34f4 100644
--- a/package/x11r7/xapp_xkbutils/xapp_xkbutils.mk
+++ b/package/x11r7/xapp_xkbutils/xapp_xkbutils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XKBUTILS_VERSION = 1.0.1
+XAPP_XKBUTILS_VERSION = 1.0.2
 XAPP_XKBUTILS_SOURCE = xkbutils-$(XAPP_XKBUTILS_VERSION).tar.bz2
 XAPP_XKBUTILS_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XKBUTILS_AUTORECONF = NO
-- 
1.6.3.3
