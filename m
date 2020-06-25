From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Thu, 25 Jun 2020 09:36:36 -0400
Subject: [Buildroot] [PATCH 1/1] package/libconfuse: bump version to 3.3
Message-ID: <20200625133636.1394588-1-fhunleth@troodon-software.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This fixes a possible loop-forever bug.

Release notes:
https://github.com/martinh/libconfuse/releases/tag/v3.3

Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
---
 package/libconfuse/libconfuse.hash | 6 +++---
 package/libconfuse/libconfuse.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libconfuse/libconfuse.hash b/package/libconfuse/libconfuse.hash
index adc93f99a3..bb968f7a52 100644
--- a/package/libconfuse/libconfuse.hash
+++ b/package/libconfuse/libconfuse.hash
@@ -1,5 +1,5 @@
-# From https://github.com/martinh/libconfuse/releases/download/v3.2.2/confuse-3.2.2.tar.xz.md5
-md5  978996e421e5005e6a9f6f84948fac44  confuse-3.2.2.tar.xz
+# From https://github.com/martinh/libconfuse/releases/download/v3.3/confuse-3.3.tar.xz.md5
+md5  a183cef2cecdd3783436ff8de500d274  confuse-3.3.tar.xz
 # Locally computed
-sha256  a9240b653d02e8cfc52db48e8c4224426e528e1faa09b65e8ca08a197fad210b  confuse-3.2.2.tar.xz
+sha256  1dd50a0320e135a55025b23fcdbb3f0a81913b6d0b0a9df8cc2fdf3b3dc67010  confuse-3.3.tar.xz
 sha256  dc3ff4b62f851dd2e94a151061ffeb7d28ddfc880a442068dc5283dbaa927306  LICENSE
diff --git a/package/libconfuse/libconfuse.mk b/package/libconfuse/libconfuse.mk
index b16bc9b7a7..516c0056d1 100644
--- a/package/libconfuse/libconfuse.mk
+++ b/package/libconfuse/libconfuse.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCONFUSE_VERSION = 3.2.2
+LIBCONFUSE_VERSION = 3.3
 LIBCONFUSE_SOURCE = confuse-$(LIBCONFUSE_VERSION).tar.xz
 LIBCONFUSE_SITE = https://github.com/martinh/libconfuse/releases/download/v$(LIBCONFUSE_VERSION)
 LIBCONFUSE_INSTALL_STAGING = YES
-- 
2.25.1
