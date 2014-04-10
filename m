From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 10 Apr 2014 11:52:36 +0300
Subject: [Buildroot] [PATCH] stunnel: bump to version 5.01
Message-ID: <929ba046d1c0b3f77f02c5c99f226ef27bc2a363.1397119956.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes CVE-2014-0016.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/stunnel/stunnel.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/stunnel/stunnel.mk b/package/stunnel/stunnel.mk
index fbe7b9490818..ec3af4bfa616 100644
--- a/package/stunnel/stunnel.mk
+++ b/package/stunnel/stunnel.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-STUNNEL_VERSION = 4.56
-STUNNEL_SITE = http://ftp.nluug.nl/pub/networking/stunnel/archive/4.x/
+STUNNEL_VERSION = 5.01
+STUNNEL_SITE = http://ftp.nluug.nl/pub/networking/stunnel/archive/5.x/
 STUNNEL_DEPENDENCIES = openssl
 STUNNEL_CONF_OPT = --with-ssl=$(STAGING_DIR)/usr --with-threads=fork
 STUNNEL_LICENSE = GPLv2+
-- 
1.9.1
