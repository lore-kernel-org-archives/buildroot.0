From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 17 Jun 2014 11:40:51 -0300
Subject: [Buildroot] [PATCH 1/2] stunnel: bump to version 5.02
Message-ID: <1403016052-27524-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/stunnel/stunnel.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/stunnel/stunnel.mk b/package/stunnel/stunnel.mk
index ec3af4b..aef67b9 100644
--- a/package/stunnel/stunnel.mk
+++ b/package/stunnel/stunnel.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STUNNEL_VERSION = 5.01
+STUNNEL_VERSION = 5.02
 STUNNEL_SITE = http://ftp.nluug.nl/pub/networking/stunnel/archive/5.x/
 STUNNEL_DEPENDENCIES = openssl
 STUNNEL_CONF_OPT = --with-ssl=$(STAGING_DIR)/usr --with-threads=fork
-- 
1.8.5.5
