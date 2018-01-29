From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 29 Jan 2018 22:33:32 +0100
Subject: [Buildroot] [git commit branch/2017.02.x] package/php: bump version
 to 7.1.11
Message-ID: <20180129213709.46BCE88014@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=de159eb44c064ea5d01f3eb50c20acbfbf540303
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Changelog: http://www.php.net/ChangeLog-7.php#7.1.11
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 8c4a43218579ce5ff44d0894893b93320bceb11f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/php/php.hash | 2 +-
 package/php/php.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php/php.hash b/package/php/php.hash
index cf2a73d2a4..d1f36f2d34 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,5 +1,5 @@
 # From http://php.net/downloads.php
-sha256 2b8efa771a2ead0bb3ae67b530ca505b5b286adc873cca9ce97a6e1d6815c50b  php-7.1.10.tar.xz
+sha256 074093e9d7d21afedc5106904218a80a47b854abe368d2728ed22184c884893e  php-7.1.11.tar.xz
 
 # License file
 sha256 a44951f93b10c87c3f7cd9f311d95999c57c95ed950eec32b14c1c7ea6baf25e  LICENSE
diff --git a/package/php/php.mk b/package/php/php.mk
index a609e38a16..7897045146 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 7.1.10
+PHP_VERSION = 7.1.11
 PHP_SITE = http://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
