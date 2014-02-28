From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 28 Feb 2014 10:42:40 -0300
Subject: [Buildroot] [PATCH] pppd: bump to version 2.4.6
Message-ID: <1393594960-15036-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/pppd/pppd.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pppd/pppd.mk b/package/pppd/pppd.mk
index a69d597..0e24bd2 100644
--- a/package/pppd/pppd.mk
+++ b/package/pppd/pppd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PPPD_VERSION = 2.4.5
+PPPD_VERSION = 2.4.6
 PPPD_SOURCE = ppp-$(PPPD_VERSION).tar.gz
 PPPD_SITE = ftp://ftp.samba.org/pub/ppp
 PPPD_LICENSE = LGPLv2+ LGPL BSD-4c BSD-3c GPLv2+
-- 
1.8.3.2
