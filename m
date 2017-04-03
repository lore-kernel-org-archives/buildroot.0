From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 3 Apr 2017 14:49:32 +0200
Subject: [Buildroot] [git commit] php-ssh2: add version to license string
Message-ID: <20170403125752.53F0882675@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2ea5a1489822652634ae3e6db7977372bbe8b9d2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

LICENSE file refers to PHP license version 3.01

Signed-off-by: Rahul Bedarkar <rahulbedarkar89@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/php-ssh2/php-ssh2.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/php-ssh2/php-ssh2.mk b/package/php-ssh2/php-ssh2.mk
index 2b61632..931cde9 100644
--- a/package/php-ssh2/php-ssh2.mk
+++ b/package/php-ssh2/php-ssh2.mk
@@ -10,7 +10,7 @@ PHP_SSH2_CONF_OPTS = --with-php-config=$(STAGING_DIR)/usr/bin/php-config \
 	--with-ssh2=$(STAGING_DIR)/usr
 # phpize does the autoconf magic
 PHP_SSH2_DEPENDENCIES = libssh2 php host-autoconf
-PHP_SSH2_LICENSE = PHP
+PHP_SSH2_LICENSE = PHP-3.01
 PHP_SSH2_LICENSE_FILES = LICENSE
 
 define PHP_SSH2_PHPIZE
