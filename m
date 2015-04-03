From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri,  3 Apr 2015 09:27:24 -0300
Subject: [Buildroot] [PATCH] icu: bump to version 55.1
Message-ID: <1428064044-9830-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/icu/icu.hash | 4 ++--
 package/icu/icu.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/icu/icu.hash b/package/icu/icu.hash
index 4953513..cc3352e 100644
--- a/package/icu/icu.hash
+++ b/package/icu/icu.hash
@@ -1,2 +1,2 @@
-# From https://ssl.icu-project.org/files/icu4c/54.1/icu4c-src-54_1.md5
-md5	e844caed8f2ca24c088505b0d6271bc0	icu4c-54_1-src.tgz
+# From https://ssl.icu-project.org/files/icu4c/55.1/icu4c-src-55_1.md5
+md5	e2d523df79d6cb7855c2fbe284f4db29	icu4c-55_1-src.tgz
diff --git a/package/icu/icu.mk b/package/icu/icu.mk
index c5460b2..2590178 100644
--- a/package/icu/icu.mk
+++ b/package/icu/icu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ICU_VERSION = 54.1
+ICU_VERSION = 55.1
 ICU_SOURCE = icu4c-$(subst .,_,$(ICU_VERSION))-src.tgz
 ICU_SITE = http://download.icu-project.org/files/icu4c/$(ICU_VERSION)
 ICU_LICENSE = ICU License
-- 
2.0.5
