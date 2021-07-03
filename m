From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 3 Jul 2021 21:56:49 +0200
Subject: [Buildroot] [git commit] package/php-xdebug: bump version to 3.0.4
Message-ID: <20210703192906.B04EA8F177@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0a62c68e080faba83b2a07803957d6cbcbdf0d80
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/php-xdebug/php-xdebug.hash | 4 ++--
 package/php-xdebug/php-xdebug.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/php-xdebug/php-xdebug.hash b/package/php-xdebug/php-xdebug.hash
index 8b90352ebf..72bfac67ce 100644
--- a/package/php-xdebug/php-xdebug.hash
+++ b/package/php-xdebug/php-xdebug.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 ef479ee1a3da3f933e0d046ca8cd0c14601f29b2c0c41cc60c9388546a4e0272  LICENSE
-sha256 e330c5ccb77890b06dd7bf093567051450b2438b79fed8e7e6c4834278d46092  php-xdebug-2.9.6.tar.gz
+sha256  7e4f28fc65c8b535de43b6d2ec57429476a6de1d53c4d440a9108ae8d28e01f4  php-xdebug-3.0.4.tar.gz
+sha256  ef479ee1a3da3f933e0d046ca8cd0c14601f29b2c0c41cc60c9388546a4e0272  LICENSE
diff --git a/package/php-xdebug/php-xdebug.mk b/package/php-xdebug/php-xdebug.mk
index ab6ade4cb1..18ebc32592 100644
--- a/package/php-xdebug/php-xdebug.mk
+++ b/package/php-xdebug/php-xdebug.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_XDEBUG_VERSION = 2.9.6
+PHP_XDEBUG_VERSION = 3.0.4
 PHP_XDEBUG_SITE = $(call github,xdebug,xdebug,$(PHP_XDEBUG_VERSION))
 PHP_XDEBUG_INSTALL_STAGING = YES
 PHP_XDEBUG_LICENSE = Xdebug License (PHP-3.0-like)
