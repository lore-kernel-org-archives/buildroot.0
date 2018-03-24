From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 24 Mar 2018 22:01:06 +0100
Subject: [Buildroot] [git commit] package/x11r7/xapp_xwd: bump version to
 1.0.7
Message-ID: <20180324210429.EA5338135E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7a0293fdb5e2bd5fc1917635c6c7d8b1aa81d695
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Added all upstream hashes, added license hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xapp_xwd/xapp_xwd.hash | 9 +++++++--
 package/x11r7/xapp_xwd/xapp_xwd.mk   | 2 +-
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xapp_xwd/xapp_xwd.hash b/package/x11r7/xapp_xwd/xapp_xwd.hash
index 1d9b4d5cff..606618bcc6 100644
--- a/package/x11r7/xapp_xwd/xapp_xwd.hash
+++ b/package/x11r7/xapp_xwd/xapp_xwd.hash
@@ -1,2 +1,7 @@
-# From http://lists.x.org/archives/xorg-announce/2013-August/002292.html
-sha256	3bb396a2268d78de4b1c3e5237a85f7849d3434e87b3cd1f4d57eef614227d79	xwd-1.0.6.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2018-March/002876.html
+md5 11794a8eba6d295a192a8975287fd947  xwd-1.0.7.tar.bz2
+sha1 65ce0617be29687cf6082c3a0e85d15a0dcccda9  xwd-1.0.7.tar.bz2
+sha256 cd6815b8b9e0b98e284d3d732fb12162159cb9dcee4f45a7d4c0bd8b308a6794  xwd-1.0.7.tar.bz2
+sha512 6fdb0a115ae505169bbc7fcc45580daf26bced2e26e0bf9a877636016038931a8386e8edcbe015f4024be508d0461906adef4834cf22a445e3c282f0b8fad17e  xwd-1.0.7.tar.bz2
+# Locally computed
+sha256 7cfda56afd92a1ecd2f23bd0064e01b5141053390d854785504adfe2c0fbd946 COPYING
diff --git a/package/x11r7/xapp_xwd/xapp_xwd.mk b/package/x11r7/xapp_xwd/xapp_xwd.mk
index 0cda34ee26..4d7ed0f877 100644
--- a/package/x11r7/xapp_xwd/xapp_xwd.mk
+++ b/package/x11r7/xapp_xwd/xapp_xwd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XWD_VERSION = 1.0.6
+XAPP_XWD_VERSION = 1.0.7
 XAPP_XWD_SOURCE = xwd-$(XAPP_XWD_VERSION).tar.bz2
 XAPP_XWD_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XWD_LICENSE = MIT
