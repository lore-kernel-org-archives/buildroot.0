From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Tue, 31 May 2016 18:47:31 -0400
Subject: [Buildroot] [PATCH] libconfuse: bump to version 3.0
Message-ID: <1464734851-9627-1-git-send-email-fhunleth@troodon-software.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
---
 package/libconfuse/libconfuse.hash | 5 +++--
 package/libconfuse/libconfuse.mk   | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/libconfuse/libconfuse.hash b/package/libconfuse/libconfuse.hash
index 3e221d2..ec485a1 100644
--- a/package/libconfuse/libconfuse.hash
+++ b/package/libconfuse/libconfuse.hash
@@ -1,2 +1,3 @@
-# From https://github.com/martinh/libconfuse/releases/download/v2.8/confuse-2.8.tar.xz.md5
-md5  cb552c5737a72ef164733f0118971eb0  confuse-2.8.tar.xz
+# From https://github.com/martinh/libconfuse/releases/download/v3.0/confuse-3.0.tar.xz.md5, sha256 locally computed.
+md5  c534b51a2118ed57031dc548032304a3  confuse-3.0.tar.xz
+sha256  bb75174e02aa8b44fa1a872a47beeea1f5fe715ab669694c97803eb6127cc861  confuse-3.0.tar.xz
diff --git a/package/libconfuse/libconfuse.mk b/package/libconfuse/libconfuse.mk
index 1a01896..089e12c 100644
--- a/package/libconfuse/libconfuse.mk
+++ b/package/libconfuse/libconfuse.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCONFUSE_VERSION = 2.8
+LIBCONFUSE_VERSION = 3.0
 LIBCONFUSE_SOURCE = confuse-$(LIBCONFUSE_VERSION).tar.xz
 LIBCONFUSE_SITE = https://github.com/martinh/libconfuse/releases/download/v$(LIBCONFUSE_VERSION)
 LIBCONFUSE_INSTALL_STAGING = YES
-- 
2.5.0
