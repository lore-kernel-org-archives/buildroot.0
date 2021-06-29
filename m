From: Adam Duskett <aduskett@gmail.com>
Date: Tue, 29 Jun 2021 09:50:44 -0700
Subject: [Buildroot] [PATCH 01/11] package/php-amqp: bump version to 1.10.2
Message-ID: <20210629165054.3831930-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/php-amqp/php-amqp.hash | 4 ++--
 package/php-amqp/php-amqp.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/php-amqp/php-amqp.hash b/package/php-amqp/php-amqp.hash
index c061efabb9..bce8ac0c9a 100644
--- a/package/php-amqp/php-amqp.hash
+++ b/package/php-amqp/php-amqp.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 b66b8b8264749cb7a69ae4d09665dad1559b6c4f01430206c8e4187bcd8c782d  amqp-1.9.4.tgz
-sha256 ecd004e9ae3fcf54896b562d5e8008e36041f2620076effd58e5f4187299cee8  LICENSE
+sha256  0ebc61052eb12406dddf5eabfe8749a12d52c566816b8aab04fb9916d0c26ed2  amqp-1.10.2.tgz
+sha256  ecd004e9ae3fcf54896b562d5e8008e36041f2620076effd58e5f4187299cee8  LICENSE
diff --git a/package/php-amqp/php-amqp.mk b/package/php-amqp/php-amqp.mk
index c808ecdbd6..981f8274a9 100644
--- a/package/php-amqp/php-amqp.mk
+++ b/package/php-amqp/php-amqp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_AMQP_VERSION = 1.9.4
+PHP_AMQP_VERSION = 1.10.2
 PHP_AMQP_SOURCE = amqp-$(PHP_AMQP_VERSION).tgz
 PHP_AMQP_SITE = https://pecl.php.net/get
 PHP_AMQP_CONF_OPTS = --with-php-config=$(STAGING_DIR)/usr/bin/php-config \
-- 
2.31.1
