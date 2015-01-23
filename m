From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 23 Jan 2015 16:44:27 +0100
Subject: [Buildroot] [git commit] php: security bump to version 5.5.21
Message-ID: <20150123155105.7E7518014A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=626030fb1b9de47430254fce4dcf5ac5c526242f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
CVE-2015-0231 - Use After Free Vulnerability in PHP's unserialize()
CVE-2014-9427 - Out of bounds read crashes php-cgi
CVE-2015-0232 - Free called on unitialized pointer

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/php/php.hash |    2 +-
 package/php/php.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php/php.hash b/package/php/php.hash
index 0117289..cd27b10 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,2 +1,2 @@
 # From http://php.net/downloads.php
-md5	51377838dfee2d7bb4715674ac715394	php-5.5.20.tar.xz
+md5	79664ce44f7c93f355a25a3fe3dcc91b	php-5.5.21.tar.xz
diff --git a/package/php/php.mk b/package/php/php.mk
index a5f4574..4bcbe18 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 5.5.20
+PHP_VERSION = 5.5.21
 PHP_SITE = http://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
