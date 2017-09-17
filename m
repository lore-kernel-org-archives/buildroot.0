From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 17 Sep 2017 11:36:49 +0200
Subject: [Buildroot] [PATCH 2/2] package/php-yaml: bump version to 2.0.2
In-Reply-To: <20170917093649.21801-1-bernd.kuhls@t-online.de>
References: <20170917093649.21801-1-bernd.kuhls@t-online.de>
Message-ID: <20170917093649.21801-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/php-yaml/php-yaml.hash | 2 +-
 package/php-yaml/php-yaml.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php-yaml/php-yaml.hash b/package/php-yaml/php-yaml.hash
index 6a2f1545df..21b507e188 100644
--- a/package/php-yaml/php-yaml.hash
+++ b/package/php-yaml/php-yaml.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 ef13ff56c184290c025a522bf9ae2e1b3ecc8543c3a5161dd02adec90897a221  yaml-2.0.0.tgz
+sha256 c3afb0dad47b6c3a5b7b449f57a4938df27bf974efbe188d85c4fb998eff0039  yaml-2.0.2.tgz
diff --git a/package/php-yaml/php-yaml.mk b/package/php-yaml/php-yaml.mk
index bba7894f9f..086d575e97 100644
--- a/package/php-yaml/php-yaml.mk
+++ b/package/php-yaml/php-yaml.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_YAML_VERSION = 2.0.0
+PHP_YAML_VERSION = 2.0.2
 PHP_YAML_SOURCE = yaml-$(PHP_YAML_VERSION).tgz
 PHP_YAML_SITE = https://pecl.php.net/get
 PHP_YAML_CONF_OPTS = --with-php-config=$(STAGING_DIR)/usr/bin/php-config \
-- 
2.11.0
