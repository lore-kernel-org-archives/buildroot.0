From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 24 Mar 2019 23:06:11 +0100
Subject: [Buildroot] [git commit] package/x11r7/xdriver_xf86-video-amdgpu:
 bump version to 19.0.1
Message-ID: <20190324220643.9ECED81827@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=16aa0aaa244b948554a449dbeba3984be79d36d9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../xdriver_xf86-video-amdgpu/xdriver_xf86-video-amdgpu.hash   | 10 +++++-----
 .../xdriver_xf86-video-amdgpu/xdriver_xf86-video-amdgpu.mk     |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-amdgpu/xdriver_xf86-video-amdgpu.hash b/package/x11r7/xdriver_xf86-video-amdgpu/xdriver_xf86-video-amdgpu.hash
index 7f1ad29110..6ca669f793 100644
--- a/package/x11r7/xdriver_xf86-video-amdgpu/xdriver_xf86-video-amdgpu.hash
+++ b/package/x11r7/xdriver_xf86-video-amdgpu/xdriver_xf86-video-amdgpu.hash
@@ -1,7 +1,7 @@
-# From https://lists.x.org/archives/xorg-announce/2019-March/002966.html
-md5 a9a1bee983e570614a78ae9070223149  xf86-video-amdgpu-19.0.0.tar.bz2
-sha1 7a9c6f08ec7c0a8cc665079c8f49716febc73729  xf86-video-amdgpu-19.0.0.tar.bz2
-sha256 8836147d4755908ec9e192b7cc485fbc2ce7706de33f7bea515294d3ba4c4f51  xf86-video-amdgpu-19.0.0.tar.bz2
-sha512 6a30fc03185816307f16693cd6b07f13694ca1b6b1327c58a951bccc8082f112bb768ab610229dc1040617eef860fc1ab17a7e6bf635c5a4e454e252f3addca8  xf86-video-amdgpu-19.0.0.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2019-March/002987.html
+md5 f3b33958e99c896084f12cd48f7ba007  xf86-video-amdgpu-19.0.1.tar.bz2
+sha1 2952d2a4e25a6e27cfbd49c11727400eb80f7fe0  xf86-video-amdgpu-19.0.1.tar.bz2
+sha256 aaa197196aadcb12e93e10a2aa03c9aedc9ba7b27c2643a8ef620d41e2d1c6d5  xf86-video-amdgpu-19.0.1.tar.bz2
+sha512 dda04e3ccee140354f59e04895cf50cd7dc06a105c40ce35069613c5b5fbe083cab6833fd293d96334f64dde1a0c4af6154d473594a144f37404188ae7f37dd5  xf86-video-amdgpu-19.0.1.tar.bz2
 # Locally computed
 sha256 58847c8e97190c401afa84b3f0b8b147379c876a184e99af2cb51bfd40ac8936  COPYING
diff --git a/package/x11r7/xdriver_xf86-video-amdgpu/xdriver_xf86-video-amdgpu.mk b/package/x11r7/xdriver_xf86-video-amdgpu/xdriver_xf86-video-amdgpu.mk
index a2cecae7b4..685c8d502a 100644
--- a/package/x11r7/xdriver_xf86-video-amdgpu/xdriver_xf86-video-amdgpu.mk
+++ b/package/x11r7/xdriver_xf86-video-amdgpu/xdriver_xf86-video-amdgpu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_AMDGPU_VERSION = 19.0.0
+XDRIVER_XF86_VIDEO_AMDGPU_VERSION = 19.0.1
 XDRIVER_XF86_VIDEO_AMDGPU_SOURCE = xf86-video-amdgpu-$(XDRIVER_XF86_VIDEO_AMDGPU_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_AMDGPU_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_AMDGPU_LICENSE = MIT
