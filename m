From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 20 Mar 2015 09:49:51 -0300
Subject: [Buildroot] [PATCH] php: security bump to version 5.5.23
Message-ID: <1426855791-7093-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
CVE-2015-0231 - Use After Free Vulnerability in unserialize()
CVE-2015-2305 - heap overflow vulnerability in regcomp.c
CVE-2015-2331 - ZIP Integer Overflow leads to writing past heap boundary

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/php/php.hash | 2 +-
 package/php/php.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php/php.hash b/package/php/php.hash
index f8a1715..0794db8 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,2 +1,2 @@
 # From http://php.net/downloads.php
-md5	fb1704131d495f5b3e6ab3b087a8dbe6	php-5.5.22.tar.xz
+md5	692f9bc5649806f2053eee1e7323b7ea	php-5.5.23.tar.xz
diff --git a/package/php/php.mk b/package/php/php.mk
index 1e77a97..6d35a2f 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 5.5.22
+PHP_VERSION = 5.5.23
 PHP_SITE = http://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
-- 
2.0.5
