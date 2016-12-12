From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 12 Dec 2016 12:25:18 -0300
Subject: [Buildroot] [PATCH] icu: bump to version 58.2
Message-ID: <1481556318-11778-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/icu/icu.hash | 6 +++---
 package/icu/icu.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/icu/icu.hash b/package/icu/icu.hash
index 4233ba3..d578bfb 100644
--- a/package/icu/icu.hash
+++ b/package/icu/icu.hash
@@ -1,4 +1,4 @@
-# From https://ssl.icu-project.org/files/icu4c/57.1/icu4c-src-57_1.md5
-md5	976734806026a4ef8bdd17937c8898b9	icu4c-57_1-src.tgz
+# From https://ssl.icu-project.org/files/icu4c/57.1/icu4c-src-58_2.md5
+md5	fac212b32b7ec7ab007a12dff1f3aea1	icu4c-58_2-src.tgz
 # Calculated based on the hash above
-sha256	ff8c67cb65949b1e7808f2359f2b80f722697048e90e7cfc382ec1fe229e9581	icu4c-57_1-src.tgz
+sha256	2b0a4410153a9b20de0e20c7d8b66049a72aef244b53683d0d7521371683da0c	icu4c-58_2-src.tgz
diff --git a/package/icu/icu.mk b/package/icu/icu.mk
index 3b40dfb..12406d7 100644
--- a/package/icu/icu.mk
+++ b/package/icu/icu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ICU_VERSION = 57.1
+ICU_VERSION = 58.2
 ICU_SOURCE = icu4c-$(subst .,_,$(ICU_VERSION))-src.tgz
 ICU_SITE = http://download.icu-project.org/files/icu4c/$(ICU_VERSION)
 ICU_LICENSE = ICU License
-- 
2.7.3
