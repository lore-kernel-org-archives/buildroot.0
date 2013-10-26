From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 26 Oct 2013 12:00:03 -0300
Subject: [Buildroot] [PATCH] bind: bump to version 9.6-ESV-R10
Message-ID: <1382799603-27647-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/bind/bind.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index 306284b..2e01e8b 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BIND_VERSION = 9.6-ESV-R9-P1
+BIND_VERSION = 9.6-ESV-R10
 BIND_SITE = ftp://ftp.isc.org/isc/bind9/$(BIND_VERSION)
 BIND_MAKE = $(MAKE1)
 BIND_INSTALL_STAGING = YES
-- 
1.8.1.5
