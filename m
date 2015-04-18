From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Apr 2015 18:30:41 +0200
Subject: [Buildroot] [git commit] package/x11r7/xapp_xmodmap: bump version
	to 1.0.9, add hash
Message-ID: <20150418163311.2772A7FCDF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0b9d9f958d6d208dfa4ff9c05116ff61a28dfe9e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xapp_xmodmap/xapp_xmodmap.hash |    2 ++
 package/x11r7/xapp_xmodmap/xapp_xmodmap.mk   |    2 +-
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xapp_xmodmap/xapp_xmodmap.hash b/package/x11r7/xapp_xmodmap/xapp_xmodmap.hash
new file mode 100644
index 0000000..aad9815
--- /dev/null
+++ b/package/x11r7/xapp_xmodmap/xapp_xmodmap.hash
@@ -0,0 +1,2 @@
+# From http://lists.x.org/archives/xorg-announce/2015-April/002583.html
+sha256	b7b0e5cc5f10d0fb6d2d6ea4f00c77e8ac0e847cc5a73be94cd86139ac4ac478	xmodmap-1.0.9.tar.bz2
diff --git a/package/x11r7/xapp_xmodmap/xapp_xmodmap.mk b/package/x11r7/xapp_xmodmap/xapp_xmodmap.mk
index 9e059d5..670bf9f 100644
--- a/package/x11r7/xapp_xmodmap/xapp_xmodmap.mk
+++ b/package/x11r7/xapp_xmodmap/xapp_xmodmap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XMODMAP_VERSION = 1.0.8
+XAPP_XMODMAP_VERSION = 1.0.9
 XAPP_XMODMAP_SOURCE = xmodmap-$(XAPP_XMODMAP_VERSION).tar.bz2
 XAPP_XMODMAP_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XMODMAP_LICENSE = MIT
