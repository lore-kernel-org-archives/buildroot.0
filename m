From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 13 Apr 2016 22:37:41 +0200
Subject: [Buildroot] [git commit] package/x11r7/xdriver_xf86-video-r128:
	bump version to 6.10.1
Message-ID: <20160413203800.F3C8C81E2F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b5aa6f03b20b61f8e11e47da4b19b67808b80416
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xdriver_xf86-video-r128/xdriver_xf86-video-r128.hash | 4 ++--
 package/x11r7/xdriver_xf86-video-r128/xdriver_xf86-video-r128.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-r128/xdriver_xf86-video-r128.hash b/package/x11r7/xdriver_xf86-video-r128/xdriver_xf86-video-r128.hash
index 976521a..f5c92ab 100644
--- a/package/x11r7/xdriver_xf86-video-r128/xdriver_xf86-video-r128.hash
+++ b/package/x11r7/xdriver_xf86-video-r128/xdriver_xf86-video-r128.hash
@@ -1,2 +1,2 @@
-# From http://lists.x.org/archives/xorg-announce/2015-May/002598.html
-sha256	80d531a07168230a408b88809a5440cfd48f9098666d12702d0012148a0d353d	xf86-video-r128-6.10.0.tar.bz2
+# From http://lists.x.org/archives/xorg-announce/2016-January/002670.html
+sha256	5ebfef49831c9b12f7b7011c8314010596ac2ab0d5b9b7cfd17908e93d7de4ea	xf86-video-r128-6.10.1.tar.bz2
diff --git a/package/x11r7/xdriver_xf86-video-r128/xdriver_xf86-video-r128.mk b/package/x11r7/xdriver_xf86-video-r128/xdriver_xf86-video-r128.mk
index 4e88d87..5833efc 100644
--- a/package/x11r7/xdriver_xf86-video-r128/xdriver_xf86-video-r128.mk
+++ b/package/x11r7/xdriver_xf86-video-r128/xdriver_xf86-video-r128.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_R128_VERSION = 6.10.0
+XDRIVER_XF86_VIDEO_R128_VERSION = 6.10.1
 XDRIVER_XF86_VIDEO_R128_SOURCE = xf86-video-r128-$(XDRIVER_XF86_VIDEO_R128_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_R128_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_R128_LICENSE = MIT
