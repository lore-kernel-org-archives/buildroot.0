From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 27 Nov 2016 12:06:04 +0100
Subject: [Buildroot] [PATCH/next 01/13]
	package/x11r7/xdriver_xf86-input-joystick: bump version to 1.6.3
Message-ID: <20161127110616.3451-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../xdriver_xf86-input-joystick/xdriver_xf86-input-joystick.hash      | 4 ++--
 .../x11r7/xdriver_xf86-input-joystick/xdriver_xf86-input-joystick.mk  | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-input-joystick/xdriver_xf86-input-joystick.hash b/package/x11r7/xdriver_xf86-input-joystick/xdriver_xf86-input-joystick.hash
index 5fac77e..feec2d3 100644
--- a/package/x11r7/xdriver_xf86-input-joystick/xdriver_xf86-input-joystick.hash
+++ b/package/x11r7/xdriver_xf86-input-joystick/xdriver_xf86-input-joystick.hash
@@ -1,2 +1,2 @@
-# From http://lists.x.org/archives/xorg-announce/2013-January/002136.html
-sha1	61658b8d829fdaed6064c7c26232c3884d359187	xf86-input-joystick-1.6.2.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2016-November/002742.html
+sha256 9e7669ecf0f23b8e5dc39d5397cf28296f692aa4c0e4255f5e02816612c18eab  xf86-input-joystick-1.6.3.tar.bz2
diff --git a/package/x11r7/xdriver_xf86-input-joystick/xdriver_xf86-input-joystick.mk b/package/x11r7/xdriver_xf86-input-joystick/xdriver_xf86-input-joystick.mk
index 76f2577..5bc2a5c 100644
--- a/package/x11r7/xdriver_xf86-input-joystick/xdriver_xf86-input-joystick.mk
+++ b/package/x11r7/xdriver_xf86-input-joystick/xdriver_xf86-input-joystick.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_INPUT_JOYSTICK_VERSION = 1.6.2
+XDRIVER_XF86_INPUT_JOYSTICK_VERSION = 1.6.3
 XDRIVER_XF86_INPUT_JOYSTICK_SOURCE = xf86-input-joystick-$(XDRIVER_XF86_INPUT_JOYSTICK_VERSION).tar.bz2
 XDRIVER_XF86_INPUT_JOYSTICK_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_INPUT_JOYSTICK_LICENSE = MIT
-- 
2.10.2
