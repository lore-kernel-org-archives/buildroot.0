From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 9 Apr 2021 21:17:56 +0200
Subject: [Buildroot] [git commit] package/x11r7/xlib_libXres: bump version
 to 1.2.1
Message-ID: <20210409185753.2984B82B7C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=248fdccce44c221c28b77bac638729b7735067dc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://lists.x.org/archives/xorg-announce/2021-March/003078.html

Reformatted hashes.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xlib_libXres/xlib_libXres.hash | 10 ++++------
 package/x11r7/xlib_libXres/xlib_libXres.mk   |  2 +-
 2 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/package/x11r7/xlib_libXres/xlib_libXres.hash b/package/x11r7/xlib_libXres/xlib_libXres.hash
index ee4823c1a4..700590ad8c 100644
--- a/package/x11r7/xlib_libXres/xlib_libXres.hash
+++ b/package/x11r7/xlib_libXres/xlib_libXres.hash
@@ -1,8 +1,6 @@
-# From https://lists.x.org/archives/xorg-announce/2017-October/002812.html
-md5 5d6d443d1abc8e1f6fc1c57fb27729bb  libXres-1.2.0.tar.bz2
-sha1 b6996ab05460a3b7311f02da23ddf117a5442fd9  libXres-1.2.0.tar.bz2
-sha256 ff75c1643488e64a7cfbced27486f0f944801319c84c18d3bd3da6bf28c812d4  libXres-1.2.0.tar.bz2
-sha512 8eb5a36b1f030eb4e27e676cc4befcc073da66a7bce2b39089314e1facb629d13b087bb53ca2c95fe5291857da7ff9f80c6ab28fb3e245eeb9e0344937900172  libXres-1.2.0.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2021-March/003078.html
+sha256  b6e6fb1ebb61610e56017edd928fb89a5f53b3f4f990078309877468663b2b11  libXres-1.2.1.tar.bz2
+sha512  c17d28406e17e305dc4976f095e88059735f5bd8c600adf2e556523c9e0dd7fa01dcbf7a9d28a642e77e49a5b30f54bb9b2fc34bfbedce467ee2a020bba5cdf1  libXres-1.2.1.tar.bz2
 
 # Locally calculated
-sha256 0d7300168f85833ea2564835f66a61e036ede90b33e76c06a7b4078096fedbcc  COPYING
+sha256  0d7300168f85833ea2564835f66a61e036ede90b33e76c06a7b4078096fedbcc  COPYING
diff --git a/package/x11r7/xlib_libXres/xlib_libXres.mk b/package/x11r7/xlib_libXres/xlib_libXres.mk
index 72f2ec4424..1a03745fcf 100644
--- a/package/x11r7/xlib_libXres/xlib_libXres.mk
+++ b/package/x11r7/xlib_libXres/xlib_libXres.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBXRES_VERSION = 1.2.0
+XLIB_LIBXRES_VERSION = 1.2.1
 XLIB_LIBXRES_SOURCE = libXres-$(XLIB_LIBXRES_VERSION).tar.bz2
 XLIB_LIBXRES_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXRES_LICENSE = MIT
