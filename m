From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 15 May 2021 13:32:51 +0200
Subject: [Buildroot] [git commit] package/x11r7/xlib_libFS: add CPE variables
Message-ID: <20210515111141.C09EA83B57@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9784dcb385291e45d1bd83e200243a91febb9969
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:x:libfs is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Ax%3Alibfs

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/x11r7/xlib_libFS/xlib_libFS.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/x11r7/xlib_libFS/xlib_libFS.mk b/package/x11r7/xlib_libFS/xlib_libFS.mk
index 9cc93e0fe1..9d9aecb74f 100644
--- a/package/x11r7/xlib_libFS/xlib_libFS.mk
+++ b/package/x11r7/xlib_libFS/xlib_libFS.mk
@@ -9,6 +9,8 @@ XLIB_LIBFS_SOURCE = libFS-$(XLIB_LIBFS_VERSION).tar.bz2
 XLIB_LIBFS_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBFS_LICENSE = MIT
 XLIB_LIBFS_LICENSE_FILES = COPYING
+XLIB_LIBFS_CPE_ID_VENDOR = x
+XLIB_LIBFS_CPE_ID_PRODUCT = libfs
 XLIB_LIBFS_INSTALL_STAGING = YES
 XLIB_LIBFS_DEPENDENCIES = xlib_xtrans xorgproto host-pkgconf
 XLIB_LIBFS_CONF_OPTS = --disable-malloc0returnsnull
