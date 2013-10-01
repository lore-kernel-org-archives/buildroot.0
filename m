From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Tue,  1 Oct 2013 11:55:11 +0200
Subject: [Buildroot] [PATCH 1/1] picocom: bump to version 1.7
Message-ID: <1380621311-15898-1-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 package/picocom/picocom.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/picocom/picocom.mk b/package/picocom/picocom.mk
index 4298faa..8f8ad20 100644
--- a/package/picocom/picocom.mk
+++ b/package/picocom/picocom.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PICOCOM_VERSION = 1.6
+PICOCOM_VERSION = 1.7
 PICOCOM_SITE    = http://picocom.googlecode.com/files/
 
 define PICOCOM_BUILD_CMDS
-- 
1.7.9.5
