From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 27 Mar 2013 15:54:14 +0100
Subject: [Buildroot] [git commit] php: fix typo for fileinfo extension
Message-ID: <20130327145352.2578E9B34D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ff2038924fee4fbf6b2459a491138c337bdb8ace
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As reported by Aleksandar <aleksandar.zivkovic@gmail.com> in bug #6140

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/php/php.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
