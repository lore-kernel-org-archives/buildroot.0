From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 15 Mar 2015 14:21:17 +0100
Subject: [Buildroot] [git commit] package/x11r7/xlib_libXxf86vm: bump
	version to 1.1.4, add hash
Message-ID: <20150315132246.EEEB4807CD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3ab2fd51ddc3cf232db18a8a9ef85131a565e298
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xlib_libXxf86vm/xlib_libXxf86vm.hash |    3 +++
 package/x11r7/xlib_libXxf86vm/xlib_libXxf86vm.mk   |    2 +-
 2 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xlib_libXxf86vm/xlib_libXxf86vm.hash b/package/x11r7/xlib_libXxf86vm/xlib_libXxf86vm.hash
new file mode 100644
index 0000000..cece6b5
--- /dev/null
+++ b/package/x11r7/xlib_libXxf86vm/xlib_libXxf86vm.hash
@@ -0,0 +1,3 @@
+# From http://lists.x.org/archives/xorg-announce/2015-February/002539.html
+sha1	78ef18ca2be157131899e01c62679e247409a13f				libXxf86vm-1.1.4.tar.bz2
+sha256	afee27f93c5f31c0ad582852c0fb36d50e4de7cd585fcf655e278a633d85cd57	libXxf86vm-1.1.4.tar.bz2
diff --git a/package/x11r7/xlib_libXxf86vm/xlib_libXxf86vm.mk b/package/x11r7/xlib_libXxf86vm/xlib_libXxf86vm.mk
index caa37ac..f650fe4 100644
--- a/package/x11r7/xlib_libXxf86vm/xlib_libXxf86vm.mk
+++ b/package/x11r7/xlib_libXxf86vm/xlib_libXxf86vm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBXXF86VM_VERSION = 1.1.3
+XLIB_LIBXXF86VM_VERSION = 1.1.4
 XLIB_LIBXXF86VM_SOURCE = libXxf86vm-$(XLIB_LIBXXF86VM_VERSION).tar.bz2
 XLIB_LIBXXF86VM_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXXF86VM_LICENSE = MIT
