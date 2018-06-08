From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri,  8 Jun 2018 19:05:55 +0200
Subject: [Buildroot] [PATCH 1/1] tinyxml2: bump to version 6.2.0
Message-ID: <20180608170555.5226-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/tinyxml2/tinyxml2.hash | 3 ++-
 package/tinyxml2/tinyxml2.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/tinyxml2/tinyxml2.hash b/package/tinyxml2/tinyxml2.hash
index e5e4d238ab..5f38546466 100644
--- a/package/tinyxml2/tinyxml2.hash
+++ b/package/tinyxml2/tinyxml2.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256 14b38ef25cc136d71339ceeafb4856bb638d486614103453eccd323849267f20  tinyxml2-4.0.1.tar.gz
+sha256 cdf0c2179ae7a7931dba52463741cf59024198bbf9673bf08415bcb46344110f  tinyxml2-6.2.0.tar.gz
+sha256 8b2ab0b6ffb86798a2512f45fcf50a3b04b3516782d2e3fb30ebf55dc18c7cce  readme.md
diff --git a/package/tinyxml2/tinyxml2.mk b/package/tinyxml2/tinyxml2.mk
index e289ca9cf0..9439c5cb80 100644
--- a/package/tinyxml2/tinyxml2.mk
+++ b/package/tinyxml2/tinyxml2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TINYXML2_VERSION = 4.0.1
+TINYXML2_VERSION = 6.2.0
 TINYXML2_SITE = $(call github,leethomason,tinyxml2,$(TINYXML2_VERSION))
 TINYXML2_LICENSE = Zlib
 TINYXML2_LICENSE_FILES = readme.md
-- 
2.14.1
