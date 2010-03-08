From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Bump xlsatoms to 1.0.2
Message-ID: <20100308133647.954D7776E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=776aafa0d8517a55c539ee55b406882440f47df1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 package/x11r7/xapp_xlsatoms/Config.in        |    2 +-
 package/x11r7/xapp_xlsatoms/xapp_xlsatoms.mk |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xapp_xlsatoms/Config.in b/package/x11r7/xapp_xlsatoms/Config.in
index 3cd0cbe..b974641 100644
--- a/package/x11r7/xapp_xlsatoms/Config.in
+++ b/package/x11r7/xapp_xlsatoms/Config.in
@@ -3,5 +3,5 @@ config BR2_PACKAGE_XAPP_XLSATOMS
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXMU
 	help
-	  xlsatoms 1.0.1
+	  xlsatoms 1.0.2
 	  list interned atoms defined on server
diff --git a/package/x11r7/xapp_xlsatoms/xapp_xlsatoms.mk b/package/x11r7/xapp_xlsatoms/xapp_xlsatoms.mk
index 2ffa3c2..d202114 100644
--- a/package/x11r7/xapp_xlsatoms/xapp_xlsatoms.mk
+++ b/package/x11r7/xapp_xlsatoms/xapp_xlsatoms.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XLSATOMS_VERSION = 1.0.1
+XAPP_XLSATOMS_VERSION = 1.0.2
 XAPP_XLSATOMS_SOURCE = xlsatoms-$(XAPP_XLSATOMS_VERSION).tar.bz2
 XAPP_XLSATOMS_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XLSATOMS_AUTORECONF = NO
-- 
1.6.3.3
