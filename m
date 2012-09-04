From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  4 Sep 2012 11:07:38 -0300
Subject: [Buildroot] [PATCH 2/2] php: bump to version 5.3.16
In-Reply-To: <1346767658-7968-1-git-send-email-gustavo@zacarias.com.ar>
References: <1346767658-7968-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1346767658-7968-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
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
-- 
1.7.8.6
