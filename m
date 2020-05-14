From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 14 May 2020 18:19:09 +0200
Subject: [Buildroot] [PATCH 1/1] package/php: security bump version to 7.4.6
Message-ID: <20200514161909.672761-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changelog: https://www.php.net/ChangeLog-7.php#7.4.6

Fixes CVE 2019-11048.

Reformatted hashes.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/php/php.hash | 4 ++--
 package/php/php.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/php/php.hash b/package/php/php.hash
index a0b8fd4688..0267375f6e 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,5 +1,5 @@
 # From https://www.php.net/downloads.php
-sha256 d059fd7f55bdc4d2eada15a00a2976697010d3631ef6f83149cc5289e1f23c2c  php-7.4.5.tar.xz
+sha256  d740322f84f63019622b9f369d64ea5ab676547d2bdcf12be77a5a4cffd06832  php-7.4.6.tar.xz
 
 # License file
-sha256 0967ad6cf4b7fe81d38709d7aaef3fecb3bd685be7eebb37b864aa34c991baa7  LICENSE
+sha256  0967ad6cf4b7fe81d38709d7aaef3fecb3bd685be7eebb37b864aa34c991baa7  LICENSE
diff --git a/package/php/php.mk b/package/php/php.mk
index 4d2f1b8f63..73be57a8a1 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 7.4.5
+PHP_VERSION = 7.4.6
 PHP_SITE = http://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
-- 
2.26.2
