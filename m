From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 22 Sep 2017 18:17:43 +0200
Subject: [Buildroot] [git commit] package/php-yaml: bump version to 2.0.2
Message-ID: <20170922161618.876DD807C8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=82cab1a9997a0f3d9e35c8c20ec65cdd5a6f8e74
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/php-yaml/php-yaml.hash | 2 +-
 package/php-yaml/php-yaml.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php-yaml/php-yaml.hash b/package/php-yaml/php-yaml.hash
index 6a2f154..21b507e 100644
--- a/package/php-yaml/php-yaml.hash
+++ b/package/php-yaml/php-yaml.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 ef13ff56c184290c025a522bf9ae2e1b3ecc8543c3a5161dd02adec90897a221  yaml-2.0.0.tgz
+sha256 c3afb0dad47b6c3a5b7b449f57a4938df27bf974efbe188d85c4fb998eff0039  yaml-2.0.2.tgz
diff --git a/package/php-yaml/php-yaml.mk b/package/php-yaml/php-yaml.mk
index bba7894..086d575 100644
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
