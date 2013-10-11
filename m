From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Fri, 11 Oct 2013 07:48:08 +0200
Subject: [Buildroot] [PATCH 1/1] fdk-aac: bump to version 0.1.2
Message-ID: <1381470488-5264-1-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 package/fdk-aac/fdk-aac.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/fdk-aac/fdk-aac.mk b/package/fdk-aac/fdk-aac.mk
index 325267a..dde3e7e 100644
--- a/package/fdk-aac/fdk-aac.mk
+++ b/package/fdk-aac/fdk-aac.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FDK_AAC_VERSION = 0.1.1
+FDK_AAC_VERSION = 0.1.2
 FDK_AAC_SITE = http://downloads.sourceforge.net/project/opencore-amr/fdk-aac
 FDK_AAC_LICENSE = fdk-aac license
 FDK_AAC_LICENSE_FILES = NOTICE
-- 
1.7.9.5
