From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 5 Feb 2016 23:23:07 +0100
Subject: [Buildroot] [git commit] package/php: security bump version to
	5.6.18
Message-ID: <20160205222802.461B980E63@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b420e0b55983d44e7bad854da5ca00907a77f868
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog: http://www.php.net/ChangeLog-5.php#5.6.18
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/php/php.hash | 2 +-
 package/php/php.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php/php.hash b/package/php/php.hash
index 7a7616f..5cdafc6 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,2 +1,2 @@
 # From http://php.net/downloads.php
-sha256	ea9d5749380c7c7171e131616466deacd7cb124b5010eafc34e551b0a7b0fb2c	php-5.6.17.tar.xz
+sha256	54dd9106c3469bc7028644d72ac140af00655420bbaaf4a742a64e9ed02ec1b0	php-5.6.18.tar.xz
diff --git a/package/php/php.mk b/package/php/php.mk
index 84443a1..f2c7e28 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 5.6.17
+PHP_VERSION = 5.6.18
 PHP_SITE = http://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
