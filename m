From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 3 Oct 2015 23:40:13 +0200
Subject: [Buildroot] [git commit] package/x11r7/xdriver_xf86-video-sis: bump
	to version 0.10.8
Message-ID: <20151003214139.7634F81926@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=60be80914fa263ecc06e907bc6d1249dbc80018a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../xdriver_xf86-video-sis.hash                    |    2 ++
 .../xdriver_xf86-video-sis.mk                      |    5 +++--
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis.hash b/package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis.hash
new file mode 100644
index 0000000..dfc7814
--- /dev/null
+++ b/package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis.hash
@@ -0,0 +1,2 @@
+# From http://lists.x.org/archives/xorg-announce/2015-August/002628.html
+sha256	c8f3f2577f69334dfcc4bf96477dce45161170555f3abdfa105599e61bc7d3fe	xf86-video-sis-0.10.8.tar.bz2
diff --git a/package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis.mk b/package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis.mk
index ee93526..b1fce83 100644
--- a/package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis.mk
+++ b/package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_SIS_VERSION = 0f50f8c3db2b9f1c9d4ecab8ad278e9db6418a92
-XDRIVER_XF86_VIDEO_SIS_SITE = git://anongit.freedesktop.org/xorg/driver/xf86-video-sis
+XDRIVER_XF86_VIDEO_SIS_VERSION = 0.10.8
+XDRIVER_XF86_VIDEO_SIS_SOURCE = xf86-video-sis-$(XDRIVER_XF86_VIDEO_SIS_VERSION).tar.bz2
+XDRIVER_XF86_VIDEO_SIS_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_SIS_LICENSE = MIT
 XDRIVER_XF86_VIDEO_SIS_LICENSE_FILES = COPYING
 XDRIVER_XF86_VIDEO_SIS_AUTORECONF = YES
