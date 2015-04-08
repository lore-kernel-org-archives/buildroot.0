From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 8 Apr 2015 21:23:03 +0200
Subject: [Buildroot] [git commit] php: bump to version 5.6.7
Message-ID: <20150408192716.6AF71818B7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a48bc40e2d2536a830ecaa9247a1238966a97741
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/php/php.hash |    2 +-
 package/php/php.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php/php.hash b/package/php/php.hash
index 0794db8..e5e42d2 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,2 +1,2 @@
 # From http://php.net/downloads.php
-md5	692f9bc5649806f2053eee1e7323b7ea	php-5.5.23.tar.xz
+md5	4e04eb021de009981ed963f993a171c1	php-5.6.7.tar.xz
diff --git a/package/php/php.mk b/package/php/php.mk
index 73ed494..ed842b0 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 5.5.23
+PHP_VERSION = 5.6.7
 PHP_SITE = http://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
