From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 12 Jan 2019 14:52:34 +0100
Subject: [Buildroot] [git commit] package/php-yaml: bump to version 2.0.4
Message-ID: <20190112135219.E553D88838@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7533ad87979772271f7b472a6e2bc471cc91e1f3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This bump fix build with php 7.3.0
Also add hash for license file

Fixes:
 - http://autobuild.buildroot.org/results/8d23d9c1b30d104d44ab82475dd12f1c4ab1e125

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/php-yaml/php-yaml.hash | 3 ++-
 package/php-yaml/php-yaml.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/php-yaml/php-yaml.hash b/package/php-yaml/php-yaml.hash
index 21b507e188..c29c3e66ad 100644
--- a/package/php-yaml/php-yaml.hash
+++ b/package/php-yaml/php-yaml.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256 c3afb0dad47b6c3a5b7b449f57a4938df27bf974efbe188d85c4fb998eff0039  yaml-2.0.2.tgz
+sha256 9786b0386e648f12cc18a038358bd57bee4906e350a2e9ab776d6a5f18fc6680  yaml-2.0.4.tgz
+sha256 68d9700294396c72089bfc7bf38a5b3654a53ae415f3bd37768848c14e86f338  LICENSE
diff --git a/package/php-yaml/php-yaml.mk b/package/php-yaml/php-yaml.mk
index 086d575e97..e23d897978 100644
--- a/package/php-yaml/php-yaml.mk
+++ b/package/php-yaml/php-yaml.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_YAML_VERSION = 2.0.2
+PHP_YAML_VERSION = 2.0.4
 PHP_YAML_SOURCE = yaml-$(PHP_YAML_VERSION).tgz
 PHP_YAML_SITE = https://pecl.php.net/get
 PHP_YAML_CONF_OPTS = --with-php-config=$(STAGING_DIR)/usr/bin/php-config \
