From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 10 Jul 2018 23:56:07 +0200
Subject: [Buildroot] [git commit] package/x11r7/xlib_libdmx: bump version to
 1.1.4
Message-ID: <20180710215810.B9F5A88317@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0ce56fbdf6469cf9bbda168ffe75480ae811acaa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Added license hash and all hashes provided by upstream.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/x11r7/xlib_libdmx/xlib_libdmx.hash | 9 +++++++--
 package/x11r7/xlib_libdmx/xlib_libdmx.mk   | 2 +-
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xlib_libdmx/xlib_libdmx.hash b/package/x11r7/xlib_libdmx/xlib_libdmx.hash
index 9f715359be..1090e3c2d5 100644
--- a/package/x11r7/xlib_libdmx/xlib_libdmx.hash
+++ b/package/x11r7/xlib_libdmx/xlib_libdmx.hash
@@ -1,2 +1,7 @@
-# From http://lists.freedesktop.org/archives/xorg-announce/2013-May/002225.html
-sha256	c97da36d2e56a2d7b6e4f896241785acc95e97eb9557465fd66ba2a155a7b201	libdmx-1.1.3.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2018-May/002894.html
+md5 d2f1f0ec68ac3932dd7f1d9aa0a7a11c  libdmx-1.1.4.tar.bz2
+sha1 499e2540ca0e94ca858037865243c3c60908fd94  libdmx-1.1.4.tar.bz2
+sha256 253f90005d134fa7a209fbcbc5a3024335367c930adf0f3203e754cf32747243  libdmx-1.1.4.tar.bz2
+sha512 77aba6cadfd17db0cc7e1bc26f14d908223a0fdb135d46f86c3be34e3bc7e2f843f08d4d0ef773357e83b17122bffe56a0442d12908378c05a22177b10ae10e9  libdmx-1.1.4.tar.bz2
+# Locally computed
+sha256 819e8dcd3dd2a44850c350331aa492230f86bccb0983dd739dec5ba36d7d2b8e  COPYING
diff --git a/package/x11r7/xlib_libdmx/xlib_libdmx.mk b/package/x11r7/xlib_libdmx/xlib_libdmx.mk
index fbe3067fe1..01ff493201 100644
--- a/package/x11r7/xlib_libdmx/xlib_libdmx.mk
+++ b/package/x11r7/xlib_libdmx/xlib_libdmx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBDMX_VERSION = 1.1.3
+XLIB_LIBDMX_VERSION = 1.1.4
 XLIB_LIBDMX_SOURCE = libdmx-$(XLIB_LIBDMX_VERSION).tar.bz2
 XLIB_LIBDMX_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBDMX_LICENSE = MIT
