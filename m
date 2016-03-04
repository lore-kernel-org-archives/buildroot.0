From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 4 Mar 2016 17:07:47 +0100
Subject: [Buildroot] [git commit] php: bump to version 5.6.19
Message-ID: <20160304160920.6459A7FF69@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e6d744e3071af563a270060c13f3cc2ae7ce3c5f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/php/php.hash | 2 +-
 package/php/php.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php/php.hash b/package/php/php.hash
index 5cdafc6..9cfbcad 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,2 +1,2 @@
 # From http://php.net/downloads.php
-sha256	54dd9106c3469bc7028644d72ac140af00655420bbaaf4a742a64e9ed02ec1b0	php-5.6.18.tar.xz
+sha256	bb32337f93a00b71789f116bddafa8848139120e7fb6f4f98a84f52dbcb8329f	php-5.6.19.tar.xz
diff --git a/package/php/php.mk b/package/php/php.mk
index f2c7e28..6d27c30 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 5.6.18
+PHP_VERSION = 5.6.19
 PHP_SITE = http://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
