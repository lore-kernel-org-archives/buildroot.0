From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 30 Apr 2021 14:55:14 +0200
Subject: [Buildroot] [git commit] package/php: security bump version to
 7.4.18
Message-ID: <20210430122803.8C6E7867CA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ac3234acd872678abba11217a258e3037c4ab2a8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog: https://www.php.net/ChangeLog-7.php#7.4.18

Release notes: https://www.php.net/releases/7_4_18.php

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/php/php.hash | 2 +-
 package/php/php.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php/php.hash b/package/php/php.hash
index 14576cf506..ecb290bab2 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,5 +1,5 @@
 # From https://www.php.net/downloads.php
-sha256  1c16cefaf88ded4c92eed6a8a41eb682bb2ef42429deb55f1c4ba159053fb98b  php-7.4.16.tar.xz
+sha256  ab97f22b128d21dcbc009b50a37aaea0051b2721cbcd122d9e00e6ffc3c4b7e1  php-7.4.18.tar.xz
 
 # License file
 sha256  a188db807d711536f71e27b7d36879d63480f7994dc18adc08e624b3c5430fff  LICENSE
diff --git a/package/php/php.mk b/package/php/php.mk
index 4987f6f3bb..89437c5206 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 7.4.16
+PHP_VERSION = 7.4.18
 PHP_SITE = http://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
