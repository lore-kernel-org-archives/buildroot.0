From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 16 Jul 2016 11:53:32 +0200
Subject: [Buildroot] [git commit] package/vde2: remove trailing \ from last
	item of _VDE2_CONF_OPTS
Message-ID: <20160716095402.6A1E87FBF2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1531392c83247b34e19cca1e70fba12462651ae4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
 
 #??Package does not build in parallel due to improper make rules
 VDE2_MAKE = $(MAKE1)
@@ -44,7 +44,7 @@ HOST_VDE2_CONF_OPTS = \
 	--disable-python        \
 	--disable-profile       \
 	--disable-kernel-switch \
-	--enable-tuntap         \
+	--enable-tuntap
 
 HOST_VDE2_MAKE = $(MAKE1)
 
