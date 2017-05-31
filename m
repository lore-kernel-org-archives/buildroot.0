From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 31 May 2017 23:35:42 +0200
Subject: [Buildroot] [git commit] php-yaml: bump version to 2.0.0
Message-ID: <20170601202902.0849B7FDDD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8e5eef6c323c6a928ccea7279b3d9848419b99d9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/php-yaml/php-yaml.hash | 2 +-
 package/php-yaml/php-yaml.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php-yaml/php-yaml.hash b/package/php-yaml/php-yaml.hash
index a40677e..6a2f154 100644
--- a/package/php-yaml/php-yaml.hash
+++ b/package/php-yaml/php-yaml.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 d49acf2b7843258957a16df0d7ced56c0e1fc3eaa54f54289e4012edc002814c  yaml-2.0.0RC7.tgz
+sha256 ef13ff56c184290c025a522bf9ae2e1b3ecc8543c3a5161dd02adec90897a221  yaml-2.0.0.tgz
diff --git a/package/php-yaml/php-yaml.mk b/package/php-yaml/php-yaml.mk
index 2711890..9296091 100644
--- a/package/php-yaml/php-yaml.mk
+++ b/package/php-yaml/php-yaml.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_YAML_VERSION = 2.0.0RC7
+PHP_YAML_VERSION = 2.0.0
 PHP_YAML_SOURCE = yaml-$(PHP_YAML_VERSION).tgz
 PHP_YAML_SITE = https://pecl.php.net/get
 PHP_YAML_CONF_OPTS = --with-php-config=$(STAGING_DIR)/usr/bin/php-config \
