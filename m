From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 24 Mar 2019 21:14:40 +0100
Subject: [Buildroot] [PATCH 10/12] package/x11r7/xlib_libxkbfile: bump
 version to 1.1.0
In-Reply-To: <20190324201443.21347-1-bernd.kuhls@t-online.de>
References: <20190324201443.21347-1-bernd.kuhls@t-online.de>
Message-ID: <20190324201443.21347-10-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added all hashes provided by upstream and license hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xlib_libxkbfile/xlib_libxkbfile.hash | 9 +++++++--
 package/x11r7/xlib_libxkbfile/xlib_libxkbfile.mk   | 2 +-
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xlib_libxkbfile/xlib_libxkbfile.hash b/package/x11r7/xlib_libxkbfile/xlib_libxkbfile.hash
index 759b2aef83..03e61bdc5e 100644
--- a/package/x11r7/xlib_libxkbfile/xlib_libxkbfile.hash
+++ b/package/x11r7/xlib_libxkbfile/xlib_libxkbfile.hash
@@ -1,2 +1,7 @@
-# From http://lists.x.org/archives/xorg-announce/2015-April/002592.html
-sha256	51817e0530961975d9513b773960b4edd275f7d5c72293d5a151ed4f42aeb16a	libxkbfile-1.0.9.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2019-March/002977.html
+md5 dd7e1e946def674e78c0efbc5c7d5b3b  libxkbfile-1.1.0.tar.bz2
+sha1 487f314b6dbc17e93d0fe1e3741392156a9ca895  libxkbfile-1.1.0.tar.bz2
+sha256 758dbdaa20add2db4902df0b1b7c936564b7376c02a0acd1f2a331bd334b38c7  libxkbfile-1.1.0.tar.bz2
+sha512 1c6a57564e916ccdc3df3c49b9f3589f701df0cec55112c12ddc35ac3ed556608c28fe98e5ba0ac1962e9a65ed1e90eb7e6169b564951bf55a7cf3499b745826  libxkbfile-1.1.0.tar.bz2
+# Locally computed
+sha256 e1b3fdad8037ab3f986ef9caaa7c8da47d8d55875e680c7d6011f6c07363ea7c  COPYING
diff --git a/package/x11r7/xlib_libxkbfile/xlib_libxkbfile.mk b/package/x11r7/xlib_libxkbfile/xlib_libxkbfile.mk
index 97755fae84..6b68496650 100644
--- a/package/x11r7/xlib_libxkbfile/xlib_libxkbfile.mk
+++ b/package/x11r7/xlib_libxkbfile/xlib_libxkbfile.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBXKBFILE_VERSION = 1.0.9
+XLIB_LIBXKBFILE_VERSION = 1.1.0
 XLIB_LIBXKBFILE_SOURCE = libxkbfile-$(XLIB_LIBXKBFILE_VERSION).tar.bz2
 XLIB_LIBXKBFILE_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXKBFILE_LICENSE = MIT
-- 
2.20.1
