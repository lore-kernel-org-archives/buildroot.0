From: Rahul Bedarkar <rahulbedarkar89@gmail.com>
Date: Mon,  3 Apr 2017 00:13:02 +0530
Subject: [Buildroot] [PATCH 1/7] php-amqp: add version to license string
Message-ID: <1491158588-6698-1-git-send-email-rahulbedarkar89@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

LICENSE file refers to PHP license version 3.01.

Signed-off-by: Rahul Bedarkar <rahulbedarkar89@gmail.com>
---
 package/php-amqp/php-amqp.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/php-amqp/php-amqp.mk b/package/php-amqp/php-amqp.mk
index d3ffe16..fe49f4b 100644
--- a/package/php-amqp/php-amqp.mk
+++ b/package/php-amqp/php-amqp.mk
@@ -11,7 +11,7 @@ PHP_AMQP_CONF_OPTS = --with-php-config=$(STAGING_DIR)/usr/bin/php-config \
 	--with-amqp=$(STAGING_DIR)/usr
 # phpize does the autoconf magic
 PHP_AMQP_DEPENDENCIES = rabbitmq-c php host-autoconf
-PHP_AMQP_LICENSE = PHP
+PHP_AMQP_LICENSE = PHP-3.01
 PHP_AMQP_LICENSE_FILES = LICENSE
 
 define PHP_AMQP_PHPIZE
-- 
2.7.4
