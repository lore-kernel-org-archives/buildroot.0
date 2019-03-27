From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 27 Mar 2019 23:04:11 +0100
Subject: [Buildroot] [git commit branch/2019.02.x]
 package/x11r7/xlib_libXdmcp: security bump version to 1.1.3
Message-ID: <20190327220219.CFC2D83ACF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a6a3768a2f0d4a6c4ef6fa2ddcdce13e6384b8f5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Fixes CVE-2017-2625:
https://lists.x.org/archives/xorg-announce/2019-March/002974.html

Added all hashes provided by upstream and license hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 8a60253925c7730f3b9ca65edf38c729192b27b5)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xlib_libXdmcp/xlib_libXdmcp.hash | 9 +++++++--
 package/x11r7/xlib_libXdmcp/xlib_libXdmcp.mk   | 2 +-
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xlib_libXdmcp/xlib_libXdmcp.hash b/package/x11r7/xlib_libXdmcp/xlib_libXdmcp.hash
index 6b50cb1c79..0dbea635f2 100644
--- a/package/x11r7/xlib_libXdmcp/xlib_libXdmcp.hash
+++ b/package/x11r7/xlib_libXdmcp/xlib_libXdmcp.hash
@@ -1,2 +1,7 @@
-# From http://lists.x.org/archives/xorg-announce/2015-March/002554.html
-sha256	81fe09867918fff258296e1e1e159f0dc639cb30d201c53519f25ab73af4e4e2	libXdmcp-1.1.2.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2019-March/002974.html
+md5 115c5c12ecce0e749cd91d999a5fd160  libXdmcp-1.1.3.tar.bz2
+sha1 0a8f8a274f829331efb1e8e2027c38631b204dd0  libXdmcp-1.1.3.tar.bz2
+sha256 20523b44aaa513e17c009e873ad7bbc301507a3224c232610ce2e099011c6529  libXdmcp-1.1.3.tar.bz2
+sha512 cb1d4650f97d66e73acd2465ec7d757b9b797cce2f85e301860a44997a461837eea845ec9bd5b639ec5ca34c804f8bdd870697a5ce3f4e270b687c9ef74f25ec  libXdmcp-1.1.3.tar.bz2
+# Locally computed
+sha256 8a3c3f35b0dbcb60a4e242b9e4394a352a65bb27deb2938ea1e2e62a626e16e9  COPYING
diff --git a/package/x11r7/xlib_libXdmcp/xlib_libXdmcp.mk b/package/x11r7/xlib_libXdmcp/xlib_libXdmcp.mk
index 44a6f00543..1182903e87 100644
--- a/package/x11r7/xlib_libXdmcp/xlib_libXdmcp.mk
+++ b/package/x11r7/xlib_libXdmcp/xlib_libXdmcp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBXDMCP_VERSION = 1.1.2
+XLIB_LIBXDMCP_VERSION = 1.1.3
 XLIB_LIBXDMCP_SOURCE = libXdmcp-$(XLIB_LIBXDMCP_VERSION).tar.bz2
 XLIB_LIBXDMCP_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXDMCP_LICENSE = MIT
