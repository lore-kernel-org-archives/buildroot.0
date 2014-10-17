From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 17 Oct 2014 11:23:24 +0200
Subject: [Buildroot] [git commit] php: security bump to version 5.5.18
Message-ID: <20141017092330.39F20BD422@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f8abb0b3d90cd1cc6a807e3beaa6ad01d8d84860
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
CVE-2014-3669 - Integer overflow in unserialize() (32-bits only)
CVE-2014-3670 - Heap corruption in exif_thumbnail()
CVE-2014-3668 - Global buffer overflow in mkgmtime() function

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Acked-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/php/php.hash |    2 +-
 package/php/php.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php/php.hash b/package/php/php.hash
index bee8cff..6bb0d1c 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,2 +1,2 @@
 # From http://php.net/downloads.php
-md5	e5f25dae73004658533ee7701a527bd0	php-5.5.17.tar.xz
+md5	3984f32985842afebe5795457e26931f	php-5.5.18.tar.xz
diff --git a/package/php/php.mk b/package/php/php.mk
index bca4f3a..26ec67d 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 5.5.17
+PHP_VERSION = 5.5.18
 PHP_SITE = http://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
