From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 11 May 2021 22:01:59 +0200
Subject: [Buildroot] [git commit] package/php: bump version to 7.4.19
Message-ID: <20210511193512.5985E812C2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f4d019168929a494fe840321d6adb8a6f9115bf0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog: https://www.php.net/ChangeLog-7.php#7.4.19

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/php/php.hash | 2 +-
 package/php/php.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php/php.hash b/package/php/php.hash
index ecb290bab2..3fb0d09d32 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,5 +1,5 @@
 # From https://www.php.net/downloads.php
-sha256  ab97f22b128d21dcbc009b50a37aaea0051b2721cbcd122d9e00e6ffc3c4b7e1  php-7.4.18.tar.xz
+sha256  6c17172c4a411ccb694d9752de899bb63c72a0a3ebe5089116bc13658a1467b2  php-7.4.19.tar.xz
 
 # License file
 sha256  a188db807d711536f71e27b7d36879d63480f7994dc18adc08e624b3c5430fff  LICENSE
diff --git a/package/php/php.mk b/package/php/php.mk
index 89437c5206..73553e0395 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 7.4.18
+PHP_VERSION = 7.4.19
 PHP_SITE = http://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
