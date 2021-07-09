From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 9 Jul 2021 22:47:21 +0200
Subject: [Buildroot] [git commit branch/2021.05.x] package/php: bump version
 to 7.4.20
Message-ID: <20210709201645.C215492DFB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=23e60dd565b31e8a93efb538a065fe0ffaed9945
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.05.x

Changelog: https://www.php.net/ChangeLog-7.php#7.4.20

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit f42a500e41ff294aaed3800b159d0cc4b966d999)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/php/php.hash | 2 +-
 package/php/php.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php/php.hash b/package/php/php.hash
index 3fb0d09d32..d91d6aec66 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,5 +1,5 @@
 # From https://www.php.net/downloads.php
-sha256  6c17172c4a411ccb694d9752de899bb63c72a0a3ebe5089116bc13658a1467b2  php-7.4.19.tar.xz
+sha256  1fa46ca6790d780bf2cb48961df65f0ca3640c4533f0bca743cd61b71cb66335  php-7.4.20.tar.xz
 
 # License file
 sha256  a188db807d711536f71e27b7d36879d63480f7994dc18adc08e624b3c5430fff  LICENSE
diff --git a/package/php/php.mk b/package/php/php.mk
index 73553e0395..3e422c5ac1 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 7.4.19
+PHP_VERSION = 7.4.20
 PHP_SITE = http://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
