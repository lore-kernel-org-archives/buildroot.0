From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 27 Sep 2019 22:17:21 +0200
Subject: [Buildroot] [git commit] package/php: security bump version to
 7.3.10
Message-ID: <20190927201231.584C68F881@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7169beb3fcbc2bd93ab71e69321285cfa8b7d2e9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes: https://www.php.net/archive/2019.php#2019-09-26-1

No CVE IDs can be found in the bug reports mentioned in the Changelog:
https://www.php.net/ChangeLog-7.php#7.3.10

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/php/php.hash | 2 +-
 package/php/php.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php/php.hash b/package/php/php.hash
index 174bd98dd6..2afcb2cd77 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,5 +1,5 @@
 # From http://php.net/downloads.php
-sha256 4007f24a39822bef2805b75c625551d30be9eeed329d52eb0838fa5c1b91c1fd  php-7.3.9.tar.xz
+sha256 42f00a15419e05771734b7159c8d39d639b8a5a6770413adfa2615f6f923d906  php-7.3.10.tar.xz
 
 # License file
 sha256 f689b8fa63bea7950ce6a21bf52ed88ea0d77673ee76e6de12f51191174d91b8  LICENSE
diff --git a/package/php/php.mk b/package/php/php.mk
index 6516c6b05a..bfb5923191 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 7.3.9
+PHP_VERSION = 7.3.10
 PHP_SITE = http://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
