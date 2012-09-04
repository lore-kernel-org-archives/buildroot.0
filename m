From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 4 Sep 2012 22:02:15 +0200
Subject: [Buildroot] [git commit] php: bump to version 5.3.16
Message-ID: <20120904200552.1F0E999503@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ca56df4e442027e51465fd23435d6a165f9ef720
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/php/php.mk |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/php/php.mk b/package/php/php.mk
index 0544659..2f8e99e 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,12 +4,14 @@
 #
 #############################################################
 
-PHP_VERSION = 5.3.15
+PHP_VERSION = 5.3.16
 PHP_SOURCE = php-$(PHP_VERSION).tar.bz2
 PHP_SITE = http://www.php.net/distributions
 PHP_INSTALL_STAGING = YES
 PHP_INSTALL_STAGING_OPT = INSTALL_ROOT=$(STAGING_DIR) install
 PHP_INSTALL_TARGET_OPT = INSTALL_ROOT=$(TARGET_DIR) install
+PHP_LICENSE = PHP
+PHP_LICENSE_FILES = LICENSE
 PHP_CONF_OPT =  --mandir=/usr/share/man \
 		--infodir=/usr/share/info \
 		--disable-all \
