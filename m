From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Wed,  8 Oct 2014 18:11:24 +0200
Subject: [Buildroot] [PATCH] jansson: bump to 2.7
Message-ID: <1412784684-2336-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/jansson/jansson.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/jansson/jansson.mk b/package/jansson/jansson.mk
index d51e709..193fafb 100644
--- a/package/jansson/jansson.mk
+++ b/package/jansson/jansson.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JANSSON_VERSION = 2.6
+JANSSON_VERSION = 2.7
 JANSSON_SITE = http://www.digip.org/jansson/releases
 JANSSON_LICENSE = MIT
 JANSSON_LICENSE_FILES = LICENSE
-- 
1.8.3.2
