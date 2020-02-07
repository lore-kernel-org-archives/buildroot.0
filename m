From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 7 Feb 2020 15:54:10 +0100
Subject: [Buildroot] [git commit] package/wpebackend-fdo: bump to version
 1.4.1
Message-ID: <20200207144412.EF1358D4CE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1f027a771bcafbef088006c3f11d3a3ccc0bafa7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is a bugfix release which solves a couple of build issues.
Full release notes:

  https://wpewebkit.org/release/wpebackend-fdo-1.4.1.html

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wpebackend-fdo/wpebackend-fdo.hash | 8 ++++----
 package/wpebackend-fdo/wpebackend-fdo.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/wpebackend-fdo/wpebackend-fdo.hash b/package/wpebackend-fdo/wpebackend-fdo.hash
index 85e02e22a8..fbeed390e6 100644
--- a/package/wpebackend-fdo/wpebackend-fdo.hash
+++ b/package/wpebackend-fdo/wpebackend-fdo.hash
@@ -1,7 +1,7 @@
-# From https://wpewebkit.org/releases/wpebackend-fdo-1.4.0.tar.xz.sums
-md5 63553c3f43593c2a8c587c32e88fdf3c wpebackend-fdo-1.4.0.tar.xz
-sha1 a426d9a778ab52be2f4dd9cc7d324b43abac2f80 wpebackend-fdo-1.4.0.tar.xz
-sha256 a919ca4a5bc445f9419a5b7f3781cfc98e5abcf5d7259eb1869f5ab20fd18baf wpebackend-fdo-1.4.0.tar.xz
+# From https://wpewebkit.org/releases/wpebackend-fdo-1.4.1.tar.xz.sums
+md5 c6362491a4a38ddac42b66f140e1cff2 wpebackend-fdo-1.4.1.tar.xz
+sha1 9217c8a5511bc53544b42cb23390256580ac4b0c wpebackend-fdo-1.4.1.tar.xz
+sha256 6249a0b7cbfa662206a8d2fa24e2c574e75c681ad0e93468091f1dc68ddb299d wpebackend-fdo-1.4.1.tar.xz
 
 # Hashes for license files:
 sha256 c9f6803371047fad3e72200ec6cd226329a5ee08ac61104c8211c2761fb46825 COPYING
diff --git a/package/wpebackend-fdo/wpebackend-fdo.mk b/package/wpebackend-fdo/wpebackend-fdo.mk
index 1f3fc705cc..4a7c569d9c 100644
--- a/package/wpebackend-fdo/wpebackend-fdo.mk
+++ b/package/wpebackend-fdo/wpebackend-fdo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WPEBACKEND_FDO_VERSION = 1.4.0
+WPEBACKEND_FDO_VERSION = 1.4.1
 WPEBACKEND_FDO_SITE = https://wpewebkit.org/releases
 WPEBACKEND_FDO_SOURCE = wpebackend-fdo-$(WPEBACKEND_FDO_VERSION).tar.xz
 WPEBACKEND_FDO_INSTALL_STAGING = YES
