From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu,  4 Feb 2016 22:16:08 +0100
Subject: [Buildroot] [PATCH 1/1] package/php: security bump version to 5.6.18
Message-ID: <1454620568-23891-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changelog: http://www.php.net/ChangeLog-5.php#5.6.18
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/php/php.hash | 2 +-
 package/php/php.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php/php.hash b/package/php/php.hash
index 7a7616f..5cdafc6 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,2 +1,2 @@
 # From http://php.net/downloads.php
-sha256	ea9d5749380c7c7171e131616466deacd7cb124b5010eafc34e551b0a7b0fb2c	php-5.6.17.tar.xz
+sha256	54dd9106c3469bc7028644d72ac140af00655420bbaaf4a742a64e9ed02ec1b0	php-5.6.18.tar.xz
diff --git a/package/php/php.mk b/package/php/php.mk
index 84443a1..f2c7e28 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 5.6.17
+PHP_VERSION = 5.6.18
 PHP_SITE = http://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
-- 
2.7.0
