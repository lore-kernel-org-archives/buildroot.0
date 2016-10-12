From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Wed, 12 Oct 2016 23:05:22 +0200
Subject: [Buildroot] [PATCH 2/4] package/vde2: indentation cleanup
In-Reply-To: <1476306324-6162-1-git-send-email-jerzy.grzegorek@trzebnica.net>
References: <1476306324-6162-1-git-send-email-jerzy.grzegorek@trzebnica.net>
Message-ID: <1476306324-6162-2-git-send-email-jerzy.grzegorek@trzebnica.net>
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
index b750adb..3bbfd5f 100644
--- a/package/vde2/vde2.mk
+++ b/package/vde2/vde2.mk
@@ -27,11 +27,11 @@ VDE2_AUTORECONF = YES
 #       in future commits.
 VDE2_CONF_OPTS = \
 	--disable-cryptcab \
-       --disable-experimental \
-       --disable-kernel-switch \
+	--disable-experimental \
+	--disable-kernel-switch \
 	--disable-pcap \
 	--disable-profile \
-       --disable-python \
+	--disable-python \
 	--enable-tuntap
 
 #?Package does not build in parallel due to improper make rules
@@ -39,11 +39,11 @@ VDE2_MAKE = $(MAKE1)
 
 HOST_VDE2_CONF_OPTS = \
 	--disable-cryptcab \
-       --disable-experimental \
-       --disable-kernel-switch \
+	--disable-experimental \
+	--disable-kernel-switch \
 	--disable-pcap \
 	--disable-profile \
-       --disable-python \
+	--disable-python \
 	--enable-tuntap
 
 HOST_VDE2_MAKE = $(MAKE1)
-- 
1.9.1
