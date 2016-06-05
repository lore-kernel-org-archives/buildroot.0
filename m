From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 5 Jun 2016 22:02:41 +0200
Subject: [Buildroot] [git commit] package/php-ssh2: bump version
Message-ID: <20160605200530.E7ECC81E84@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=57ade6f19075d4c55a49b85a92ef7ebf9cab8a84
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
