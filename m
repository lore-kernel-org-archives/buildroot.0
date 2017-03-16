From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Thu, 16 Mar 2017 15:53:33 +0000
Subject: [Buildroot] [PATCH] php: bump version to 7.1.3
Message-ID: <20170316155333.39780-1-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/php/php.hash | 2 +-
 package/php/php.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php/php.hash b/package/php/php.hash
index 47e99d4..0e71c4b 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,2 +1,2 @@
 # From http://php.net/downloads.php
-sha256 d815a0c39fd57bab1434a77ff0610fb507c22f790c66cd6f26e27030c4b3e971  php-7.1.2.tar.xz
+sha256 e4887c2634778e37fd962fbdf5c4a7d32cd708482fe07b448804625570cb0bb0  php-7.1.3.tar.xz
diff --git a/package/php/php.mk b/package/php/php.mk
index 5b113d1..f59a4e8 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 7.1.2
+PHP_VERSION = 7.1.3
 PHP_SITE = http://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
-- 
2.10.2
