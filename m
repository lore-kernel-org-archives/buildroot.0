From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 10 Apr 2017 20:18:16 +0200
Subject: [Buildroot] [PATCH 2/4] package/x11r7/xdriver_xf86-video-amdgpu:
	bump version to 1.3.0
In-Reply-To: <20170410181818.3142-1-bernd.kuhls@t-online.de>
References: <20170410181818.3142-1-bernd.kuhls@t-online.de>
Message-ID: <20170410181818.3142-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add all upstream hashes.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../x11r7/xdriver_xf86-video-amdgpu/xdriver_xf86-video-amdgpu.hash  | 6 ++++--
 .../x11r7/xdriver_xf86-video-amdgpu/xdriver_xf86-video-amdgpu.mk    | 2 +-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-amdgpu/xdriver_xf86-video-amdgpu.hash b/package/x11r7/xdriver_xf86-video-amdgpu/xdriver_xf86-video-amdgpu.hash
index 32ff1646d1..13246b69de 100644
--- a/package/x11r7/xdriver_xf86-video-amdgpu/xdriver_xf86-video-amdgpu.hash
+++ b/package/x11r7/xdriver_xf86-video-amdgpu/xdriver_xf86-video-amdgpu.hash
@@ -1,2 +1,4 @@
-# From https://lists.x.org/archives/xorg-announce/2016-November/002741.html
-sha256 275b1aac5f127f55ba3d7480a1df89eace1d02650e24e46908067fc875e76c8f  xf86-video-amdgpu-1.2.0.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2017-March/002788.html
+md5 e2ee9e16ffbd45ebda68a7ff638a04f2  xf86-video-amdgpu-1.3.0.tar.bz2
+sha1 7b89fe6e22e6739257c0f03c9f034c9c579a8bce  xf86-video-amdgpu-1.3.0.tar.bz2
+sha256 c1630f228938be949273f72b29ae70822dde064ad79c3ccb14d55f427e3f4e70  xf86-video-amdgpu-1.3.0.tar.bz2
diff --git a/package/x11r7/xdriver_xf86-video-amdgpu/xdriver_xf86-video-amdgpu.mk b/package/x11r7/xdriver_xf86-video-amdgpu/xdriver_xf86-video-amdgpu.mk
index d858e14096..9bd75369a7 100644
--- a/package/x11r7/xdriver_xf86-video-amdgpu/xdriver_xf86-video-amdgpu.mk
+++ b/package/x11r7/xdriver_xf86-video-amdgpu/xdriver_xf86-video-amdgpu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_AMDGPU_VERSION = 1.2.0
+XDRIVER_XF86_VIDEO_AMDGPU_VERSION = 1.3.0
 XDRIVER_XF86_VIDEO_AMDGPU_SOURCE = xf86-video-amdgpu-$(XDRIVER_XF86_VIDEO_AMDGPU_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_AMDGPU_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_AMDGPU_LICENSE = MIT
-- 
2.11.0
