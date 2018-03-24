From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 24 Mar 2018 22:00:13 +0100
Subject: [Buildroot] [git commit] package/x11r7/xapp_xpr: bump version to
 1.0.5
Message-ID: <20180324210428.C96BB806A5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c1aea5e8995f4e7d2e2d50ae9f779e9eaf94dde4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Added all upstream hashes, added license hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xapp_xpr/xapp_xpr.hash | 9 +++++++--
 package/x11r7/xapp_xpr/xapp_xpr.mk   | 2 +-
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xapp_xpr/xapp_xpr.hash b/package/x11r7/xapp_xpr/xapp_xpr.hash
index eaab288ced..0a1b4f81b9 100644
--- a/package/x11r7/xapp_xpr/xapp_xpr.hash
+++ b/package/x11r7/xapp_xpr/xapp_xpr.hash
@@ -1,2 +1,7 @@
-# From http://lists.x.org/archives/xorg-announce/2012-March/001926.html
-sha256	fed98df31eb93d3dca4688cb535aabad06be572e70ace3b1685679c18dd86cb5	xpr-1.0.4.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2018-March/002869.html
+md5 eaac255076ea351fd08d76025788d9f9  xpr-1.0.5.tar.bz2
+sha1 0632c7d8632ac9d23f285811aaea805a2956e155  xpr-1.0.5.tar.bz2
+sha256 b936e0f1f8d63f5ad097a0bbdce2e67c34f5d49b7263f32a832ff62d394d1e1f  xpr-1.0.5.tar.bz2
+sha512 d5dfb936ec4ad0067d02654dec8e862fe337ff6a2c2f974b2b3a612a829c2e728a0d51e7aba00ed2a94dc96dc50cc69f2c59f522e0635013f5f4f5bb3f4ab967  xpr-1.0.5.tar.bz2
+# Locally computed
+sha256 5e8ff9b5d3fc86b5d0bc5957c9ee0aa1a6d0fb9a6b116aae70762b628a0d5069 COPYING
diff --git a/package/x11r7/xapp_xpr/xapp_xpr.mk b/package/x11r7/xapp_xpr/xapp_xpr.mk
index b2c4e040c3..b77c5b4844 100644
--- a/package/x11r7/xapp_xpr/xapp_xpr.mk
+++ b/package/x11r7/xapp_xpr/xapp_xpr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XPR_VERSION = 1.0.4
+XAPP_XPR_VERSION = 1.0.5
 XAPP_XPR_SOURCE = xpr-$(XAPP_XPR_VERSION).tar.bz2
 XAPP_XPR_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XPR_LICENSE = MIT
