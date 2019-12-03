From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 3 Dec 2019 10:44:13 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/php: bump version
 to 7.3.12
Message-ID: <20191203094345.9CC5F83BF0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=14dcd5f9c07aecd446c3376972a63532277317b9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Release notes of this bugfix release:
https://www.php.net/ChangeLog-7.php#7.3.12

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit a7ba9c54b4f5cbb36386b366bfb5e5fd4ad2fe7a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/php/php.hash | 2 +-
 package/php/php.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php/php.hash b/package/php/php.hash
index debc14c64e..11ce109591 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,5 +1,5 @@
 # From http://php.net/downloads.php
-sha256 657cf6464bac28e9490c59c07a2cf7bb76c200f09cfadf6e44ea64e95fa01021  php-7.3.11.tar.xz
+sha256 aafe5e9861ad828860c6af8c88cdc1488314785962328eb1783607c1fdd855df  php-7.3.12.tar.xz
 
 # License file
 sha256 f689b8fa63bea7950ce6a21bf52ed88ea0d77673ee76e6de12f51191174d91b8  LICENSE
diff --git a/package/php/php.mk b/package/php/php.mk
index fe7cea8880..dae1fade23 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 7.3.11
+PHP_VERSION = 7.3.12
 PHP_SITE = http://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
