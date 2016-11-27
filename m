From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 27 Nov 2016 22:31:40 +0100
Subject: [Buildroot] [git commit] package/x11r7/xdriver_xf86-video-vmware:
	bump version to 13.2.1
Message-ID: <20161201222140.A17048026C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c58598019394cc70d08fbcfe22bfc8aa3e03b32d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../x11r7/xdriver_xf86-video-vmware/xdriver_xf86-video-vmware.hash    | 4 ++--
 package/x11r7/xdriver_xf86-video-vmware/xdriver_xf86-video-vmware.mk  | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-vmware/xdriver_xf86-video-vmware.hash b/package/x11r7/xdriver_xf86-video-vmware/xdriver_xf86-video-vmware.hash
index 10d31d0..8d948a7 100644
--- a/package/x11r7/xdriver_xf86-video-vmware/xdriver_xf86-video-vmware.hash
+++ b/package/x11r7/xdriver_xf86-video-vmware/xdriver_xf86-video-vmware.hash
@@ -1,2 +1,2 @@
-# From http://lists.x.org/archives/xorg-announce/2015-January/002521.html
-sha256	3c1d244e4b1b77e92126957965cdc9fb82de4c215c0706a3a8aaff6939e4a0cc	xf86-video-vmware-13.1.0.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2016-November/002743.html
+sha256 e2f7f7101fba7f53b268e7a25908babbf155b3984fb5268b3d244eb6c11bf62b  xf86-video-vmware-13.2.1.tar.bz2
diff --git a/package/x11r7/xdriver_xf86-video-vmware/xdriver_xf86-video-vmware.mk b/package/x11r7/xdriver_xf86-video-vmware/xdriver_xf86-video-vmware.mk
index ea4dd48..ef262f8 100644
--- a/package/x11r7/xdriver_xf86-video-vmware/xdriver_xf86-video-vmware.mk
+++ b/package/x11r7/xdriver_xf86-video-vmware/xdriver_xf86-video-vmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_VMWARE_VERSION = 13.1.0
+XDRIVER_XF86_VIDEO_VMWARE_VERSION = 13.2.1
 XDRIVER_XF86_VIDEO_VMWARE_SOURCE = xf86-video-vmware-$(XDRIVER_XF86_VIDEO_VMWARE_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_VMWARE_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_VMWARE_LICENSE = MIT
