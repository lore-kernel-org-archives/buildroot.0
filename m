From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 29 Apr 2016 08:49:22 +0200
Subject: [Buildroot] [git commit] php: security bump to version 5.6.21
Message-ID: <20160429065012.1706181983@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=915576a01c9c758788ba42b7fe2b9fe0f6258abb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes (CVEs not assigned yet):
bug #72094 - Out of bounds heap read access in exif header processing
bug #71912 - libgd: signedness vulnerability
bug #72061 - Out-of-bounds reads in zif_grapheme_stripos with negative offset
bug #71843 - null ptr deref ZEND_RETURN_SPEC_CONST_HANDLER
bug #71952 - Corruption inside imageaffinematrixget

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/php/php.hash | 2 +-
 package/php/php.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php/php.hash b/package/php/php.hash
index e359bf7..4feb3ca 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,2 +1,2 @@
 # From http://php.net/downloads.php
-sha256	2b87d40213361112af49157a435e0d4cdfd334c9b7c731c8b844932b1f444e7a	php-5.6.20.tar.xz
+sha256	566ff1a486cb0485ed477a91ea292423f77a58671270ff73b74e67e3ce7084f9	php-5.6.21.tar.xz
diff --git a/package/php/php.mk b/package/php/php.mk
index 1c92060..d58c4fd 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 5.6.20
+PHP_VERSION = 5.6.21
 PHP_SITE = http://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
