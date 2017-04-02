From: Rahul Bedarkar <rahulbedarkar89@gmail.com>
Date: Mon,  3 Apr 2017 00:13:06 +0530
Subject: [Buildroot] [PATCH 5/7] php-ssh2: add version to license string
In-Reply-To: <1491158588-6698-1-git-send-email-rahulbedarkar89@gmail.com>
References: <1491158588-6698-1-git-send-email-rahulbedarkar89@gmail.com>
Message-ID: <1491158588-6698-5-git-send-email-rahulbedarkar89@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

LICENSE file refers to PHP license version 3.01

Signed-off-by: Rahul Bedarkar <rahulbedarkar89@gmail.com>
---
 package/php-ssh2/php-ssh2.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/php-ssh2/php-ssh2.mk b/package/php-ssh2/php-ssh2.mk
index 2b61632..931cde9 100644
--- a/package/php-ssh2/php-ssh2.mk
+++ b/package/php-ssh2/php-ssh2.mk
@@ -10,7 +10,7 @@ PHP_SSH2_CONF_OPTS = --with-php-config=$(STAGING_DIR)/usr/bin/php-config \
 	--with-ssh2=$(STAGING_DIR)/usr
 # phpize does the autoconf magic
 PHP_SSH2_DEPENDENCIES = libssh2 php host-autoconf
-PHP_SSH2_LICENSE = PHP
+PHP_SSH2_LICENSE = PHP-3.01
 PHP_SSH2_LICENSE_FILES = LICENSE
 
 define PHP_SSH2_PHPIZE
-- 
2.7.4
