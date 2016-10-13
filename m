From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 13 Oct 2016 07:38:49 +0200
Subject: [Buildroot] [git commit] package/vde2: indentation cleanup
Message-ID: <20161013054826.45951817C3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1bd7c73a43e792083c369313d18c3203b560c482
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
 
 #??Package does not build in parallel due to improper make rules
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
