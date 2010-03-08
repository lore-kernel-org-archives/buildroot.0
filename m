From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Bump xinput to 1.5.0
Message-ID: <20100308133646.4C8F2776E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=18c46966a635e80b18ec34f6226aa650e557cff6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 package/x11r7/xapp_xinput/Config.in          |    2 +-
 package/x11r7/xapp_xinput/xapp_xbacklight.mk |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xapp_xinput/Config.in b/package/x11r7/xapp_xinput/Config.in
index 133499a..3899a9a 100644
--- a/package/x11r7/xapp_xinput/Config.in
+++ b/package/x11r7/xapp_xinput/Config.in
@@ -2,5 +2,5 @@ config BR2_PACKAGE_XAPP_XINPUT
 	bool "xinput"
 	select BR2_PACKAGE_XLIB_LIBX11
 	help
-	  xinput 1.3.0
+	  xinput 1.5.0
 	  xinput
diff --git a/package/x11r7/xapp_xinput/xapp_xbacklight.mk b/package/x11r7/xapp_xinput/xapp_xbacklight.mk
index eb4f1e1..20d23f2 100644
--- a/package/x11r7/xapp_xinput/xapp_xbacklight.mk
+++ b/package/x11r7/xapp_xinput/xapp_xbacklight.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XINPUT_VERSION = 1.3.0
+XAPP_XINPUT_VERSION = 1.5.0
 XAPP_XINPUT_SOURCE = xinput-$(XAPP_XINPUT_VERSION).tar.bz2
 XAPP_XINPUT_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XINPUT_AUTORECONF = NO
-- 
1.6.3.3
