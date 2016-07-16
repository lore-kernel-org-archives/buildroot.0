From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Sat, 16 Jul 2016 11:42:32 +0200
Subject: [Buildroot] [PATCH 1/3] package/vde2: remove trailing \ from last
	item of _VDE2_CONF_OPTS
Message-ID: <1468662154-31339-1-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 package/vde2/vde2.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/vde2/vde2.mk b/package/vde2/vde2.mk
index d9b11bb..558d0f3 100644
--- a/package/vde2/vde2.mk
+++ b/package/vde2/vde2.mk
@@ -32,7 +32,7 @@ VDE2_CONF_OPTS = \
 	--disable-python        \
 	--disable-profile       \
 	--disable-kernel-switch \
-	--enable-tuntap         \
+	--enable-tuntap
 
 #?Package does not build in parallel due to improper make rules
 VDE2_MAKE = $(MAKE1)
@@ -44,7 +44,7 @@ HOST_VDE2_CONF_OPTS = \
 	--disable-python        \
 	--disable-profile       \
 	--disable-kernel-switch \
-	--enable-tuntap         \
+	--enable-tuntap
 
 HOST_VDE2_MAKE = $(MAKE1)
 
-- 
1.9.1
