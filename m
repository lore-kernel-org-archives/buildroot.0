From: Axel Lin <axel.lin@ingics.com>
Date: Sun, 06 Oct 2013 09:31:10 +0800
Subject: [Buildroot] [PATCH 2/2] stunnel: bump to version 4.56
In-Reply-To: <1381023024.2508.0.camel@phoenix>
References: <1381023024.2508.0.camel@phoenix>
Message-ID: <1381023070.2508.1.camel@phoenix>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 package/stunnel/stunnel.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/stunnel/stunnel.mk b/package/stunnel/stunnel.mk
index 8548eab..fbe7b94 100644
--- a/package/stunnel/stunnel.mk
+++ b/package/stunnel/stunnel.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STUNNEL_VERSION = 4.55
+STUNNEL_VERSION = 4.56
 STUNNEL_SITE = http://ftp.nluug.nl/pub/networking/stunnel/archive/4.x/
 STUNNEL_DEPENDENCIES = openssl
 STUNNEL_CONF_OPT = --with-ssl=$(STAGING_DIR)/usr --with-threads=fork
-- 
1.8.1.2
