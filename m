From: Will Wagner <will_wagner@carallon.com>
Date: Thu,  1 Apr 2010 13:46:34 +0100
Subject: [Buildroot] [PATCH 04/16] correct name of xapp_xinput.mk
In-Reply-To: <1270126006-22405-1-git-send-email-will_wagner@carallon.com>
References: <1270126006-22405-1-git-send-email-will_wagner@carallon.com>
Message-ID: <1270126006-22405-4-git-send-email-will_wagner@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
 package/x11r7/xapp_xinput/xapp_xbacklight.mk |   13 -------------
 package/x11r7/xapp_xinput/xapp_xinput.mk     |   13 +++++++++++++
 2 files changed, 13 insertions(+), 13 deletions(-)
 delete mode 100644 package/x11r7/xapp_xinput/xapp_xbacklight.mk
 create mode 100644 package/x11r7/xapp_xinput/xapp_xinput.mk

diff --git a/package/x11r7/xapp_xinput/xapp_xbacklight.mk b/package/x11r7/xapp_xinput/xapp_xbacklight.mk
deleted file mode 100644
index 20d23f2..0000000
--- a/package/x11r7/xapp_xinput/xapp_xbacklight.mk
+++ /dev/null
@@ -1,13 +0,0 @@
-################################################################################
-#
-# xapp_xinput -- xinput
-#
-################################################################################
-
-XAPP_XINPUT_VERSION = 1.5.0
-XAPP_XINPUT_SOURCE = xinput-$(XAPP_XINPUT_VERSION).tar.bz2
-XAPP_XINPUT_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_XINPUT_AUTORECONF = NO
-XAPP_XINPUT_DEPENDENCIES = xlib_libX11
-
-$(eval $(call AUTOTARGETS,package/x11r7,xapp_xinput))
diff --git a/package/x11r7/xapp_xinput/xapp_xinput.mk b/package/x11r7/xapp_xinput/xapp_xinput.mk
new file mode 100644
index 0000000..20d23f2
--- /dev/null
+++ b/package/x11r7/xapp_xinput/xapp_xinput.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# xapp_xinput -- xinput
+#
+################################################################################
+
+XAPP_XINPUT_VERSION = 1.5.0
+XAPP_XINPUT_SOURCE = xinput-$(XAPP_XINPUT_VERSION).tar.bz2
+XAPP_XINPUT_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XINPUT_AUTORECONF = NO
+XAPP_XINPUT_DEPENDENCIES = xlib_libX11
+
+$(eval $(call AUTOTARGETS,package/x11r7,xapp_xinput))
-- 
1.7.0
