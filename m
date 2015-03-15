From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 15 Mar 2015 14:18:41 +0100
Subject: [Buildroot] [git commit] package/x11r7/xlib_libX11: bump version to
	1.6.3, add hash
Message-ID: <20150315132246.88C53807CD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4b7d0c146e68ea03ae7860c4734223710cdc5709
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xlib_libX11/xlib_libX11.hash |    3 +++
 package/x11r7/xlib_libX11/xlib_libX11.mk   |    2 +-
 2 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xlib_libX11/xlib_libX11.hash b/package/x11r7/xlib_libX11/xlib_libX11.hash
new file mode 100644
index 0000000..acae656
--- /dev/null
+++ b/package/x11r7/xlib_libX11/xlib_libX11.hash
@@ -0,0 +1,3 @@
+# From http://lists.x.org/archives/xorg-announce/2015-March/002543.html
+sha1	6f2aadf8346ee00b7419bd338461c6986e274733				libX11-1.6.3.tar.bz2
+sha256	cf31a7c39f2f52e8ebd0db95640384e63451f9b014eed2bb7f5de03e8adc8111	libX11-1.6.3.tar.bz2
diff --git a/package/x11r7/xlib_libX11/xlib_libX11.mk b/package/x11r7/xlib_libX11/xlib_libX11.mk
index d134fa5..fc19aa1 100644
--- a/package/x11r7/xlib_libX11/xlib_libX11.mk
+++ b/package/x11r7/xlib_libX11/xlib_libX11.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBX11_VERSION = 1.6.2
+XLIB_LIBX11_VERSION = 1.6.3
 XLIB_LIBX11_SOURCE = libX11-$(XLIB_LIBX11_VERSION).tar.bz2
 XLIB_LIBX11_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBX11_LICENSE = MIT
