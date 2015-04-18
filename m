From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Apr 2015 18:26:40 +0200
Subject: [Buildroot] [git commit] package/x11r7/xapp_xdriinfo: bump version
	to 1.0.5, add hash
Message-ID: <20150418162757.4E7AC7F8C5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f604f310c3120acb4bf343239fd3c707297cd3b5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xapp_xdriinfo/xapp_xdriinfo.hash |    2 ++
 package/x11r7/xapp_xdriinfo/xapp_xdriinfo.mk   |    2 +-
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xapp_xdriinfo/xapp_xdriinfo.hash b/package/x11r7/xapp_xdriinfo/xapp_xdriinfo.hash
new file mode 100644
index 0000000..264ec9a
--- /dev/null
+++ b/package/x11r7/xapp_xdriinfo/xapp_xdriinfo.hash
@@ -0,0 +1,2 @@
+# From http://lists.x.org/archives/xorg-announce/2015-April/002570.html
+sha256	4cba3766ef89557422062287248adeb933999071bad6f3ef9c0a478a3c680119	xdriinfo-1.0.5.tar.bz2
diff --git a/package/x11r7/xapp_xdriinfo/xapp_xdriinfo.mk b/package/x11r7/xapp_xdriinfo/xapp_xdriinfo.mk
index d37ec32..bb00d3b 100644
--- a/package/x11r7/xapp_xdriinfo/xapp_xdriinfo.mk
+++ b/package/x11r7/xapp_xdriinfo/xapp_xdriinfo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XDRIINFO_VERSION = 1.0.4
+XAPP_XDRIINFO_VERSION = 1.0.5
 XAPP_XDRIINFO_SOURCE = xdriinfo-$(XAPP_XDRIINFO_VERSION).tar.bz2
 XAPP_XDRIINFO_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XDRIINFO_LICENSE = MIT
