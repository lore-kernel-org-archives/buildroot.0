From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 12 Dec 2016 16:56:55 +0100
Subject: [Buildroot] [git commit] icu: bump to version 58.2
Message-ID: <20161212155708.3A27D802A7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3ed2ff972e6c9b674d6f56849d2cdbcc32db624b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
