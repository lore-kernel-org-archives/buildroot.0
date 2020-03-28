From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 28 Mar 2020 08:29:07 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/php: security
 bump to version 7.3.16
Message-ID: <20200328071548.F1D56886B8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=326cc82d85a3dd725cce528f18b8923080210845
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Changelog: https://www.php.net/ChangeLog-7.php#7.3.16

Fixes CVE-2020-7064, CVE-2020-7065 & CVE-2020-7066.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/php/php.hash | 2 +-
 package/php/php.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php/php.hash b/package/php/php.hash
index a784adb7f5..f5c8b7837d 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,5 +1,5 @@
 # From https://www.php.net/downloads.php
-sha256 de7ae7cf3d1dbb2824975b26b32991dac2b732886ec22075b8c53b261b018166  php-7.3.15.tar.xz
+sha256 91aaee3dbdc71b69b4f3292f9d99211172a2fa926c3f3bbdb0e85dab03dd2bcb  php-7.3.16.tar.xz
 
 # License file
 sha256 f689b8fa63bea7950ce6a21bf52ed88ea0d77673ee76e6de12f51191174d91b8  LICENSE
diff --git a/package/php/php.mk b/package/php/php.mk
index 339509effd..648262f247 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 7.3.15
+PHP_VERSION = 7.3.16
 PHP_SITE = http://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
