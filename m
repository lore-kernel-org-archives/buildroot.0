From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 22 Jun 2019 20:11:51 +0200
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xlib_libXi: bump version to
 1.7.10
Message-ID: <20190622181151.26793-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added all hashes provided by upstream, added license hash.

Switched _SITE to https.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xlib_libXi/xlib_libXi.hash | 9 +++++++--
 package/x11r7/xlib_libXi/xlib_libXi.mk   | 4 ++--
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xlib_libXi/xlib_libXi.hash b/package/x11r7/xlib_libXi/xlib_libXi.hash
index 9f2c3e30b7..1235631321 100644
--- a/package/x11r7/xlib_libXi/xlib_libXi.hash
+++ b/package/x11r7/xlib_libXi/xlib_libXi.hash
@@ -1,2 +1,7 @@
-# From https://lists.x.org/archives/xorg-announce/2017-January/002768.html
-sha256 c2e6b8ff84f9448386c1b5510a5cf5a16d788f76db018194dacdc200180faf45  libXi-1.7.9.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2019-June/002999.html
+md5 62c4af0839072024b4b1c8cbe84216c7  libXi-1.7.10.tar.bz2
+sha1 79052e50ea07ce2431f8988a60553d9091d46207  libXi-1.7.10.tar.bz2
+sha256 36a30d8f6383a72e7ce060298b4b181fd298bc3a135c8e201b7ca847f5f81061  libXi-1.7.10.tar.bz2
+sha512 591f0860bf5904897587c4990d6c852f3729a212d1ef390362d41242440e078221877c31db2232d5cc81727fe97f4e194b077f7de917e251e60641bbd06ee218  libXi-1.7.10.tar.bz2
+# Locally computed
+sha256 9392174bc86e291369fd2f61f3ed325962735a5f5c585ce8d7ebd365e2a5639f  COPYING
diff --git a/package/x11r7/xlib_libXi/xlib_libXi.mk b/package/x11r7/xlib_libXi/xlib_libXi.mk
index 2833738911..de7f3a7d3c 100644
--- a/package/x11r7/xlib_libXi/xlib_libXi.mk
+++ b/package/x11r7/xlib_libXi/xlib_libXi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XLIB_LIBXI_VERSION = 1.7.9
+XLIB_LIBXI_VERSION = 1.7.10
 XLIB_LIBXI_SOURCE = libXi-$(XLIB_LIBXI_VERSION).tar.bz2
-XLIB_LIBXI_SITE = http://xorg.freedesktop.org/releases/individual/lib
+XLIB_LIBXI_SITE = https://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXI_LICENSE = MIT
 XLIB_LIBXI_LICENSE_FILES = COPYING
 XLIB_LIBXI_INSTALL_STAGING = YES
-- 
2.20.1
