From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 10 Jun 2017 10:24:53 +0200
Subject: [Buildroot] [PATCH 1/1] package/php: bump version to 7.1.6
Message-ID: <20170610082453.13380-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/php/php.hash | 2 +-
 package/php/php.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php/php.hash b/package/php/php.hash
index d34242fea..0c8518b13 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,2 +1,2 @@
 # From http://php.net/downloads.php
-sha256 d149a3c396c45611f5dc6bf14be190f464897145a76a8e5851cf18ff7094f6ac  php-7.1.5.tar.xz
+sha256 01584dc521ab7ec84b502b61952f573652fe6aa00c18d6d844fb9209f14b245b  php-7.1.6.tar.xz
diff --git a/package/php/php.mk b/package/php/php.mk
index 2e4b667f9..494f681c7 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 7.1.5
+PHP_VERSION = 7.1.6
 PHP_SITE = http://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
-- 
2.11.0
