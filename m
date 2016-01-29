From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 29 Jan 2016 17:51:09 +0100
Subject: [Buildroot] [git commit] php: drop useless PHP_VERSION_MAJOR
	variable
Message-ID: <20160201224702.0D9897F8D4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f6332ebcce5ab1e7ea212ccb94a9d9c49851fd30
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

~/buildroot$ grep -R PHP_VERSION_MAJOR .
./package/php/php.mk:PHP_VERSION_MAJOR = 5.6
./package/php/php.mk:PHP_VERSION = $(PHP_VERSION_MAJOR).17

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/php/php.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/php/php.mk b/package/php/php.mk
index ed391c0..84443a1 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,8 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION_MAJOR = 5.6
-PHP_VERSION = $(PHP_VERSION_MAJOR).17
+PHP_VERSION = 5.6.17
 PHP_SITE = http://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
