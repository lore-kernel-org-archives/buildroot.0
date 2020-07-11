From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 11 Jul 2020 15:58:00 +0200
Subject: [Buildroot] [git commit] package/php: bump version to 7.4.8
Message-ID: <20200711135539.D83F784496@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a6a500bb990fe6b9302e762adbd5e440329e99d9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Quoting https://www.php.net/
"For windows users running an official build, this release contains a
 patched version of libcurl addressing CVE-2020-8159.

For all other consumers of PHP, this is a bug fix release."

Changelog: https://www.php.net/ChangeLog-7.php#7.4.8

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/php/php.hash | 2 +-
 package/php/php.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php/php.hash b/package/php/php.hash
index 9789a99988..47879eecca 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,5 +1,5 @@
 # From https://www.php.net/downloads.php
-sha256  53558f8f24cd8ab6fa0ea252ca8198e2650160649681ce5230c1df1dc2b52faf  php-7.4.7.tar.xz
+sha256  642843890b732e8af01cb661e823ae01472af1402f211c83009c9b3abd073245  php-7.4.8.tar.xz
 
 # License file
 sha256  0967ad6cf4b7fe81d38709d7aaef3fecb3bd685be7eebb37b864aa34c991baa7  LICENSE
diff --git a/package/php/php.mk b/package/php/php.mk
index ed71404c7b..48af0f6fdc 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 7.4.7
+PHP_VERSION = 7.4.8
 PHP_SITE = http://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
