From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon,  4 Jun 2018 22:57:51 +0200
Subject: [Buildroot] [PATCH 1/1] php-amqp: bump to version 1.9.3
Message-ID: <20180604205751.1724-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/php-amqp/php-amqp.hash | 3 ++-
 package/php-amqp/php-amqp.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/php-amqp/php-amqp.hash b/package/php-amqp/php-amqp.hash
index 4b3b19726f..10b16f1b48 100644
--- a/package/php-amqp/php-amqp.hash
+++ b/package/php-amqp/php-amqp.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256 f45831d498b8fa47a151c31f6abdc0530aa6eabda6e2e10514aca3bdc76a5098  amqp-1.9.0.tgz
+sha256 c79e52db33bf907dad7da8f350dbdf2937b0679a3dc44fb2a941efb6d4808da9  amqp-1.9.3.tgz
+sha256 ecd004e9ae3fcf54896b562d5e8008e36041f2620076effd58e5f4187299cee8  LICENSE
diff --git a/package/php-amqp/php-amqp.mk b/package/php-amqp/php-amqp.mk
index 6a8c52c4cf..e9de4825a9 100644
--- a/package/php-amqp/php-amqp.mk
+++ b/package/php-amqp/php-amqp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_AMQP_VERSION = 1.9.0
+PHP_AMQP_VERSION = 1.9.3
 PHP_AMQP_SOURCE = amqp-$(PHP_AMQP_VERSION).tgz
 PHP_AMQP_SITE = https://pecl.php.net/get
 PHP_AMQP_CONF_OPTS = --with-php-config=$(STAGING_DIR)/usr/bin/php-config \
-- 
2.14.1
