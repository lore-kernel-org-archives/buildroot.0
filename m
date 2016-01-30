From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 30 Jan 2016 11:36:10 +0100
Subject: [Buildroot] [PATCH 1/1] package/jquery-validation: bump version to
	1.14.0, added hash
Message-ID: <1454150170-18585-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch also fixes the broken download of the previous version.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/jquery-validation/jquery-validation.hash | 2 ++
 package/jquery-validation/jquery-validation.mk   | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)
 create mode 100644 package/jquery-validation/jquery-validation.hash

diff --git a/package/jquery-validation/jquery-validation.hash b/package/jquery-validation/jquery-validation.hash
new file mode 100644
index 0000000..61c16cf
--- /dev/null
+++ b/package/jquery-validation/jquery-validation.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256	14efe6f1784ef6e97116b15c77b04b7e8f47ec07b1479bcd6fa0b081faa19440	jquery-validation-1.14.0.zip
diff --git a/package/jquery-validation/jquery-validation.mk b/package/jquery-validation/jquery-validation.mk
index b496b0a..10d2a92 100644
--- a/package/jquery-validation/jquery-validation.mk
+++ b/package/jquery-validation/jquery-validation.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JQUERY_VALIDATION_VERSION = 1.12.0
+JQUERY_VALIDATION_VERSION = 1.14.0
 JQUERY_VALIDATION_SITE = http://jqueryvalidation.org/files
 JQUERY_VALIDATION_SOURCE = jquery-validation-$(JQUERY_VALIDATION_VERSION).zip
 JQUERY_VALIDATION_LICENSE = MIT
-- 
2.7.0.rc3
