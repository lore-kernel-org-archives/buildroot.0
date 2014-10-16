From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 16 Oct 2014 14:48:37 -0300
Subject: [Buildroot] [PATCH] php: security bump to version 5.5.18
Message-ID: <1413481717-9541-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
CVE-2014-3669 - Integer overflow in unserialize() (32-bits only)
CVE-2014-3670 - Heap corruption in exif_thumbnail()
CVE-2014-3668 - Global buffer overflow in mkgmtime() function

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/php/php.hash | 2 +-
 package/php/php.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php/php.hash b/package/php/php.hash
index bee8cff..6bb0d1c 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,2 +1,2 @@
 # From http://php.net/downloads.php
-md5	e5f25dae73004658533ee7701a527bd0	php-5.5.17.tar.xz
+md5	3984f32985842afebe5795457e26931f	php-5.5.18.tar.xz
diff --git a/package/php/php.mk b/package/php/php.mk
index bca4f3a..26ec67d 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 5.5.17
+PHP_VERSION = 5.5.18
 PHP_SITE = http://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
-- 
2.0.4
