From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Apr 2015 18:28:18 +0200
Subject: [Buildroot] [git commit] package/x11r7/xapp_xgc: bump version to
	1.0.5, add hash
Message-ID: <20150418163305.9925F7FCDF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f484ceb59a815db3905bd166e9d66746b7383f97
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xapp_xgc/xapp_xgc.hash |    2 ++
 package/x11r7/xapp_xgc/xapp_xgc.mk   |    2 +-
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xapp_xgc/xapp_xgc.hash b/package/x11r7/xapp_xgc/xapp_xgc.hash
new file mode 100644
index 0000000..7972a6f
--- /dev/null
+++ b/package/x11r7/xapp_xgc/xapp_xgc.hash
@@ -0,0 +1,2 @@
+# From http://lists.x.org/archives/xorg-announce/2015-April/002575.html
+sha256	14828d9bda358ad57efc0206bc416ee33ba542091edb186485cca5389adc2f5e	xgc-1.0.5.tar.bz2
diff --git a/package/x11r7/xapp_xgc/xapp_xgc.mk b/package/x11r7/xapp_xgc/xapp_xgc.mk
index 6ea4ebb..41d42c4 100644
--- a/package/x11r7/xapp_xgc/xapp_xgc.mk
+++ b/package/x11r7/xapp_xgc/xapp_xgc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XGC_VERSION = 1.0.4
+XAPP_XGC_VERSION = 1.0.5
 XAPP_XGC_SOURCE = xgc-$(XAPP_XGC_VERSION).tar.bz2
 XAPP_XGC_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XGC_LICENSE = MIT
