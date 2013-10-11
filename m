From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Fri, 11 Oct 2013 18:29:16 +0200
Subject: [Buildroot] [PATCH 1/1] jansson: bump to version 2.5
Message-ID: <1381508957-5129-1-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 package/jansson/jansson.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/jansson/jansson.mk b/package/jansson/jansson.mk
index 49e8571..bb3240f 100644
--- a/package/jansson/jansson.mk
+++ b/package/jansson/jansson.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JANSSON_VERSION = 2.4
+JANSSON_VERSION = 2.5
 JANSSON_SITE = http://www.digip.org/jansson/releases
 JANSSON_LICENSE = MIT
 JANSSON_LICENSE_FILES = LICENSE
-- 
1.7.9.5
