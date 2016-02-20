From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 20 Feb 2016 15:57:47 +0100
Subject: [Buildroot] [git commit] package/x11r7/xdriver_xf86-video-geode:
	bump version to 2.11.18
Message-ID: <20160302202754.32BAB80203@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d30102693aa562f026b78ee260e46cc7b4751e3a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xdriver_xf86-video-geode/xdriver_xf86-video-geode.hash | 4 ++--
 package/x11r7/xdriver_xf86-video-geode/xdriver_xf86-video-geode.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-geode/xdriver_xf86-video-geode.hash b/package/x11r7/xdriver_xf86-video-geode/xdriver_xf86-video-geode.hash
index 991cf6b..b05983f 100644
--- a/package/x11r7/xdriver_xf86-video-geode/xdriver_xf86-video-geode.hash
+++ b/package/x11r7/xdriver_xf86-video-geode/xdriver_xf86-video-geode.hash
@@ -1,2 +1,2 @@
-# From http://lists.x.org/archives/xorg-announce/2015-May/002607.html
-sha256	07b4d42623e71e592b77c52a75cf230f8e711c8a0c1b26cecb06e9231d333c41	xf86-video-geode-2.11.17.tar.bz2
+# From http://lists.x.org/archives/xorg-announce/2016-February/002673.html
+sha256	d6ece9a862a68be3cdf86a87e0e1ba5e199168b8d075129646638f53649ba9e8	xf86-video-geode-2.11.18.tar.bz2
diff --git a/package/x11r7/xdriver_xf86-video-geode/xdriver_xf86-video-geode.mk b/package/x11r7/xdriver_xf86-video-geode/xdriver_xf86-video-geode.mk
index ae5bc0b..b882f1f 100644
--- a/package/x11r7/xdriver_xf86-video-geode/xdriver_xf86-video-geode.mk
+++ b/package/x11r7/xdriver_xf86-video-geode/xdriver_xf86-video-geode.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_GEODE_VERSION = 2.11.17
+XDRIVER_XF86_VIDEO_GEODE_VERSION = 2.11.18
 XDRIVER_XF86_VIDEO_GEODE_SOURCE = xf86-video-geode-$(XDRIVER_XF86_VIDEO_GEODE_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_GEODE_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_GEODE_LICENSE = MIT
