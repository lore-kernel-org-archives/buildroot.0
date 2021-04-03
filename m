From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 3 Apr 2021 09:44:34 +0200
Subject: [Buildroot] [git commit branch/2020.11.x] package/php: bump version
 to 7.4.16
Message-ID: <20210403072605.BEF818A399@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=86fccce793e82472e095e08e7c5e3db390530f9f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.11.x

Changelog: https://www.php.net/ChangeLog-7.php#7.4.16

Update license hash due to copyright year bump:
http://git.php.net/?p=php-src.git;a=commitdiff;h=8c04944b66fd4a4fa88e54b65a2391397998c51d

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 92797a892398af4954634a57322b63f0f071cc2b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/php/php.hash | 4 ++--
 package/php/php.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/php/php.hash b/package/php/php.hash
index d60164d96f..14576cf506 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,5 +1,5 @@
 # From https://www.php.net/downloads.php
-sha256  9b859c65f0cf7b3eff9d4a28cfab719fb3d36a1db3c20d874a79b5ec44d43cb8  php-7.4.15.tar.xz
+sha256  1c16cefaf88ded4c92eed6a8a41eb682bb2ef42429deb55f1c4ba159053fb98b  php-7.4.16.tar.xz
 
 # License file
-sha256  0967ad6cf4b7fe81d38709d7aaef3fecb3bd685be7eebb37b864aa34c991baa7  LICENSE
+sha256  a188db807d711536f71e27b7d36879d63480f7994dc18adc08e624b3c5430fff  LICENSE
diff --git a/package/php/php.mk b/package/php/php.mk
index 0d713d948a..31cf219489 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 7.4.15
+PHP_VERSION = 7.4.16
 PHP_SITE = http://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
