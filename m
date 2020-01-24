From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 24 Jan 2020 20:15:49 +0100
Subject: [Buildroot] [git commit] package/php: security bump to version
 7.3.14
Message-ID: <20200124190621.A059583A33@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fc3916efbc9cb2c8d7803ae8fe58f5739efc8598
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog of 7.3.13: https://www.php.net/ChangeLog-7.php#7.3.13

Fixes CVE-2019-11044, CVE-2019-11045, CVE-2019-11046, CVE-2019-11047,
CVE-2019-11049 & CVE-2019-11050

Changelog of 7.3.14: https://www.php.net/ChangeLog-7.php#7.3.14

Fixes CVE-2020-7059 & CVE-2020-7060.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/php/php.hash | 4 ++--
 package/php/php.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/php/php.hash b/package/php/php.hash
index 11ce109591..31f08cacac 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,5 +1,5 @@
-# From http://php.net/downloads.php
-sha256 aafe5e9861ad828860c6af8c88cdc1488314785962328eb1783607c1fdd855df  php-7.3.12.tar.xz
+# From https://www.php.net/downloads.php
+sha256 cc05dd373ca5d36652800762f65c10e828a17de35aaf246262e3efa99d00cdb0  php-7.3.14.tar.xz
 
 # License file
 sha256 f689b8fa63bea7950ce6a21bf52ed88ea0d77673ee76e6de12f51191174d91b8  LICENSE
diff --git a/package/php/php.mk b/package/php/php.mk
index 682132fb59..41c86daca3 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 7.3.12
+PHP_VERSION = 7.3.14
 PHP_SITE = http://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
