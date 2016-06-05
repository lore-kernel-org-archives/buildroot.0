From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  5 Jun 2016 19:52:19 +0200
Subject: [Buildroot] [PATCH 26/28] package/php-ssh2: bump version
In-Reply-To: <1465149141-15774-1-git-send-email-bernd.kuhls@t-online.de>
References: <1465149141-15774-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1465149141-15774-26-git-send-email-bernd.kuhls@t-online.de>
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
index 1e046df..b514601 100644
--- a/package/php-ssh2/php-ssh2.hash
+++ b/package/php-ssh2/php-ssh2.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 877f2fa9a709aa2dd9567848fae7b45ecac359904296a0aedbf718e99d8568f5  php-ssh2-aa1739ac26c2177d33ab8d064021032bdc2c3a40.tar.gz
+sha256 3d79a6c9ffed3fd6ec16e834c0cc93cf125d9f5bdbb951b8b76a3507498548d5  php-ssh2-12dd52236c601577a63e33ee71e3ce6dad811e40.tar.gz
diff --git a/package/php-ssh2/php-ssh2.mk b/package/php-ssh2/php-ssh2.mk
index cfe6070..2b61632 100644
--- a/package/php-ssh2/php-ssh2.mk
+++ b/package/php-ssh2/php-ssh2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_SSH2_VERSION = aa1739ac26c2177d33ab8d064021032bdc2c3a40
+PHP_SSH2_VERSION = 12dd52236c601577a63e33ee71e3ce6dad811e40
 PHP_SSH2_SITE = $(call github,php,pecl-networking-ssh2,$(PHP_SSH2_VERSION))
 PHP_SSH2_CONF_OPTS = --with-php-config=$(STAGING_DIR)/usr/bin/php-config \
 	--with-ssh2=$(STAGING_DIR)/usr
-- 
2.8.1
