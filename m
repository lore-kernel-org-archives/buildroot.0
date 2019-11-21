From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 21 Nov 2019 22:37:33 +0100
Subject: [Buildroot] [PATCH 1/1] package/php: bump version to 7.3.12
Message-ID: <20191121213733.23541-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Release notes of this bugfix release:
https://www.php.net/ChangeLog-7.php#7.3.12

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/php/php.hash | 2 +-
 package/php/php.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php/php.hash b/package/php/php.hash
index debc14c64e..11ce109591 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,5 +1,5 @@
 # From http://php.net/downloads.php
-sha256 657cf6464bac28e9490c59c07a2cf7bb76c200f09cfadf6e44ea64e95fa01021  php-7.3.11.tar.xz
+sha256 aafe5e9861ad828860c6af8c88cdc1488314785962328eb1783607c1fdd855df  php-7.3.12.tar.xz
 
 # License file
 sha256 f689b8fa63bea7950ce6a21bf52ed88ea0d77673ee76e6de12f51191174d91b8  LICENSE
diff --git a/package/php/php.mk b/package/php/php.mk
index b679531238..9589530101 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 7.3.11
+PHP_VERSION = 7.3.12
 PHP_SITE = http://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
-- 
2.20.1
