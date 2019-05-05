From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 5 May 2019 12:09:32 +0200
Subject: [Buildroot] [git commit] package/php: security bump version to 7.3.5
Message-ID: <20190505100747.73FAC83C3C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=934239eafb4387d5a10cbf15852fac4f56d89839
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes: https://www.php.net/archive/2019.php#id2019-05-02-1

Fixes 2019-11036:
* Heap-buffer-overflow in _estrndup via exif_process_IFD_TAG

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/php/php.hash | 2 +-
 package/php/php.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php/php.hash b/package/php/php.hash
index fb25521955..b764f8a507 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,5 +1,5 @@
 # From http://php.net/downloads.php
-sha256 6fe79fa1f8655f98ef6708cde8751299796d6c1e225081011f4104625b923b83  php-7.3.4.tar.xz
+sha256 e1011838a46fd4a195c8453b333916622d7ff5bce4aca2d9d99afac142db2472  php-7.3.5.tar.xz
 
 # License file
 sha256 f689b8fa63bea7950ce6a21bf52ed88ea0d77673ee76e6de12f51191174d91b8  LICENSE
diff --git a/package/php/php.mk b/package/php/php.mk
index d3a4d3984d..ed71c96c8a 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 7.3.4
+PHP_VERSION = 7.3.5
 PHP_SITE = http://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
