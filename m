From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 10 Jul 2018 23:56:06 +0200
Subject: [Buildroot] [git commit] package/x11r7/xlib_libXinerama: bump
 version to 1.1.4
Message-ID: <20180710215810.B1EEF88316@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=72f28b266a9caff8f630e9add108256c2df889d6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Added license hash and all hashes provided by upstream.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/x11r7/xlib_libXinerama/xlib_libXinerama.hash | 9 +++++++--
 package/x11r7/xlib_libXinerama/xlib_libXinerama.mk   | 2 +-
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xlib_libXinerama/xlib_libXinerama.hash b/package/x11r7/xlib_libXinerama/xlib_libXinerama.hash
index 6dfd7770d2..995181dd16 100644
--- a/package/x11r7/xlib_libXinerama/xlib_libXinerama.hash
+++ b/package/x11r7/xlib_libXinerama/xlib_libXinerama.hash
@@ -1,2 +1,7 @@
-# From http://lists.x.org/archives/xorg-announce/2013-May/002231.html
-sha256	7a45699f1773095a3f821e491cbd5e10c887c5a5fce5d8d3fced15c2ff7698e2	libXinerama-1.1.3.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2018-July/002905.html
+md5 0d5f826a197dae74da67af4a9ef35885  libXinerama-1.1.4.tar.bz2
+sha1 34a1d9908ffbd46805d2357c6b05f5e341a8dc7c  libXinerama-1.1.4.tar.bz2
+sha256 0008dbd7ecf717e1e507eed1856ab0d9cf946d03201b85d5dcf61489bb02d720  libXinerama-1.1.4.tar.bz2
+sha512 cff777ad942614fbf6bc6d8529f399e62debf3ecbf6cc0694a94e38c022bf929ffd5636fb59f55533c394d89b23af3ea51fa5128927f12a85787e16239330f14  libXinerama-1.1.4.tar.bz2
+# Locally computed
+sha256 f661fd883b6e980b3b118e0fbe230fbf10eef8d4d4a35931355f29ed647ddbe3  COPYING
diff --git a/package/x11r7/xlib_libXinerama/xlib_libXinerama.mk b/package/x11r7/xlib_libXinerama/xlib_libXinerama.mk
index ee8bf55602..3c2a505bc8 100644
--- a/package/x11r7/xlib_libXinerama/xlib_libXinerama.mk
+++ b/package/x11r7/xlib_libXinerama/xlib_libXinerama.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBXINERAMA_VERSION = 1.1.3
+XLIB_LIBXINERAMA_VERSION = 1.1.4
 XLIB_LIBXINERAMA_SOURCE = libXinerama-$(XLIB_LIBXINERAMA_VERSION).tar.bz2
 XLIB_LIBXINERAMA_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXINERAMA_LICENSE = MIT
