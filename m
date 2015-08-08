From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 08 Aug 2015 10:56:46 -0000
Subject: [Buildroot] [git commit branch/next]
	package/x11r7/xdriver_xf86-video-cirrus: bump version to 1.5.3
Message-ID: <20150808105636.C36AE80414@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e45edc34fadcd6e666a123a4ab32a13b37dc3f74
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../xdriver_xf86-video-cirrus.hash                 |    2 ++
 .../xdriver_xf86-video-cirrus.mk                   |    5 +++--
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-cirrus/xdriver_xf86-video-cirrus.hash b/package/x11r7/xdriver_xf86-video-cirrus/xdriver_xf86-video-cirrus.hash
new file mode 100644
index 0000000..86ef09e
--- /dev/null
+++ b/package/x11r7/xdriver_xf86-video-cirrus/xdriver_xf86-video-cirrus.hash
@@ -0,0 +1,2 @@
+# From http://lists.x.org/archives/xorg-announce/2015-May/002600.html
+sha256	edc87b20a55259126b5239b5c1ef913419eab7ded0ed12ae9ae989460d7351ab	xf86-video-cirrus-1.5.3.tar.bz2
diff --git a/package/x11r7/xdriver_xf86-video-cirrus/xdriver_xf86-video-cirrus.mk b/package/x11r7/xdriver_xf86-video-cirrus/xdriver_xf86-video-cirrus.mk
index e68656d..f2523db 100644
--- a/package/x11r7/xdriver_xf86-video-cirrus/xdriver_xf86-video-cirrus.mk
+++ b/package/x11r7/xdriver_xf86-video-cirrus/xdriver_xf86-video-cirrus.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_CIRRUS_VERSION = df389885adf71ed3b045c2fde9fd3ba4329e1a58
-XDRIVER_XF86_VIDEO_CIRRUS_SITE = git://anongit.freedesktop.org/xorg/driver/xf86-video-cirrus
+XDRIVER_XF86_VIDEO_CIRRUS_VERSION = 1.5.3
+XDRIVER_XF86_VIDEO_CIRRUS_SOURCE = xf86-video-cirrus-$(XDRIVER_XF86_VIDEO_CIRRUS_VERSION).tar.bz2
+XDRIVER_XF86_VIDEO_CIRRUS_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_CIRRUS_LICENSE = MIT
 XDRIVER_XF86_VIDEO_CIRRUS_LICENSE_FILES = COPYING
 XDRIVER_XF86_VIDEO_CIRRUS_AUTORECONF = YES
