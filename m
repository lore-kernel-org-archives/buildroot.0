From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 02 Sep 2020 16:24:31 -0000
Subject: [Buildroot] [git commit] package/php: bump version to 7.4.9
Message-ID: <20200902161633.1A567814F8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=301e319c450b600f02a94fcbf2b45f1d7d584a74
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog of this bugfix release:
https://www.php.net/ChangeLog-7.php#7.4.9

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/php/php.hash | 2 +-
 package/php/php.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php/php.hash b/package/php/php.hash
index 47879eecca..d648d90c04 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,5 +1,5 @@
 # From https://www.php.net/downloads.php
-sha256  642843890b732e8af01cb661e823ae01472af1402f211c83009c9b3abd073245  php-7.4.8.tar.xz
+sha256  23733f4a608ad1bebdcecf0138ebc5fd57cf20d6e0915f98a9444c3f747dc57b  php-7.4.9.tar.xz
 
 # License file
 sha256  0967ad6cf4b7fe81d38709d7aaef3fecb3bd685be7eebb37b864aa34c991baa7  LICENSE
diff --git a/package/php/php.mk b/package/php/php.mk
index 1296c50c6d..6e0b5c6e8d 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 7.4.8
+PHP_VERSION = 7.4.9
 PHP_SITE = http://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
