From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 17 Apr 2015 18:29:33 +0200
Subject: [Buildroot] [git commit] php: security bump to version 5.6.8
Message-ID: <20150417162945.7C22481879@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4e1f7ce9f9158c3bb60f544d12d5953ca0463d37
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
CVE-2015-1351 - OPCache: Use After Free
CVE-2015-1352 - Postgres: Null pointer dereference

And others with no CVE assigned yet.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/php/php.hash |    2 +-
 package/php/php.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php/php.hash b/package/php/php.hash
index e5e42d2..210c9f0 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,2 +1,2 @@
 # From http://php.net/downloads.php
-md5	4e04eb021de009981ed963f993a171c1	php-5.6.7.tar.xz
+md5	526a5a7f593de632cd9e8546335de8b7	php-5.6.8.tar.xz
diff --git a/package/php/php.mk b/package/php/php.mk
index 1a5e084..f305afa 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 5.6.7
+PHP_VERSION = 5.6.8
 PHP_SITE = http://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
