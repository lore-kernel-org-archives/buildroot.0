From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 18 Jan 2021 23:31:29 +0100
Subject: [Buildroot] [PATCH 1/1] package/screenfetch: make version compliant
 with release-monitoring
Message-ID: <20210118223129.686550-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/screenfetch/screenfetch.hash | 2 +-
 package/screenfetch/screenfetch.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/screenfetch/screenfetch.hash b/package/screenfetch/screenfetch.hash
index 9730041948..4f16c616cf 100644
--- a/package/screenfetch/screenfetch.hash
+++ b/package/screenfetch/screenfetch.hash
@@ -1,2 +1,2 @@
-sha256  aa97dcd2a8576ae18de6c16c19744aae1573a3da7541af4b98a91930a30a3178  screenfetch-v3.9.1.tar.gz
+sha256  aa97dcd2a8576ae18de6c16c19744aae1573a3da7541af4b98a91930a30a3178  screenfetch-3.9.1.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/screenfetch/screenfetch.mk b/package/screenfetch/screenfetch.mk
index b4eb452c97..d1315d24e4 100644
--- a/package/screenfetch/screenfetch.mk
+++ b/package/screenfetch/screenfetch.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-SCREENFETCH_VERSION = v3.9.1
-SCREENFETCH_SITE = $(call github,KittyKatt,screenFetch,$(SCREENFETCH_VERSION))
+SCREENFETCH_VERSION = 3.9.1
+SCREENFETCH_SITE = $(call github,KittyKatt,screenFetch,v$(SCREENFETCH_VERSION))
 SCREENFETCH_LICENSE = GPL-3.0+
 SCREENFETCH_LICENSE_FILES = COPYING
 
-- 
2.29.2
