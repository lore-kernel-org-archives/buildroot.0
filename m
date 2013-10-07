From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Mon,  7 Oct 2013 08:56:00 +0200
Subject: [Buildroot] [PATCH 1/1] libbsd: bump to version 0.6.0
Message-ID: <1381128960-16844-1-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 package/libbsd/libbsd.mk |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/libbsd/libbsd.mk b/package/libbsd/libbsd.mk
index be4175a..88039ca 100644
--- a/package/libbsd/libbsd.mk
+++ b/package/libbsd/libbsd.mk
@@ -4,7 +4,8 @@
 #
 ################################################################################
 
-LIBBSD_VERSION         = 0.4.2
+LIBBSD_VERSION         = 0.6.0
+LIBBSD_SOURCE		= libbsd-$(LIBBSD_VERSION).tar.xz
 LIBBSD_SITE            = http://libbsd.freedesktop.org/releases
 LIBBSD_LICENSE         = BSD-3c MIT
 LIBBSD_LICENSE_FILES   = COPYING
-- 
1.7.9.5
