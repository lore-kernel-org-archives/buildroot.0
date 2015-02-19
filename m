From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 19 Feb 2015 21:27:31 +0100
Subject: [Buildroot] [git commit] php: security bump to version 5.5.22
Message-ID: <20150219202834.32AD57FFE0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f08a9db47e4de299058d427b27354066ab30eaec
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
CVE-2015-0273 - Use after free vulnerability in unserialize() with
DateTimeZone.
CVE-2015-0235 - Mitigation for GHOST: glibc gethostbyname buffer
overflow.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/php/php.hash |    2 +-
 package/php/php.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php/php.hash b/package/php/php.hash
index cd27b10..f8a1715 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,2 +1,2 @@
 # From http://php.net/downloads.php
-md5	79664ce44f7c93f355a25a3fe3dcc91b	php-5.5.21.tar.xz
+md5	fb1704131d495f5b3e6ab3b087a8dbe6	php-5.5.22.tar.xz
diff --git a/package/php/php.mk b/package/php/php.mk
index 4bcbe18..dd52508 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 5.5.21
+PHP_VERSION = 5.5.22
 PHP_SITE = http://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
