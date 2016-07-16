From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 16 Jul 2016 11:53:51 +0200
Subject: [Buildroot] [git commit] package/vde2: sort alphabetically
	_VDE2_CONF_OPTS items
Message-ID: <20160716095402.8D1897FBFA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=73e6e6aaabf68913e43aa7ab607cce5d1d98583f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
 
 #??Package does not build in parallel due to improper make rules
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
