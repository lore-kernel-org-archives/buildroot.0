From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 18 Dec 2014 22:54:04 +0100
Subject: [Buildroot] [git commit] php: security bump to version 5.5.20
Message-ID: <20141218220056.4A48B7FED9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d64599ccb71a8ad33e5cebf69adb4065e23ce6b4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
CVE-2014-8142 - Use after free vulnerability in unserialize()

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/php/php.hash |    2 +-
 package/php/php.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php/php.hash b/package/php/php.hash
index 7a2dd70..0117289 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,2 +1,2 @@
 # From http://php.net/downloads.php
-md5	c63dcfd8b318d12127ba6d39ecc8a444	php-5.5.19.tar.xz
+md5	51377838dfee2d7bb4715674ac715394	php-5.5.20.tar.xz
diff --git a/package/php/php.mk b/package/php/php.mk
index 86864f0..8c322ec 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 5.5.19
+PHP_VERSION = 5.5.20
 PHP_SITE = http://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
