From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 27 Mar 2013 11:43:07 -0300
Subject: [Buildroot] [PATCH] php: fix typo for fileinfo extension
Message-ID: <1364395387-29580-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As reported by Aleksandar <aleksandar.zivkovic@gmail.com> in bug #6140

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/php/php.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/php/php.mk b/package/php/php.mk
index 692ceb8..515244d 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -57,7 +57,7 @@ PHP_CONF_OPT += $(if $(BR2_PACKAGE_PHP_EXT_SOCKETS),--enable-sockets) \
 		$(if $(BR2_PACKAGE_PHP_EXT_CTYPE),--enable-ctype) \
 		$(if $(BR2_PACKAGE_PHP_EXT_FILTER),--enable-filter) \
 		$(if $(BR2_PACKAGE_PHP_EXT_CALENDAR),--enable-calendar) \
-		$(if $(BR2_PACKAGE_PHP_EXT_FILENIFO),--enable-fileinfo) \
+		$(if $(BR2_PACKAGE_PHP_EXT_FILEINFO),--enable-fileinfo) \
 		$(if $(BR2_PACKAGE_PHP_EXT_BCMATH),--enable-bcmath)
 
 ifeq ($(BR2_PACKAGE_PHP_EXT_OPENSSL),y)
-- 
1.8.1.5
