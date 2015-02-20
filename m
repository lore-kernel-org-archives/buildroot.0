From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 20 Feb 2015 14:24:01 -0300
Subject: [Buildroot] [PATCH 1/2] exfat-utils: bump to version 1.1.1
Message-ID: <1424453042-10412-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also add hash file.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/exfat-utils/exfat-utils.hash | 2 ++
 package/exfat-utils/exfat-utils.mk   | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)
 create mode 100644 package/exfat-utils/exfat-utils.hash

diff --git a/package/exfat-utils/exfat-utils.hash b/package/exfat-utils/exfat-utils.hash
new file mode 100644
index 0000000..79ccf42
--- /dev/null
+++ b/package/exfat-utils/exfat-utils.hash
@@ -0,0 +1,2 @@
+# From https://code.google.com/p/exfat/wiki/Downloads?tm=2
+sha1	ddf0819c27aeb3eaae5aae0423d4dafc54d477da	exfat-utils-1.1.1.tar.gz
diff --git a/package/exfat-utils/exfat-utils.mk b/package/exfat-utils/exfat-utils.mk
index a7e90dd..4f43233 100644
--- a/package/exfat-utils/exfat-utils.mk
+++ b/package/exfat-utils/exfat-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXFAT_UTILS_VERSION = 1.1.0
+EXFAT_UTILS_VERSION = 1.1.1
 EXFAT_UTILS_SITE = http://distfiles.gentoo.org/distfiles
 EXFAT_UTILS_DEPENDENCIES = host-scons
 EXFAT_UTILS_LICENSE = GPLv3+
-- 
2.0.5
