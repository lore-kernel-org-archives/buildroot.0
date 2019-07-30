From: Pierre-Jean Texier <pjtexier@koncepto.io>
Date: Tue, 30 Jul 2019 23:02:38 +0200
Subject: [Buildroot] [PATCH 1/1] package/tinyxml2: bump to version 7.0.1
Message-ID: <1564520558-11051-1-git-send-email-pjtexier@koncepto.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 package/tinyxml2/tinyxml2.hash | 4 ++--
 package/tinyxml2/tinyxml2.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tinyxml2/tinyxml2.hash b/package/tinyxml2/tinyxml2.hash
index 5f38546..88291e4 100644
--- a/package/tinyxml2/tinyxml2.hash
+++ b/package/tinyxml2/tinyxml2.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 cdf0c2179ae7a7931dba52463741cf59024198bbf9673bf08415bcb46344110f  tinyxml2-6.2.0.tar.gz
-sha256 8b2ab0b6ffb86798a2512f45fcf50a3b04b3516782d2e3fb30ebf55dc18c7cce  readme.md
+sha256 a381729e32b6c2916a23544c04f342682d38b3f6e6c0cad3c25e900c3a7ef1a6  tinyxml2-7.0.1.tar.gz
+sha256 35e49ea659da39b72b0e2f38214f9799b548225b0950c8dbb6d183b4c1455263  readme.md
diff --git a/package/tinyxml2/tinyxml2.mk b/package/tinyxml2/tinyxml2.mk
index 9439c5c..7f362f3 100644
--- a/package/tinyxml2/tinyxml2.mk
+++ b/package/tinyxml2/tinyxml2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TINYXML2_VERSION = 6.2.0
+TINYXML2_VERSION = 7.0.1
 TINYXML2_SITE = $(call github,leethomason,tinyxml2,$(TINYXML2_VERSION))
 TINYXML2_LICENSE = Zlib
 TINYXML2_LICENSE_FILES = readme.md
-- 
2.7.4
