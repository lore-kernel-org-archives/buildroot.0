From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  9 Aug 2015 14:01:21 +0200
Subject: [Buildroot] [PATCH 1/1] package/php: security bump to version 5.6.12
Message-ID: <1439121681-25926-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

http://www.php.net/ChangeLog-5.php#5.6.12
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/php/php.hash | 2 +-
 package/php/php.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php/php.hash b/package/php/php.hash
index ea12138..6afc166 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,2 +1,2 @@
 # From http://php.net/downloads.php
-sha256	3f97dbb1c646b90e1ef638defabe429ef036f903b5baa1c34769d3de4fe62bd4	php-5.6.11.tar.xz
+sha256	f8a8446866c0dc3f33319aa196ce87b64d71cab3dd96e39c8816adccc7e8ef33	php-5.6.12.tar.xz
diff --git a/package/php/php.mk b/package/php/php.mk
index 6bf022f..8506714 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PHP_VERSION_MAJOR = 5.6
-PHP_VERSION = $(PHP_VERSION_MAJOR).11
+PHP_VERSION = $(PHP_VERSION_MAJOR).12
 PHP_SITE = http://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
-- 
2.1.4
