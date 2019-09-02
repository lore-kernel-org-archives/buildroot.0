From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 2 Sep 2019 18:22:18 +0200
Subject: [Buildroot] [git commit branch/2019.05.x] package/php: security
 bump version to 7.3.9
Message-ID: <20190902161809.9BFC58A419@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a48b1f0f58024c0a0e8b7809150108abba0e2915
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.05.x

Release notes: https://www.php.net/archive/2019.php#2019-08-29-1
Changelog: https://www.php.net/ChangeLog-7.php#7.3.9

Fixes CVE-2019-13224 & CVE-2019-13225:
https://bugs.mageia.org/show_bug.cgi?id=25380

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 0c5acbbcb60522303be22656a214204ba560c9f3)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/php/php.hash | 2 +-
 package/php/php.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php/php.hash b/package/php/php.hash
index 1330eebbb3..174bd98dd6 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,5 +1,5 @@
 # From http://php.net/downloads.php
-sha256 f6046b2ae625d8c04310bda0737ac660dc5563a8e04e8a46c1ee24ea414ad5a5  php-7.3.8.tar.xz
+sha256 4007f24a39822bef2805b75c625551d30be9eeed329d52eb0838fa5c1b91c1fd  php-7.3.9.tar.xz
 
 # License file
 sha256 f689b8fa63bea7950ce6a21bf52ed88ea0d77673ee76e6de12f51191174d91b8  LICENSE
diff --git a/package/php/php.mk b/package/php/php.mk
index 0502158377..6516c6b05a 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 7.3.8
+PHP_VERSION = 7.3.9
 PHP_SITE = http://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
