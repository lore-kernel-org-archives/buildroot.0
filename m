From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Tue,  1 Oct 2013 11:11:24 +0200
Subject: [Buildroot] [PATCH 1/1] ngircd: bump to version 20.3
Message-ID: <1380618684-9666-1-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 package/ngircd/ngircd.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ngircd/ngircd.mk b/package/ngircd/ngircd.mk
index 41a5b49..c99e6bb 100644
--- a/package/ngircd/ngircd.mk
+++ b/package/ngircd/ngircd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NGIRCD_VERSION = 17.1
+NGIRCD_VERSION = 20.3
 NGIRCD_SITE = ftp://ftp.berlios.de/pub/ngircd/
 NGIRCD_DEPENDENCIES = zlib
 
-- 
1.7.9.5
