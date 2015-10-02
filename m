From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri,  2 Oct 2015 13:01:22 -0300
Subject: [Buildroot] [PATCH] php: bump to version 5.6.14
Message-ID: <1443801682-31151-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/php/php.hash | 2 +-
 package/php/php.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php/php.hash b/package/php/php.hash
index db01b43..a0b12a2 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,2 +1,2 @@
 # From http://php.net/downloads.php
-sha256	c1f0837df20cd3bed149033924770deca3e7e2d18e2e7e81395096576f153fdc	php-5.6.13.tar.xz
+sha256	c8edf6b05fd8a69ebd88d90c5c0975ee168502204622ad5cfcd550bc222632d9	php-5.6.14.tar.xz
diff --git a/package/php/php.mk b/package/php/php.mk
index 3d21dee..a90913f 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PHP_VERSION_MAJOR = 5.6
-PHP_VERSION = $(PHP_VERSION_MAJOR).13
+PHP_VERSION = $(PHP_VERSION_MAJOR).14
 PHP_SITE = http://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
-- 
2.4.9
