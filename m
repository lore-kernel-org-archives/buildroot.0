From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri,  8 Aug 2014 11:25:03 -0300
Subject: [Buildroot] [PATCH] dropbear: bump to version 2014.65
Message-ID: <1407507903-8970-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes some regressions introduced by 2014.64

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/dropbear/dropbear.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
index afdc3c8..e8fcdf6 100644
--- a/package/dropbear/dropbear.mk
+++ b/package/dropbear/dropbear.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DROPBEAR_VERSION = 2014.64
+DROPBEAR_VERSION = 2014.65
 DROPBEAR_SITE = http://matt.ucc.asn.au/dropbear/releases
 DROPBEAR_SOURCE = dropbear-$(DROPBEAR_VERSION).tar.bz2
 DROPBEAR_TARGET_BINS = dbclient dropbearkey dropbearconvert scp ssh
-- 
1.8.5.5
