From: gustavo.zacarias at free-electrons.com <gustavo.zacarias@free-electrons.com>
Date: Tue, 13 Oct 2015 09:45:00 -0300
Subject: [Buildroot] [PATCH] icu: bump to version 56.1
Message-ID: <1444740300-11451-1-git-send-email-gustavo.zacarias@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
---
 package/icu/icu.hash | 6 ++++--
 package/icu/icu.mk   | 2 +-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/icu/icu.hash b/package/icu/icu.hash
index cc3352e..e9f82b1 100644
--- a/package/icu/icu.hash
+++ b/package/icu/icu.hash
@@ -1,2 +1,4 @@
-# From https://ssl.icu-project.org/files/icu4c/55.1/icu4c-src-55_1.md5
-md5	e2d523df79d6cb7855c2fbe284f4db29	icu4c-55_1-src.tgz
+# From https://ssl.icu-project.org/files/icu4c/56.1/icu4c-src-56_1.md5
+md5	c4a2d71ff56aec5ebfab2a3f059be99d	icu4c-56_1-src.tgz
+# Calculated based on the hash above
+sha256	3a64e9105c734dcf631c0b3ed60404531bce6c0f5a64bfe1a6402a4cc2314816	icu4c-56_1-src.tgz
diff --git a/package/icu/icu.mk b/package/icu/icu.mk
index e89290a..5604504 100644
--- a/package/icu/icu.mk
+++ b/package/icu/icu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ICU_VERSION = 55.1
+ICU_VERSION = 56.1
 ICU_SOURCE = icu4c-$(subst .,_,$(ICU_VERSION))-src.tgz
 ICU_SITE = http://download.icu-project.org/files/icu4c/$(ICU_VERSION)
 ICU_LICENSE = ICU License
-- 
2.4.9
