From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 16 Jul 2016 11:53:38 +0200
Subject: [Buildroot] [git commit] package/vde2: put the \ just one space
	after the line of _VDE2_CONF_OPTS items
Message-ID: <20160716095402.7EDD07FBE4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7abd7059e9ea1ae37ef2b2e250fdd158ff074550
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
 
