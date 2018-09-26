From: Zoltan Gyarmati <zgyarmati@zgyarmati.de>
Date: Wed, 26 Sep 2018 23:08:55 +0200
Subject: [Buildroot] [PATCH] quazip: upgrade to 0.7.6
Message-ID: <20180926210855.8746-1-zgyarmati@zgyarmati.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Zoltan Gyarmati <zgyarmati@zgyarmati.de>
---
 package/quazip/quazip.hash | 2 +-
 package/quazip/quazip.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/quazip/quazip.hash b/package/quazip/quazip.hash
index 4e9af16a1a..9f43643d6b 100644
--- a/package/quazip/quazip.hash
+++ b/package/quazip/quazip.hash
@@ -1,2 +1,2 @@
 # From github release page
-sha256 f3a56647d4706c9daef411e40e3884702e2bd770e980145c3899321788ba8bb2 quazip-0.7.5.tar.gz
+sha256 4118a830a375a81211956611cc34b1b5b4ddc108c126287b91b40c2493046b70 quazip-0.7.6.tar.gz
diff --git a/package/quazip/quazip.mk b/package/quazip/quazip.mk
index 7bef2fe7d9..872340ab40 100644
--- a/package/quazip/quazip.mk
+++ b/package/quazip/quazip.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QUAZIP_VERSION = 0.7.5
+QUAZIP_VERSION = 0.7.6
 QUAZIP_SITE = $(call github,stachenov,quazip,$(QUAZIP_VERSION))
 QUAZIP_INSTALL_STAGING = YES
 QUAZIP_DEPENDENCIES = \
-- 
2.17.1
