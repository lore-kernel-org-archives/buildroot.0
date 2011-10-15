From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 15 Oct 2011 00:07:36 -0300
Subject: [Buildroot] [PATCH 22/25] stunnel: bump to version 4.44
In-Reply-To: <1318648059-30431-1-git-send-email-gustavo@zacarias.com.ar>
References: <1318648059-30431-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1318648059-30431-22-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/stunnel/stunnel.mk |    5 ++---
 1 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/stunnel/stunnel.mk b/package/stunnel/stunnel.mk
index 1f40397..6088e58 100644
--- a/package/stunnel/stunnel.mk
+++ b/package/stunnel/stunnel.mk
@@ -4,10 +4,9 @@
 #
 #############################################################
 
-STUNNEL_VERSION = 4.36
-STUNNEL_SITE = http://ftp.nluug.nl/pub/networking/stunnel/obsolete/4.x/
+STUNNEL_VERSION = 4.44
+STUNNEL_SITE = http://ftp.nluug.nl/pub/networking/stunnel
 STUNNEL_DEPENDENCIES = openssl
-
 STUNNEL_CONF_OPT += \
 	--with-ssl=$(STAGING_DIR)/usr \
 	--with-threads=fork
-- 
1.7.3.4
