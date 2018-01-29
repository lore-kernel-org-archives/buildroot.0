From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 29 Jan 2018 22:33:41 +0100
Subject: [Buildroot] [git commit branch/2017.02.x] package/php: bump version
 to 7.1.12
Message-ID: <20180129213709.5BBBE88014@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5356c7df69a18a94286f7aeff344bf060c720d64
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit ab01a1279c4990d201e6a560dbe9cc5b25a20fae)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/php/php.hash | 2 +-
 package/php/php.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php/php.hash b/package/php/php.hash
index d1f36f2d34..cdec308b66 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,5 +1,5 @@
 # From http://php.net/downloads.php
-sha256 074093e9d7d21afedc5106904218a80a47b854abe368d2728ed22184c884893e  php-7.1.11.tar.xz
+sha256 a0118850774571b1f2d4e30b4fe7a4b958ca66f07d07d65ebdc789c54ba6eeb3  php-7.1.12.tar.xz
 
 # License file
 sha256 a44951f93b10c87c3f7cd9f311d95999c57c95ed950eec32b14c1c7ea6baf25e  LICENSE
diff --git a/package/php/php.mk b/package/php/php.mk
index 7897045146..3acd2d96ce 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 7.1.11
+PHP_VERSION = 7.1.12
 PHP_SITE = http://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
