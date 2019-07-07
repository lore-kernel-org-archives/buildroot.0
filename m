From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 7 Jul 2019 08:57:11 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/php: bump version
 to 7.3.7
Message-ID: <20190707065558.1F83A88FE5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4a6165aa4ecadbcafca663eb042736193ac69af8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Changelog: https://www.php.net/ChangeLog-7.php#7.3.7

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 7accdcb3a943d420b13a73c497d29cb15db156e2)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/php/php.hash | 2 +-
 package/php/php.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php/php.hash b/package/php/php.hash
index d88433e8c0..30aa8bfcf6 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,5 +1,5 @@
 # From http://php.net/downloads.php
-sha256 fefc8967daa30ebc375b2ab2857f97da94ca81921b722ddac86b29e15c54a164  php-7.3.6.tar.xz
+sha256 ba067200ba649956b3a92ec8b71a6ed8ce8a099921212443c1bcf3260a29274c  php-7.3.7.tar.xz
 
 # License file
 sha256 f689b8fa63bea7950ce6a21bf52ed88ea0d77673ee76e6de12f51191174d91b8  LICENSE
diff --git a/package/php/php.mk b/package/php/php.mk
index 7132f95917..e0c1c4445d 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 7.3.6
+PHP_VERSION = 7.3.7
 PHP_SITE = http://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
