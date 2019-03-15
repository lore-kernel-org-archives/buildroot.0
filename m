From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 15 Mar 2019 19:02:51 +0100
Subject: [Buildroot] [PATCH 25/31] package/x11r7/xlib_libFS: bump version to
 1.0.8
In-Reply-To: <20190315180256.20256-1-bernd.kuhls@t-online.de>
References: <20190315180256.20256-1-bernd.kuhls@t-online.de>
Message-ID: <20190315180256.20256-25-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added all hashes provided by upstream and license hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xlib_libFS/xlib_libFS.hash | 9 +++++++--
 package/x11r7/xlib_libFS/xlib_libFS.mk   | 2 +-
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xlib_libFS/xlib_libFS.hash b/package/x11r7/xlib_libFS/xlib_libFS.hash
index 786d147b37..c6f168576a 100644
--- a/package/x11r7/xlib_libFS/xlib_libFS.hash
+++ b/package/x11r7/xlib_libFS/xlib_libFS.hash
@@ -1,2 +1,7 @@
-# From http://lists.x.org/archives/xorg-announce/2015-April/002588.html
-sha256	2e9d4c07026a7401d4fa4ffae86e6ac7fec83f50f3268fa85f52718e479dc4f3	libFS-1.0.7.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2019-March/002970.html
+md5 4e1196275aa743d6ebd3d3d5ec1dff9c  libFS-1.0.8.tar.bz2
+sha1 70173cc15a7a55defb7b22b00a9387901acad634  libFS-1.0.8.tar.bz2
+sha256 c8e13727149b2ddfe40912027459b2522042e3844c5cd228c3300fe5eef6bd0f  libFS-1.0.8.tar.bz2
+sha512 466198ae5c0b83e3579713d86ddfd0b039f5c5b511cf6d5dc0e9664ee2d40aec9e8929445c8e97394d85faf76a7cf2f81bddb13d23de7ce19919e3b1e36ba56f  libFS-1.0.8.tar.bz2
+# Locally computed
+sha256 5386724e7475b89394dd836b954a6688f875efab99e43e8eb7e8775f5b99a341  COPYING
diff --git a/package/x11r7/xlib_libFS/xlib_libFS.mk b/package/x11r7/xlib_libFS/xlib_libFS.mk
index 56f2dc3cba..9cc93e0fe1 100644
--- a/package/x11r7/xlib_libFS/xlib_libFS.mk
+++ b/package/x11r7/xlib_libFS/xlib_libFS.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBFS_VERSION = 1.0.7
+XLIB_LIBFS_VERSION = 1.0.8
 XLIB_LIBFS_SOURCE = libFS-$(XLIB_LIBFS_VERSION).tar.bz2
 XLIB_LIBFS_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBFS_LICENSE = MIT
-- 
2.20.1
