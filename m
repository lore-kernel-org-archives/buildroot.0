From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 26 Aug 2014 18:47:24 -0300
Subject: [Buildroot] [PATCH 2/3] stunnel: bump to version 5.03
In-Reply-To: <1409089645-23216-1-git-send-email-gustavo@zacarias.com.ar>
References: <1409089645-23216-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1409089645-23216-2-git-send-email-gustavo@zacarias.com.ar>
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
index 2da0e95..4de1650 100644
--- a/package/stunnel/stunnel.mk
+++ b/package/stunnel/stunnel.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STUNNEL_VERSION = 5.02
+STUNNEL_VERSION = 5.03
 STUNNEL_SITE = http://ftp.nluug.nl/pub/networking/stunnel/archive/5.x
 STUNNEL_DEPENDENCIES = openssl
 STUNNEL_CONF_OPT = --with-ssl=$(STAGING_DIR)/usr --with-threads=fork
-- 
1.8.5.5
