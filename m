From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 28 Apr 2018 20:57:14 +0200
Subject: [Buildroot] [PATCH 1/1] libconfuse: bump to version 3.2.1
Message-ID: <20180428185714.21252-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libconfuse/libconfuse.hash | 7 ++++---
 package/libconfuse/libconfuse.mk   | 2 +-
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/libconfuse/libconfuse.hash b/package/libconfuse/libconfuse.hash
index 826a9263f5..fa77af9cd1 100644
--- a/package/libconfuse/libconfuse.hash
+++ b/package/libconfuse/libconfuse.hash
@@ -1,4 +1,5 @@
-# From https://github.com/martinh/libconfuse/releases/download/v3.2/confuse-3.2.tar.xz.md5
-md5  84259ac3bd495645ab2fe61654917232  confuse-3.2.tar.xz
+# From https://github.com/martinh/libconfuse/releases/download/v3.2.1/confuse-3.2.1.tar.xz.md5
+md5  ebd66bb669cf43e62a23ed00d475ba67  confuse-3.2.1.tar.xz
 # Locally computed
-sha256  a46abb8696026d314197b6a70ae1a1c296342a9a68aa69b1935709c1477a4e48  confuse-3.1.tar.xz
+sha256  23c63272baf2ef4e2cbbafad2cf57de7eb81f006ec347c00b954819824add25e  confuse-3.2.1.tar.xz
+sha256  dc3ff4b62f851dd2e94a151061ffeb7d28ddfc880a442068dc5283dbaa927306  LICENSE
diff --git a/package/libconfuse/libconfuse.mk b/package/libconfuse/libconfuse.mk
index 431fefd4c7..9f265ae25f 100644
--- a/package/libconfuse/libconfuse.mk
+++ b/package/libconfuse/libconfuse.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCONFUSE_VERSION = 3.2
+LIBCONFUSE_VERSION = 3.2.1
 LIBCONFUSE_SOURCE = confuse-$(LIBCONFUSE_VERSION).tar.xz
 LIBCONFUSE_SITE = https://github.com/martinh/libconfuse/releases/download/v$(LIBCONFUSE_VERSION)
 LIBCONFUSE_INSTALL_STAGING = YES
-- 
2.14.1
