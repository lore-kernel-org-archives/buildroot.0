From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 28 Sep 2019 21:50:48 +0200
Subject: [Buildroot] [git commit] package/x11r7/xlib_libXfont2: bump version
 to 2.0.4
Message-ID: <20190928194545.1C289814EC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=67d8711d522f012a0e4f8b9d26b54b8760571b86
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/x11r7/xlib_libXfont2/xlib_libXfont2.hash | 10 +++++-----
 package/x11r7/xlib_libXfont2/xlib_libXfont2.mk   |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/x11r7/xlib_libXfont2/xlib_libXfont2.hash b/package/x11r7/xlib_libXfont2/xlib_libXfont2.hash
index 072d5ced34..634affdfdb 100644
--- a/package/x11r7/xlib_libXfont2/xlib_libXfont2.hash
+++ b/package/x11r7/xlib_libXfont2/xlib_libXfont2.hash
@@ -1,8 +1,8 @@
-# From https://lists.x.org/archives/xorg-announce/2017-November/002824.html
-md5  b7ca87dfafeb5205b28a1e91ac3efe85  libXfont2-2.0.3.tar.bz2
-sha1 1110f1ad4061d9e8131ecb941757480e3e32bca0  libXfont2-2.0.3.tar.bz2
-sha256 0e8ab7fd737ccdfe87e1f02b55f221f0bd4503a1c5f28be4ed6a54586bac9c4e  libXfont2-2.0.3.tar.bz2
-sha512 648b664e2aa58cbc7366a1b05873aa06bd4a38060f64085783043388244af8ceced77b29a22c3ac8b6d34cd226e093bbbcc785ea1748ea65720fe7ea05b4b44b  libXfont2-2.0.3.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2019-September/003022.html
+md5 00516bed7ec1453d56974560379fff2f  libXfont2-2.0.4.tar.bz2
+sha1 9e00ae7589315656435efaf330128facad7c4a57  libXfont2-2.0.4.tar.bz2
+sha256 6d151b3368e5035efede4b6264c0fdc6662c1c99dbc2de425e3480cababc69e6  libXfont2-2.0.4.tar.bz2
+sha512 7cf6c58e520e48e24fc4f05fec760fcbeaaac0cedeed57dded262c855e1515cc34cd033222945a0b016f6857b83009fc2a6946c7d632c2f7bb0060f8e8a8a106  libXfont2-2.0.4.tar.bz2
 
 # Locally calculated
 sha256 97e413bb4962bbb5773085cd5405502bf1d4eadeaf98ff5be015eacacc840462  COPYING
diff --git a/package/x11r7/xlib_libXfont2/xlib_libXfont2.mk b/package/x11r7/xlib_libXfont2/xlib_libXfont2.mk
index 65adf665bd..cc3f474c64 100644
--- a/package/x11r7/xlib_libXfont2/xlib_libXfont2.mk
+++ b/package/x11r7/xlib_libXfont2/xlib_libXfont2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBXFONT2_VERSION = 2.0.3
+XLIB_LIBXFONT2_VERSION = 2.0.4
 XLIB_LIBXFONT2_SOURCE = libXfont2-$(XLIB_LIBXFONT2_VERSION).tar.bz2
 XLIB_LIBXFONT2_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXFONT2_LICENSE = MIT
