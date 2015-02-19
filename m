From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 19 Feb 2015 11:59:56 -0300
Subject: [Buildroot] [PATCH] php: security bump to version 5.5.22
Message-ID: <1424357996-11729-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
CVE-2015-0273 - Use after free vulnerability in unserialize() with
DateTimeZone.
CVE-2015-0235 - Mitigation for GHOST: glibc gethostbyname buffer
overflow.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/php/php.hash | 2 +-
 package/php/php.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php/php.hash b/package/php/php.hash
index cd27b10..f8a1715 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,2 +1,2 @@
 # From http://php.net/downloads.php
-md5	79664ce44f7c93f355a25a3fe3dcc91b	php-5.5.21.tar.xz
+md5	fb1704131d495f5b3e6ab3b087a8dbe6	php-5.5.22.tar.xz
diff --git a/package/php/php.mk b/package/php/php.mk
index 4bcbe18..dd52508 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 5.5.21
+PHP_VERSION = 5.5.22
 PHP_SITE = http://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
-- 
2.0.5
