From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 14 Nov 2014 13:17:45 +0100
Subject: [Buildroot] [git commit] php: security bump to version 5.5.19
Message-ID: <20141114121919.F24D2B0E38@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9a5261544fb151531485a319e091f91032284c77
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
CVE-2014-3710 - fileinfo: out-of-bounds read in elf note headers.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/php/php.hash |    2 +-
 package/php/php.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php/php.hash b/package/php/php.hash
index 6bb0d1c..7a2dd70 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,2 +1,2 @@
 # From http://php.net/downloads.php
-md5	3984f32985842afebe5795457e26931f	php-5.5.18.tar.xz
+md5	c63dcfd8b318d12127ba6d39ecc8a444	php-5.5.19.tar.xz
diff --git a/package/php/php.mk b/package/php/php.mk
index 9456f1c..ae959db 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 5.5.18
+PHP_VERSION = 5.5.19
 PHP_SITE = http://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
