From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Oct 2016 15:15:00 +0200
Subject: [Buildroot] [git commit] package/x11r7/xlib_libXi: bump version to
	1.7.8
Message-ID: <20161029131519.663D78045D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=af59e77d04ca69f02f6de09aa3933c4839bd8e7b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xlib_libXi/xlib_libXi.hash | 4 ++--
 package/x11r7/xlib_libXi/xlib_libXi.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xlib_libXi/xlib_libXi.hash b/package/x11r7/xlib_libXi/xlib_libXi.hash
index a11b299..e7a4032 100644
--- a/package/x11r7/xlib_libXi/xlib_libXi.hash
+++ b/package/x11r7/xlib_libXi/xlib_libXi.hash
@@ -1,2 +1,2 @@
-# From https://lists.x.org/archives/xorg-announce/2016-October/002723.html
-sha256 996f834fa57b9b33ba36690f6f5c6a29320bc8213022943912462d8015b1e030  libXi-1.7.7.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2016-October/002733.html
+sha256 d8f2fa8d53141c41ff521627df9b2fa9c05f6f142fd9881152bab36549ac27bb  libXi-1.7.8.tar.bz2
diff --git a/package/x11r7/xlib_libXi/xlib_libXi.mk b/package/x11r7/xlib_libXi/xlib_libXi.mk
index 8dfea0f..de680ea 100644
--- a/package/x11r7/xlib_libXi/xlib_libXi.mk
+++ b/package/x11r7/xlib_libXi/xlib_libXi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBXI_VERSION = 1.7.7
+XLIB_LIBXI_VERSION = 1.7.8
 XLIB_LIBXI_SOURCE = libXi-$(XLIB_LIBXI_VERSION).tar.bz2
 XLIB_LIBXI_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXI_LICENSE = MIT
