From: Rahul Bedarkar <rahulbedarkar89@gmail.com>
Date: Sun,  2 Apr 2017 00:36:31 +0530
Subject: [Buildroot] [PATCH 9/9] php: add version to license string
In-Reply-To: <1491073591-21477-1-git-send-email-rahulbedarkar89@gmail.com>
References: <1491073591-21477-1-git-send-email-rahulbedarkar89@gmail.com>
Message-ID: <1491073591-21477-9-git-send-email-rahulbedarkar89@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As per LICENSE file, php uses PHP license version 3.01.

Signed-off-by: Rahul Bedarkar <rahulbedarkar89@gmail.com>
---
 package/php/php.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/php/php.mk b/package/php/php.mk
index f59a4e8..22eeddd 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -11,7 +11,7 @@ PHP_INSTALL_STAGING = YES
 PHP_INSTALL_STAGING_OPTS = INSTALL_ROOT=$(STAGING_DIR) install
 PHP_INSTALL_TARGET_OPTS = INSTALL_ROOT=$(TARGET_DIR) install
 PHP_DEPENDENCIES = host-pkgconf
-PHP_LICENSE = PHP
+PHP_LICENSE = PHP-3.01
 PHP_LICENSE_FILES = LICENSE
 PHP_CONF_OPTS = \
 	--mandir=/usr/share/man \
-- 
2.7.4
