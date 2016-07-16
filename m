From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Sat, 16 Jul 2016 11:42:33 +0200
Subject: [Buildroot] [PATCH 2/3] package/vde2: put the \ just one space
	after the line of _VDE2_CONF_OPTS items
In-Reply-To: <1468662154-31339-1-git-send-email-jerzy.grzegorek@trzebnica.net>
References: <1468662154-31339-1-git-send-email-jerzy.grzegorek@trzebnica.net>
Message-ID: <1468662154-31339-2-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 package/vde2/vde2.mk | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/package/vde2/vde2.mk b/package/vde2/vde2.mk
index 558d0f3..0b86e9f 100644
--- a/package/vde2/vde2.mk
+++ b/package/vde2/vde2.mk
@@ -26,11 +26,11 @@ VDE2_AUTORECONF = YES
 # Note: disabled features can be added with corresponding dependencies
 #       in future commits.
 VDE2_CONF_OPTS = \
-	--disable-experimental  \
-	--disable-cryptcab      \
-	--disable-pcap          \
-	--disable-python        \
-	--disable-profile       \
+	--disable-experimental \
+	--disable-cryptcab \
+	--disable-pcap \
+	--disable-python \
+	--disable-profile \
 	--disable-kernel-switch \
 	--enable-tuntap
 
@@ -38,11 +38,11 @@ VDE2_CONF_OPTS = \
 VDE2_MAKE = $(MAKE1)
 
 HOST_VDE2_CONF_OPTS = \
-	--disable-experimental  \
-	--disable-cryptcab      \
-	--disable-pcap          \
-	--disable-python        \
-	--disable-profile       \
+	--disable-experimental \
+	--disable-cryptcab \
+	--disable-pcap \
+	--disable-python \
+	--disable-profile \
 	--disable-kernel-switch \
 	--enable-tuntap
 
-- 
1.9.1
