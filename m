From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 25 Sep 2016 15:35:56 +0200
Subject: [Buildroot] [PATCH 2/6] package/x11r7/xdriver_xf86-video-amdgpu:
	bump version to 1.1.2
In-Reply-To: <20160925133600.12316-1-bernd.kuhls@t-online.de>
References: <20160925133600.12316-1-bernd.kuhls@t-online.de>
Message-ID: <20160925133600.12316-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
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
-- 
2.9.3
