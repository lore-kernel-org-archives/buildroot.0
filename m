From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 28 Aug 2019 23:42:53 +0200
Subject: [Buildroot] [git commit] package/x11r7/xapp_xrandr: bump version to
 1.5.1
Message-ID: <20190903133623.566ED8A52E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=627730e174849efbccb0182c8fab2cf2213115f4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Switched _SOURCE to .xz, added all hashes provided by upstream and
license hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xapp_xrandr/xapp_xrandr.hash | 9 +++++++--
 package/x11r7/xapp_xrandr/xapp_xrandr.mk   | 4 ++--
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xapp_xrandr/xapp_xrandr.hash b/package/x11r7/xapp_xrandr/xapp_xrandr.hash
index b1db30dcd8..408b070dd9 100644
--- a/package/x11r7/xapp_xrandr/xapp_xrandr.hash
+++ b/package/x11r7/xapp_xrandr/xapp_xrandr.hash
@@ -1,2 +1,7 @@
-# From https://lists.freedesktop.org/archives/xorg-announce/2016-February/002677.html
-sha256	c1cfd4e1d4d708c031d60801e527abc9b6d34b85f2ffa2cadd21f75ff38151cd	xrandr-1.5.0.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2019-August/003018.html
+md5 fe40f7a4fd39dd3a02248d3e0b1972e4  xrandr-1.5.1.tar.xz
+sha1 9f72957e0d2a26ece509336ea7e1529cc9ea881e  xrandr-1.5.1.tar.xz
+sha256 7bc76daf9d72f8aff885efad04ce06b90488a1a169d118dea8a2b661832e8762  xrandr-1.5.1.tar.xz
+sha512 3d0d37e974b9dffb996276ee7fd676327fd0956e5f5f572dd142a651a35d3cdfa2f6dd415cf27bf87f306981957aba4cc014c12baebefcabaa5d66b78a114922  xrandr-1.5.1.tar.xz
+# Locally computed
+sha256 0dd9a3d62c48dd7b87790029e39fb5e11756d33fded3bc1644e11585c87b2038  COPYING
diff --git a/package/x11r7/xapp_xrandr/xapp_xrandr.mk b/package/x11r7/xapp_xrandr/xapp_xrandr.mk
index 583a501e4a..8586c6feb3 100644
--- a/package/x11r7/xapp_xrandr/xapp_xrandr.mk
+++ b/package/x11r7/xapp_xrandr/xapp_xrandr.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-XAPP_XRANDR_VERSION = 1.5.0
-XAPP_XRANDR_SOURCE = xrandr-$(XAPP_XRANDR_VERSION).tar.bz2
+XAPP_XRANDR_VERSION = 1.5.1
+XAPP_XRANDR_SOURCE = xrandr-$(XAPP_XRANDR_VERSION).tar.xz
 XAPP_XRANDR_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XRANDR_LICENSE = MIT
 XAPP_XRANDR_LICENSE_FILES = COPYING
