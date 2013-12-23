From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Mon, 23 Dec 2013 09:36:47 +0100
Subject: [Buildroot] [PATCH 1/2] libmpd: change download URL
Message-ID: <1387787808-8194-1-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 package/libmpd/libmpd.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libmpd/libmpd.mk b/package/libmpd/libmpd.mk
index b78a36f..7df8c2a 100644
--- a/package/libmpd/libmpd.mk
+++ b/package/libmpd/libmpd.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBMPD_VERSION = 11.8.17
-LIBMPD_SITE = http://download.sarine.nl/Programs/gmpc/11.8.16
+LIBMPD_SITE = http://download.sarine.nl/Programs/gmpc/11.8
 LIBMPD_INSTALL_STAGING = YES
 LIBMPD_DEPENDENCIES = libglib2
 LIBMPD_LICENSE = GPLv2+
-- 
1.7.9.5
