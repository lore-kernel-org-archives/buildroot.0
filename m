From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 30 May 2019 15:01:47 +0200
Subject: [Buildroot] [git commit] package/php: security bump version to 7.3.6
Message-ID: <20190530125543.E77508100B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8d27812ac1b12713921f2f7bfaf274980674de68
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes: https://www.php.net/archive/2019.php#id2019-05-30-1

Fixes
CVE 2019-11038: https://bugs.php.net/bug.php?id=77973
CVE 2019-11039: https://bugs.php.net/bug.php?id=78069
CVE 2019-11040: https://bugs.php.net/bug.php?id=77988

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/php/php.hash | 2 +-
 package/php/php.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php/php.hash b/package/php/php.hash
index b764f8a507..d88433e8c0 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,5 +1,5 @@
 # From http://php.net/downloads.php
-sha256 e1011838a46fd4a195c8453b333916622d7ff5bce4aca2d9d99afac142db2472  php-7.3.5.tar.xz
+sha256 fefc8967daa30ebc375b2ab2857f97da94ca81921b722ddac86b29e15c54a164  php-7.3.6.tar.xz
 
 # License file
 sha256 f689b8fa63bea7950ce6a21bf52ed88ea0d77673ee76e6de12f51191174d91b8  LICENSE
diff --git a/package/php/php.mk b/package/php/php.mk
index ed71c96c8a..de7c0c0d5a 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 7.3.5
+PHP_VERSION = 7.3.6
 PHP_SITE = http://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
