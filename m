From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 23 Sep 2019 21:26:47 +0200
Subject: [Buildroot] [PATCH 1/1] package/ccrypt: bump to version 1.11
Message-ID: <20190923192647.17294-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/ccrypt/ccrypt.hash | 3 ++-
 package/ccrypt/ccrypt.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/ccrypt/ccrypt.hash b/package/ccrypt/ccrypt.hash
index a93fcb9afa..4f81c491ed 100644
--- a/package/ccrypt/ccrypt.hash
+++ b/package/ccrypt/ccrypt.hash
@@ -1,2 +1,3 @@
 # Locally computed:
-sha256  87d66da2170facabf6f2fc073586ae2c7320d4689980cfca415c74688e499ba0  ccrypt-1.10.tar.gz
+sha256  b19c47500a96ee5fbd820f704c912f6efcc42b638c0a6aa7a4e3dc0a6b51a44f  ccrypt-1.11.tar.gz
+sha256  d48d3af3cf27b32106ee3418c7c892cae745ece26cd909e72aa59b08e3f9c93d  COPYING
diff --git a/package/ccrypt/ccrypt.mk b/package/ccrypt/ccrypt.mk
index 541a0e776d..f8d6328285 100644
--- a/package/ccrypt/ccrypt.mk
+++ b/package/ccrypt/ccrypt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CCRYPT_VERSION = 1.10
+CCRYPT_VERSION = 1.11
 CCRYPT_SITE = http://ccrypt.sourceforge.net/download/$(CCRYPT_VERSION)
 
 CCRYPT_LICENSE = GPL-2.0+
-- 
2.23.0
