From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 20 May 2015 13:13:50 +0200
Subject: [Buildroot] [git commit] php: bump version to 5.6.9
Message-ID: <20150520132935.D7FC5800B1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=50a34eeb1bf5ff15443bec0f3f11fe90c0e97b70
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Floris Bos <bos@je-eigen-domein.nl>
Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/php/php.hash |    2 +-
 package/php/php.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php/php.hash b/package/php/php.hash
index 210c9f0..fe938f5 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,2 +1,2 @@
 # From http://php.net/downloads.php
-md5	526a5a7f593de632cd9e8546335de8b7	php-5.6.8.tar.xz
+sha256	1fac497b596f5e4e87d87a7ca90f8725e39a8ca3f9d7adb500fa83c4bb70a73f	php-5.6.9.tar.xz
diff --git a/package/php/php.mk b/package/php/php.mk
index abbdc24..6492747 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PHP_VERSION_MAJOR = 5.6
-PHP_VERSION = $(PHP_VERSION_MAJOR).8
+PHP_VERSION = $(PHP_VERSION_MAJOR).9
 PHP_SITE = http://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
