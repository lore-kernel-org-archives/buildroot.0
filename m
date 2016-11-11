From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 11 Nov 2016 17:15:09 +0000
Subject: [Buildroot] [PATCH next] php: bump version to 7.0.13
Message-ID: <20161111171509.41535-1-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Release notes: http://php.net/ChangeLog-7.php#7.0.13

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/php/php.hash | 2 +-
 package/php/php.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php/php.hash b/package/php/php.hash
index dde6a64..f1cd346 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,2 +1,2 @@
 # From http://php.net/downloads.php
-sha256 f3d6c49e1c242e5995dec15e503fde996c327eb86cd7ec45c690e93c971b83ff  php-7.0.12.tar.xz
+sha256 357ba7f93975d7d836abed0852dc3ed96a988af539e87750613294cbee82f1bf  php-7.0.13.tar.xz
diff --git a/package/php/php.mk b/package/php/php.mk
index f85cb37..c8abe66 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 7.0.12
+PHP_VERSION = 7.0.13
 PHP_SITE = http://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
-- 
2.10.1
