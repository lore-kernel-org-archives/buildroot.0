From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 8 Aug 2020 18:18:42 +0200
Subject: [Buildroot] [git commit branch/next] package/x11r7/xlib_libX11:
 bump version to 1.6.11
Message-ID: <20200812144328.8F88885F4A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=de47f7b494b795c4efe020e976af51b4b6b73dcb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Reformatted license hash.

Quoting release notes:
https://lists.x.org/archives/xorg-announce/2020-August/003053.html
"This release fixes a regression introduced by the security patches in
 1.6.10.
 See https://gitlab.freedesktop.org/xorg/lib/libx11/-/issues/116 for
 details."

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/x11r7/xlib_libX11/xlib_libX11.hash | 9 +++++----
 package/x11r7/xlib_libX11/xlib_libX11.mk   | 2 +-
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xlib_libX11/xlib_libX11.hash b/package/x11r7/xlib_libX11/xlib_libX11.hash
index d383615457..b77f98dfb1 100644
--- a/package/x11r7/xlib_libX11/xlib_libX11.hash
+++ b/package/x11r7/xlib_libX11/xlib_libX11.hash
@@ -1,5 +1,6 @@
-# From https://lists.x.org/archives/xorg-announce/2020-July/003052.html
-sha256  af48626989b8515c994777896bd7b7ba2bd5b1ef4e1efaee0a55d8852bbe6226  libX11-1.6.10.tar.bz2
-sha512  ad384d8896fbe587f7fd99b0d3cc56fac6e2facbab52fa99174200d06b19dd163a483c998acf3834b3a4a3aa4de0dbbe13919a1c80e6797afe467c7075b403ff  libX11-1.6.10.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2020-August/003053.html
+sha256  b1cc4b802058be7e3fb438ee2490f66fcc52ac3b2a14f47a22cbf77638e33606  libX11-1.6.11.tar.bz2
+sha512  2cb4e215c1e3ccb327e02586844f8c426068536a0f472a39f12191feace607f61a6a08586f03758248199678c2f6897a984b0f1222bc0d68fd2e02702f4ce0bf  libX11-1.6.11.tar.bz2
+
 # Locally computed
-sha256 2daec087a88e7c9b8082557cdeebad5bbb8155a4137472f0b22e269cd99d0c1e  COPYING
+sha256  2daec087a88e7c9b8082557cdeebad5bbb8155a4137472f0b22e269cd99d0c1e  COPYING
diff --git a/package/x11r7/xlib_libX11/xlib_libX11.mk b/package/x11r7/xlib_libX11/xlib_libX11.mk
index bfc1c4166e..b0132efd31 100644
--- a/package/x11r7/xlib_libX11/xlib_libX11.mk
+++ b/package/x11r7/xlib_libX11/xlib_libX11.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBX11_VERSION = 1.6.10
+XLIB_LIBX11_VERSION = 1.6.11
 XLIB_LIBX11_SOURCE = libX11-$(XLIB_LIBX11_VERSION).tar.bz2
 XLIB_LIBX11_SITE = https://xorg.freedesktop.org/archive/individual/lib
 XLIB_LIBX11_LICENSE = MIT
