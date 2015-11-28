From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 28 Nov 2015 12:32:20 +0100
Subject: [Buildroot] [PATCH/next 1/1] package/php: bump version to 5.6.16
Message-ID: <1448710340-28966-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/php/php.hash | 2 +-
 package/php/php.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php/php.hash b/package/php/php.hash
index e4a3e73..ec632bf 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,2 +1,2 @@
 # From http://php.net/downloads.php
-sha256	cf52e2e621e60997269663fa4bc06253191fa2a41dc9b08c8c911435b3ebcca9	php-5.6.15.tar.xz
+sha256	8ef43271d9bd8cc8f8d407d3ba569de9fa14a28985ae97c76085bb50d597de98	php-5.6.16.tar.xz
diff --git a/package/php/php.mk b/package/php/php.mk
index 76e3d62..5f87d07 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PHP_VERSION_MAJOR = 5.6
-PHP_VERSION = $(PHP_VERSION_MAJOR).15
+PHP_VERSION = $(PHP_VERSION_MAJOR).16
 PHP_SITE = http://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
-- 
2.6.2
