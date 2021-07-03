From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 3 Jul 2021 21:56:50 +0200
Subject: [Buildroot] [git commit] package/php-yaml: bump version to 2.2.1
Message-ID: <20210703192906.BC01D8F175@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d2ab6c4b366417ed5cd72b701e5a538ed1cf8130
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/php-yaml/php-yaml.hash | 4 ++--
 package/php-yaml/php-yaml.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/php-yaml/php-yaml.hash b/package/php-yaml/php-yaml.hash
index c29c3e66ad..e4f31cdad9 100644
--- a/package/php-yaml/php-yaml.hash
+++ b/package/php-yaml/php-yaml.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 9786b0386e648f12cc18a038358bd57bee4906e350a2e9ab776d6a5f18fc6680  yaml-2.0.4.tgz
-sha256 68d9700294396c72089bfc7bf38a5b3654a53ae415f3bd37768848c14e86f338  LICENSE
+sha256  e17ad04e752e25fd099bddd2df9d26dfef183c8d00c4179bc9d7a2e1c97d7819  yaml-2.2.1.tgz
+sha256  68d9700294396c72089bfc7bf38a5b3654a53ae415f3bd37768848c14e86f338  LICENSE
diff --git a/package/php-yaml/php-yaml.mk b/package/php-yaml/php-yaml.mk
index e23d897978..ba16c9ac62 100644
--- a/package/php-yaml/php-yaml.mk
+++ b/package/php-yaml/php-yaml.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_YAML_VERSION = 2.0.4
+PHP_YAML_VERSION = 2.2.1
 PHP_YAML_SOURCE = yaml-$(PHP_YAML_VERSION).tgz
 PHP_YAML_SITE = https://pecl.php.net/get
 PHP_YAML_CONF_OPTS = --with-php-config=$(STAGING_DIR)/usr/bin/php-config \
