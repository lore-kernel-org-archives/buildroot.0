From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Bump sessreg to 1.0.5
Message-ID: <20100308133642.CCF0B776ED@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=137e6dabba1084b02ba4b172c9f7fbf59e030acc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 package/x11r7/xapp_sessreg/Config.in       |    2 +-
 package/x11r7/xapp_sessreg/xapp_sessreg.mk |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xapp_sessreg/Config.in b/package/x11r7/xapp_sessreg/Config.in
index 20f1915..9d70886 100644
--- a/package/x11r7/xapp_sessreg/Config.in
+++ b/package/x11r7/xapp_sessreg/Config.in
@@ -3,5 +3,5 @@ config BR2_PACKAGE_XAPP_SESSREG
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XPROTO_XPROTO
 	help
-	  sessreg 1.0.2
+	  sessreg 1.0.5
 	  manage utmp/wtmp entries for non-init clients
diff --git a/package/x11r7/xapp_sessreg/xapp_sessreg.mk b/package/x11r7/xapp_sessreg/xapp_sessreg.mk
index 7ffad79..699537d 100644
--- a/package/x11r7/xapp_sessreg/xapp_sessreg.mk
+++ b/package/x11r7/xapp_sessreg/xapp_sessreg.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_SESSREG_VERSION = 1.0.4
+XAPP_SESSREG_VERSION = 1.0.5
 XAPP_SESSREG_SOURCE = sessreg-$(XAPP_SESSREG_VERSION).tar.bz2
 XAPP_SESSREG_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_SESSREG_AUTORECONF = NO
-- 
1.6.3.3
