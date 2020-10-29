From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 29 Oct 2020 22:37:11 +0100
Subject: [Buildroot] [PATCH 1/1] package/php: security bump version to 7.4.12
Message-ID: <20201029213711.1521279-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changelog: https://www.php.net/ChangeLog-7.php#7.4.12

According to the release notes this is a "security bug fix release":
https://news-web.php.net/php.announce/300

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/php/php.hash | 2 +-
 package/php/php.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php/php.hash b/package/php/php.hash
index 77a0feb555..8e8131d301 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,5 +1,5 @@
 # From https://www.php.net/downloads.php
-sha256  5d31675a9b9c21b5bd03389418218c30b26558246870caba8eb54f5856e2d6ce  php-7.4.11.tar.xz
+sha256  e82d2bcead05255f6b7d2ff4e2561bc334204955820cabc2457b5239fde96b76  php-7.4.12.tar.xz
 
 # License file
 sha256  0967ad6cf4b7fe81d38709d7aaef3fecb3bd685be7eebb37b864aa34c991baa7  LICENSE
diff --git a/package/php/php.mk b/package/php/php.mk
index 6b528cdc33..ce0e3e4a49 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 7.4.11
+PHP_VERSION = 7.4.12
 PHP_SITE = http://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
-- 
2.27.0
