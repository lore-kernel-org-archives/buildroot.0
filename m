From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue,  3 Oct 2017 10:30:06 +0200
Subject: [Buildroot] [PATCH 1/1] package/php: bump version to 7.1.10
Message-ID: <20171003083006.22713-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changelog: http://www.php.net/ChangeLog-7.php#7.1.10

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/php/php.hash | 2 +-
 package/php/php.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php/php.hash b/package/php/php.hash
index 2c53d84495..cf2a73d2a4 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,5 +1,5 @@
 # From http://php.net/downloads.php
-sha256 ec9ca348dd51f19a84dc5d33acfff1fba1f977300604bdac08ed46ae2c281e8c  php-7.1.9.tar.xz
+sha256 2b8efa771a2ead0bb3ae67b530ca505b5b286adc873cca9ce97a6e1d6815c50b  php-7.1.10.tar.xz
 
 # License file
 sha256 a44951f93b10c87c3f7cd9f311d95999c57c95ed950eec32b14c1c7ea6baf25e  LICENSE
diff --git a/package/php/php.mk b/package/php/php.mk
index a58b8a5bd9..d18442978b 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 7.1.9
+PHP_VERSION = 7.1.10
 PHP_SITE = http://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
-- 
2.11.0
