From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 3 Jul 2021 21:56:47 +0200
Subject: [Buildroot] [git commit] package/php-memcached: bump version to
 3.1.5
Message-ID: <20210703192906.956F68F175@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a4b5622a34ce89eae23005801ff60833145b60ac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/php-memcached/php-memcached.hash | 8 ++++----
 package/php-memcached/php-memcached.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/php-memcached/php-memcached.hash b/package/php-memcached/php-memcached.hash
index dd294f466a..7e918c17f6 100644
--- a/package/php-memcached/php-memcached.hash
+++ b/package/php-memcached/php-memcached.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256 20786213ff92cd7ebdb0d0ac10dde1e9580a2f84296618b666654fd76ea307d4  memcached-3.1.3.tgz
-sha256 24e8e3a9529204ead9422fa17cf3ddd75d292a8763b87fdb20591964f2e6ebe0  LICENSE
-sha256 a453a7a272fbd24105b39959f76996d50dad80b22d1c310f6c67f74f62ae4054  fastlz/LICENSE
-sha256 bba8cb50c660842c5ca459c5004395bdef8f01c1b64f97a9978f1053f173cb82  g_fmt.h
+sha256  b288e45f839593e16c4d8508b241de51a86df4f7322153e6becb9e1c819021fd  memcached-3.1.5.tgz
+sha256  24e8e3a9529204ead9422fa17cf3ddd75d292a8763b87fdb20591964f2e6ebe0  LICENSE
+sha256  a453a7a272fbd24105b39959f76996d50dad80b22d1c310f6c67f74f62ae4054  fastlz/LICENSE
+sha256  bba8cb50c660842c5ca459c5004395bdef8f01c1b64f97a9978f1053f173cb82  g_fmt.h
diff --git a/package/php-memcached/php-memcached.mk b/package/php-memcached/php-memcached.mk
index 4607d099f3..068fbb786b 100644
--- a/package/php-memcached/php-memcached.mk
+++ b/package/php-memcached/php-memcached.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_MEMCACHED_VERSION = 3.1.3
+PHP_MEMCACHED_VERSION = 3.1.5
 PHP_MEMCACHED_SOURCE = memcached-$(PHP_MEMCACHED_VERSION).tgz
 PHP_MEMCACHED_SITE = https://pecl.php.net/get
 PHP_MEMCACHED_CONF_OPTS = --with-php-config=$(STAGING_DIR)/usr/bin/php-config \
