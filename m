From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 25 Sep 2016 23:12:55 +0200
Subject: [Buildroot] [git commit] package/x11r7/xdriver_xf86-video-amdgpu:
	bump version to 1.1.2
Message-ID: <20160925211322.2316680125@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3bd3c427202a859974dce089409d72a121412c64
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../x11r7/xdriver_xf86-video-amdgpu/xdriver_xf86-video-amdgpu.hash    | 4 ++--
 package/x11r7/xdriver_xf86-video-amdgpu/xdriver_xf86-video-amdgpu.mk  | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-amdgpu/xdriver_xf86-video-amdgpu.hash b/package/x11r7/xdriver_xf86-video-amdgpu/xdriver_xf86-video-amdgpu.hash
index 6754fb5..816f075 100644
--- a/package/x11r7/xdriver_xf86-video-amdgpu/xdriver_xf86-video-amdgpu.hash
+++ b/package/x11r7/xdriver_xf86-video-amdgpu/xdriver_xf86-video-amdgpu.hash
@@ -1,2 +1,2 @@
-# From https://lists.x.org/archives/xorg-announce/2016-April/002686.html
-sha256	69f5d0ded9f4d5ce529099b6b581268e8f4dcff5608f1441d4ebc110ebc57931	xf86-video-amdgpu-1.1.0.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2016-September/002708.html
+sha256 6ee87fed6d70d12353ca7ac02f8321a30d770626bf56f62f0e27970a33690779  xf86-video-amdgpu-1.1.2.tar.bz2
diff --git a/package/x11r7/xdriver_xf86-video-amdgpu/xdriver_xf86-video-amdgpu.mk b/package/x11r7/xdriver_xf86-video-amdgpu/xdriver_xf86-video-amdgpu.mk
index 45177b2..4e12e12 100644
--- a/package/x11r7/xdriver_xf86-video-amdgpu/xdriver_xf86-video-amdgpu.mk
+++ b/package/x11r7/xdriver_xf86-video-amdgpu/xdriver_xf86-video-amdgpu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_AMDGPU_VERSION = 1.1.0
+XDRIVER_XF86_VIDEO_AMDGPU_VERSION = 1.1.2
 XDRIVER_XF86_VIDEO_AMDGPU_SOURCE = xf86-video-amdgpu-$(XDRIVER_XF86_VIDEO_AMDGPU_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_AMDGPU_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_AMDGPU_LICENSE = MIT
