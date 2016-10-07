From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 7 Oct 2016 15:23:35 +0200
Subject: [Buildroot] [git commit] package/x11r7/xlib_libXi: security bump to
	1.7.7
Message-ID: <20161007132630.D851781810@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bd61548a82352aefedee45c745c6034c4c3b75d1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Please see the security advisory for details:
https://lists.x.org/archives/xorg-announce/2016-October/002720.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xlib_libXi/xlib_libXi.hash | 4 ++--
 package/x11r7/xlib_libXi/xlib_libXi.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xlib_libXi/xlib_libXi.hash b/package/x11r7/xlib_libXi/xlib_libXi.hash
index 28eb77e..a11b299 100644
--- a/package/x11r7/xlib_libXi/xlib_libXi.hash
+++ b/package/x11r7/xlib_libXi/xlib_libXi.hash
@@ -1,2 +1,2 @@
-# From http://lists.x.org/archives/xorg-announce/2015-December/002664.html
-sha256	1f32a552cec0f056c0260bdb32e853cec0673d2f40646ce932ad5a9f0205b7ac	libXi-1.7.6.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2016-October/002723.html
+sha256 996f834fa57b9b33ba36690f6f5c6a29320bc8213022943912462d8015b1e030  libXi-1.7.7.tar.bz2
diff --git a/package/x11r7/xlib_libXi/xlib_libXi.mk b/package/x11r7/xlib_libXi/xlib_libXi.mk
index 54c9af4..8dfea0f 100644
--- a/package/x11r7/xlib_libXi/xlib_libXi.mk
+++ b/package/x11r7/xlib_libXi/xlib_libXi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBXI_VERSION = 1.7.6
+XLIB_LIBXI_VERSION = 1.7.7
 XLIB_LIBXI_SOURCE = libXi-$(XLIB_LIBXI_VERSION).tar.bz2
 XLIB_LIBXI_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXI_LICENSE = MIT
