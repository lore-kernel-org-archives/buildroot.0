From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Tue,  3 Sep 2013 12:55:25 +0200
Subject: [Buildroot] [PATCH 1/1] cppcms: bump to version 1.0.4
Message-ID: <1378205725-30571-1-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 package/cppcms/cppcms.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/cppcms/cppcms.mk b/package/cppcms/cppcms.mk
index 8d4a519..4068df7 100644
--- a/package/cppcms/cppcms.mk
+++ b/package/cppcms/cppcms.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CPPCMS_VERSION = 1.0.3
+CPPCMS_VERSION = 1.0.4
 CPPCMS_SOURCE = cppcms-$(CPPCMS_VERSION).tar.bz2
 CPPCMS_LICENSE = LGPLv3
 CPPCMS_LICENSE_FILES = COPYING.TXT
-- 
1.7.9.5
