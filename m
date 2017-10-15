From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 15 Oct 2017 15:55:09 +0200
Subject: [Buildroot] [git commit] package/x11r7/xlib_libXres: bump version
	to 1.2.0
Message-ID: <20171015134948.B15D0802E0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9112e584bdba07af51f66d9fcd7e603c788e1e96
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Added all hashes provided by upstream.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xlib_libXres/xlib_libXres.hash | 7 +++++--
 package/x11r7/xlib_libXres/xlib_libXres.mk   | 2 +-
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xlib_libXres/xlib_libXres.hash b/package/x11r7/xlib_libXres/xlib_libXres.hash
index 063df8e..12a0351 100644
--- a/package/x11r7/xlib_libXres/xlib_libXres.hash
+++ b/package/x11r7/xlib_libXres/xlib_libXres.hash
@@ -1,2 +1,5 @@
-# From http://lists.x.org/archives/xorg-announce/2013-May/002233.html
-sha256	26899054aa87f81b17becc68e8645b240f140464cf90c42616ebb263ec5fa0e5	libXres-1.0.7.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2017-October/002812.html
+md5 5d6d443d1abc8e1f6fc1c57fb27729bb  libXres-1.2.0.tar.bz2
+sha1 b6996ab05460a3b7311f02da23ddf117a5442fd9  libXres-1.2.0.tar.bz2
+sha256 ff75c1643488e64a7cfbced27486f0f944801319c84c18d3bd3da6bf28c812d4  libXres-1.2.0.tar.bz2
+sha512 8eb5a36b1f030eb4e27e676cc4befcc073da66a7bce2b39089314e1facb629d13b087bb53ca2c95fe5291857da7ff9f80c6ab28fb3e245eeb9e0344937900172  libXres-1.2.0.tar.bz2
diff --git a/package/x11r7/xlib_libXres/xlib_libXres.mk b/package/x11r7/xlib_libXres/xlib_libXres.mk
index 853f542..0075e8f 100644
--- a/package/x11r7/xlib_libXres/xlib_libXres.mk
+++ b/package/x11r7/xlib_libXres/xlib_libXres.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBXRES_VERSION = 1.0.7
+XLIB_LIBXRES_VERSION = 1.2.0
 XLIB_LIBXRES_SOURCE = libXres-$(XLIB_LIBXRES_VERSION).tar.bz2
 XLIB_LIBXRES_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXRES_LICENSE = MIT
