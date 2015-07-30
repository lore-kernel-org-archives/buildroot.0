From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Thu, 30 Jul 2015 21:35:09 +0200
Subject: [Buildroot] [PATCH 1/1] package/libserialport: bump to latest commit
Message-ID: <1438284909-9284-1-git-send-email-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The previous commit e31f2c6b8b8f2b7e554df911cc9a3482b99632b4 is from Dec 5 2014.

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/libserialport/libserialport.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libserialport/libserialport.mk b/package/libserialport/libserialport.mk
index 2e57653..3dcbccb 100644
--- a/package/libserialport/libserialport.mk
+++ b/package/libserialport/libserialport.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBSERIALPORT_VERSION = e31f2c6b8b8f2b7e554df911cc9a3482b99632b4
+LIBSERIALPORT_VERSION = f77bb46df5d883527da8b7eb4a5328ea7e990dbb
 # No https access on upstream git
 LIBSERIALPORT_SITE = git://sigrok.org/libserialport
 LIBSERIALPORT_LICENSE = LGPLv3+
-- 
2.5.0
