From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 14 Mar 2020 14:25:33 +0100
Subject: [Buildroot] [git commit branch/2019.11.x] package/php: security
 bump to version 7.3.15
Message-ID: <20200314140059.6C7E282A27@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3fc3c3d4c8676b208f7f6dfd484f3efcda9cd066
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.11.x

Changelog: https://www.php.net/ChangeLog-7.php#7.3.15

Fixes CVE-2020-7061, CVE-2020-7062 & CVE-2020-7063

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/php/php.hash | 2 +-
 package/php/php.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php/php.hash b/package/php/php.hash
index 31f08cacac..a784adb7f5 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,5 +1,5 @@
 # From https://www.php.net/downloads.php
-sha256 cc05dd373ca5d36652800762f65c10e828a17de35aaf246262e3efa99d00cdb0  php-7.3.14.tar.xz
+sha256 de7ae7cf3d1dbb2824975b26b32991dac2b732886ec22075b8c53b261b018166  php-7.3.15.tar.xz
 
 # License file
 sha256 f689b8fa63bea7950ce6a21bf52ed88ea0d77673ee76e6de12f51191174d91b8  LICENSE
diff --git a/package/php/php.mk b/package/php/php.mk
index a552f483e8..55b583c1fb 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 7.3.14
+PHP_VERSION = 7.3.15
 PHP_SITE = http://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
