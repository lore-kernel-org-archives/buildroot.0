From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Sat, 16 Jul 2016 11:42:34 +0200
Subject: [Buildroot] [PATCH 3/3] package/vde2: sort alphabetically
	_VDE2_CONF_OPTS items
In-Reply-To: <1468662154-31339-1-git-send-email-jerzy.grzegorek@trzebnica.net>
References: <1468662154-31339-1-git-send-email-jerzy.grzegorek@trzebnica.net>
Message-ID: <1468662154-31339-3-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 package/vde2/vde2.mk | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/vde2/vde2.mk b/package/vde2/vde2.mk
index 0b86e9f..b750adb 100644
--- a/package/vde2/vde2.mk
+++ b/package/vde2/vde2.mk
@@ -26,24 +26,24 @@ VDE2_AUTORECONF = YES
 # Note: disabled features can be added with corresponding dependencies
 #       in future commits.
 VDE2_CONF_OPTS = \
-	--disable-experimental \
 	--disable-cryptcab \
+       --disable-experimental \
+       --disable-kernel-switch \
 	--disable-pcap \
-	--disable-python \
 	--disable-profile \
-	--disable-kernel-switch \
+       --disable-python \
 	--enable-tuntap
 
 #?Package does not build in parallel due to improper make rules
 VDE2_MAKE = $(MAKE1)
 
 HOST_VDE2_CONF_OPTS = \
-	--disable-experimental \
 	--disable-cryptcab \
+       --disable-experimental \
+       --disable-kernel-switch \
 	--disable-pcap \
-	--disable-python \
 	--disable-profile \
-	--disable-kernel-switch \
+       --disable-python \
 	--enable-tuntap
 
 HOST_VDE2_MAKE = $(MAKE1)
-- 
1.9.1
