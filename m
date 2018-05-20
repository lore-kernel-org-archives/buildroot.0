From: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
Date: Sun, 20 May 2018 10:08:53 +0200
Subject: [Buildroot] [PATCH] quazip: upgrade to 0.7.5 and the new,
 Github upstream
Message-ID: <1526803733-1486-1-git-send-email-mr.zoltan.gyarmati@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
---
 package/quazip/quazip.hash | 4 ++--
 package/quazip/quazip.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/quazip/quazip.hash b/package/quazip/quazip.hash
index 87bf7c2..4e9af16 100644
--- a/package/quazip/quazip.hash
+++ b/package/quazip/quazip.hash
@@ -1,2 +1,2 @@
-# Locally computed:
-sha256 2ad4f354746e8260d46036cde1496c223ec79765041ea28eb920ced015e269b5 quazip-0.7.3.tar.gz
+# From github release page
+sha256 f3a56647d4706c9daef411e40e3884702e2bd770e980145c3899321788ba8bb2 quazip-0.7.5.tar.gz
diff --git a/package/quazip/quazip.mk b/package/quazip/quazip.mk
index 09037a5..7bef2fe 100644
--- a/package/quazip/quazip.mk
+++ b/package/quazip/quazip.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-QUAZIP_VERSION = 0.7.3
-QUAZIP_SITE = http://sourceforge.net/projects/quazip/files/quazip/$(QUAZIP_VERSION)
+QUAZIP_VERSION = 0.7.5
+QUAZIP_SITE = $(call github,stachenov,quazip,$(QUAZIP_VERSION))
 QUAZIP_INSTALL_STAGING = YES
 QUAZIP_DEPENDENCIES = \
 	zlib \
-- 
2.7.4
