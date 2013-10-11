From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Fri, 11 Oct 2013 18:35:44 +0200
Subject: [Buildroot] [PATCH 1/1] apr-util: bump to version 1.5.2
Message-ID: <1381509345-5904-1-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 ...apr.patch => apr-util-01-remove-checkapr.patch} |    0
 package/apr-util/apr-util.mk                       |    2 +-
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename package/apr-util/{apr-util-1.4.1-remove-checkapr.patch => apr-util-01-remove-checkapr.patch} (100%)

diff --git a/package/apr-util/apr-util-1.4.1-remove-checkapr.patch b/package/apr-util/apr-util-01-remove-checkapr.patch
similarity index 100%
rename from package/apr-util/apr-util-1.4.1-remove-checkapr.patch
rename to package/apr-util/apr-util-01-remove-checkapr.patch
diff --git a/package/apr-util/apr-util.mk b/package/apr-util/apr-util.mk
index 11551d6..51852e4 100644
--- a/package/apr-util/apr-util.mk
+++ b/package/apr-util/apr-util.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-APR_UTIL_VERSION = 1.4.1
+APR_UTIL_VERSION = 1.5.2
 APR_UTIL_SITE = http://archive.apache.org/dist/apr
 APR_UTIL_LICENSE = Apache-2.0
 APR_UTIL_LICENSE_FILES = LICENSE
-- 
1.7.9.5
