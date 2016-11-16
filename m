From: Vincent Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 16 Nov 2016 09:38:46 +0000
Subject: [Buildroot] [PATCH] PHP: bump to 7.0.13
In-Reply-To: <20161116092744.7827-1-ishitatsuyuki@gmail.com>
References: <20161116092744.7827-1-ishitatsuyuki@gmail.com>
Message-ID: <38121FAB319C3344930C920E7B518313886B225E@HHMAIL01.hh.imgtec.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Tatsuyuki,

php has been already bumped to 7.0.13 in the next branch:

https://git.busybox.net/buildroot/commit/?h=next&id=cd59cb6b388d00865d0084e6a25eb306c0b5fdd3

Is there any reason to bump it for master as well? If so, please tell us and if the reason is valid a maintainer will cherry-pick the patch from the next branch.

Regards,

Vincent.


________________________________________
From: buildroot [buildroot-bounces at busybox.net] on behalf of ishitatsuyuki at gmail.com [ishitatsuyuki at gmail.com]
Sent: 16 November 2016 09:27
To: buildroot at busybox.net
Cc: Tatsuyuki Ishi
Subject: [Buildroot] [PATCH] PHP: bump to 7.0.13

From: Tatsuyuki Ishi <ishitatsuyuki@gmail.com>

---
 package/php/php.hash | 2 +-
 package/php/php.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php/php.hash b/package/php/php.hash
index dde6a64..f1cd346 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,2 +1,2 @@
 # From http://php.net/downloads.php
-sha256 f3d6c49e1c242e5995dec15e503fde996c327eb86cd7ec45c690e93c971b83ff  php-7.0.12.tar.xz
+sha256 357ba7f93975d7d836abed0852dc3ed96a988af539e87750613294cbee82f1bf  php-7.0.13.tar.xz
diff --git a/package/php/php.mk b/package/php/php.mk
index f85cb37..c8abe66 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################

-PHP_VERSION = 7.0.12
+PHP_VERSION = 7.0.13
 PHP_SITE = http://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
--
2.10.2

_______________________________________________
buildroot mailing list
buildroot at busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
