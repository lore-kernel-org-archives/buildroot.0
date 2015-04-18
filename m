From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Apr 2015 18:26:19 +0200
Subject: [Buildroot] [git commit] package/x11r7/xapp_xdpyinfo: bump version
	to 1.3.2, add hash
Message-ID: <20150418162757.466997F8C5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5a5d6dc2038edb4512074d1aec0eb0e4a0e4daf2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xapp_xdpyinfo/xapp_xdpyinfo.hash |    2 ++
 package/x11r7/xapp_xdpyinfo/xapp_xdpyinfo.mk   |    2 +-
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xapp_xdpyinfo/xapp_xdpyinfo.hash b/package/x11r7/xapp_xdpyinfo/xapp_xdpyinfo.hash
new file mode 100644
index 0000000..7f9c4f5
--- /dev/null
+++ b/package/x11r7/xapp_xdpyinfo/xapp_xdpyinfo.hash
@@ -0,0 +1,2 @@
+# From http://lists.x.org/archives/xorg-announce/2015-April/002569.html
+sha256	30238ed915619e06ceb41721e5f747d67320555cc38d459e954839c189ccaf51	xdpyinfo-1.3.2.tar.bz2
diff --git a/package/x11r7/xapp_xdpyinfo/xapp_xdpyinfo.mk b/package/x11r7/xapp_xdpyinfo/xapp_xdpyinfo.mk
index 4615e4f..cf94f70 100644
--- a/package/x11r7/xapp_xdpyinfo/xapp_xdpyinfo.mk
+++ b/package/x11r7/xapp_xdpyinfo/xapp_xdpyinfo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XDPYINFO_VERSION = 1.3.1
+XAPP_XDPYINFO_VERSION = 1.3.2
 XAPP_XDPYINFO_SOURCE = xdpyinfo-$(XAPP_XDPYINFO_VERSION).tar.bz2
 XAPP_XDPYINFO_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XDPYINFO_LICENSE = MIT
