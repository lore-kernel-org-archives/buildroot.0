From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 17 Sep 2017 11:23:18 +0200
Subject: [Buildroot] [PATCH 1/1] package/php-ssh2: bump version to 1.1.2
Message-ID: <20170917092318.15019-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/php-ssh2/php-ssh2.hash | 2 +-
 package/php-ssh2/php-ssh2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php-ssh2/php-ssh2.hash b/package/php-ssh2/php-ssh2.hash
index 2529f9aef9..f110e77866 100644
--- a/package/php-ssh2/php-ssh2.hash
+++ b/package/php-ssh2/php-ssh2.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 6a93891878b23904a773eb814fec7aea4ea00b4a412ee779c8535ed9c5e46ced  ssh2-1.0.tgz
+sha256 87618d6a0981afe8c24b36d6b38c21a0aa0237b62e60347d0170bd86b51f79fb  ssh2-1.1.2.tgz
diff --git a/package/php-ssh2/php-ssh2.mk b/package/php-ssh2/php-ssh2.mk
index d7ac2b480a..c9c13010dd 100644
--- a/package/php-ssh2/php-ssh2.mk
+++ b/package/php-ssh2/php-ssh2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_SSH2_VERSION = 1.0
+PHP_SSH2_VERSION = 1.1.2
 PHP_SSH2_SOURCE = ssh2-$(PHP_SSH2_VERSION).tgz
 PHP_SSH2_SITE = https://pecl.php.net/get
 PHP_SSH2_CONF_OPTS = --with-php-config=$(STAGING_DIR)/usr/bin/php-config \
-- 
2.11.0
