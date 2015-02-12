From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 12 Feb 2015 21:45:29 +0100
Subject: [Buildroot] [git commit branch/next] xdriver_xf86-input-evdev: bump
	version
Message-ID: <20150212205752.A5828805B2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=29125e2556245aa6cc3543af4f44deeb9732778b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

And add hash file.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../xdriver_xf86-input-evdev.hash                  |    2 ++
 .../xdriver_xf86-input-evdev.mk                    |    2 +-
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev.hash b/package/x11r7/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev.hash
new file mode 100644
index 0000000..fb46aca
--- /dev/null
+++ b/package/x11r7/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev.hash
@@ -0,0 +1,2 @@
+# From http://lists.freedesktop.org/archives/xorg/2014-May/056599.html
+sha256 85fade9f5e9cf70f02c877165e95b3df4cdb9e08282416122ca80218e254100c  xf86-input-evdev-2.8.4.tar.bz2
diff --git a/package/x11r7/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev.mk b/package/x11r7/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev.mk
index 46e62c7..a8a9adf 100644
--- a/package/x11r7/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev.mk
+++ b/package/x11r7/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_INPUT_EVDEV_VERSION = 2.8.2
+XDRIVER_XF86_INPUT_EVDEV_VERSION = 2.8.4
 XDRIVER_XF86_INPUT_EVDEV_SOURCE = xf86-input-evdev-$(XDRIVER_XF86_INPUT_EVDEV_VERSION).tar.bz2
 XDRIVER_XF86_INPUT_EVDEV_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_INPUT_EVDEV_LICENSE = MIT
