From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 Sep 2016 14:05:41 +0200
Subject: [Buildroot] [git commit] php: bump to 7.0.11
Message-ID: <20160917121312.2DB5C8074E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=82cc7ecf9f4626eb5458bc476cd3f0a1ae312e94
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Tatsuyuki Ishi <ishitatsuyuki@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/php/php.hash | 2 +-
 package/php/php.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php/php.hash b/package/php/php.hash
index 6e146f8..0092095 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,2 +1,2 @@
 # From http://php.net/downloads.php
-sha256 970c322ba3e472cb0264b8ba9d4d92e87918da5d0cca53c4aba2a70545b8626d  php-7.0.9.tar.xz
+sha256 d4cccea8da1d27c11b89386f8b8e95692ad3356610d571253d00ca67d524c735  php-7.0.11.tar.xz
diff --git a/package/php/php.mk b/package/php/php.mk
index 7df10be..083b451 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 7.0.9
+PHP_VERSION = 7.0.11
 PHP_SITE = http://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
