From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 12 Oct 2019 08:05:54 +0200
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xdriver_xf86-video-amdgpu:
 bump version to 19.1.0
Message-ID: <20191012060554.10879-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../xdriver_xf86-video-amdgpu.hash                     | 10 +++++-----
 .../xdriver_xf86-video-amdgpu.mk                       |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-amdgpu/xdriver_xf86-video-amdgpu.hash b/package/x11r7/xdriver_xf86-video-amdgpu/xdriver_xf86-video-amdgpu.hash
index 6ca669f793..4bbfb0de71 100644
--- a/package/x11r7/xdriver_xf86-video-amdgpu/xdriver_xf86-video-amdgpu.hash
+++ b/package/x11r7/xdriver_xf86-video-amdgpu/xdriver_xf86-video-amdgpu.hash
@@ -1,7 +1,7 @@
-# From https://lists.x.org/archives/xorg-announce/2019-March/002987.html
-md5 f3b33958e99c896084f12cd48f7ba007  xf86-video-amdgpu-19.0.1.tar.bz2
-sha1 2952d2a4e25a6e27cfbd49c11727400eb80f7fe0  xf86-video-amdgpu-19.0.1.tar.bz2
-sha256 aaa197196aadcb12e93e10a2aa03c9aedc9ba7b27c2643a8ef620d41e2d1c6d5  xf86-video-amdgpu-19.0.1.tar.bz2
-sha512 dda04e3ccee140354f59e04895cf50cd7dc06a105c40ce35069613c5b5fbe083cab6833fd293d96334f64dde1a0c4af6154d473594a144f37404188ae7f37dd5  xf86-video-amdgpu-19.0.1.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2019-October/003026.html
+md5 55ad19b858e186a2cf4e91ed832c05e7  xf86-video-amdgpu-19.1.0.tar.bz2
+sha1 044a97ea2f36dd3d2d4844bb503dd4e2b2854d56  xf86-video-amdgpu-19.1.0.tar.bz2
+sha256 4f0ea4e0ae61995ac2b7c72433d31deab63b60c78763020aaa1b28696124fe5d  xf86-video-amdgpu-19.1.0.tar.bz2
+sha512 ccdaa2378492da1a2f3d18fedacd1318c4708da534a8a959276a82730d5420619d83ad1ec8d7835c55655fe56123cd9bffb44e6223c5a97033c01f598af4a173  xf86-video-amdgpu-19.1.0.tar.bz2
 # Locally computed
 sha256 58847c8e97190c401afa84b3f0b8b147379c876a184e99af2cb51bfd40ac8936  COPYING
diff --git a/package/x11r7/xdriver_xf86-video-amdgpu/xdriver_xf86-video-amdgpu.mk b/package/x11r7/xdriver_xf86-video-amdgpu/xdriver_xf86-video-amdgpu.mk
index 685c8d502a..e7196956a3 100644
--- a/package/x11r7/xdriver_xf86-video-amdgpu/xdriver_xf86-video-amdgpu.mk
+++ b/package/x11r7/xdriver_xf86-video-amdgpu/xdriver_xf86-video-amdgpu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_AMDGPU_VERSION = 19.0.1
+XDRIVER_XF86_VIDEO_AMDGPU_VERSION = 19.1.0
 XDRIVER_XF86_VIDEO_AMDGPU_SOURCE = xf86-video-amdgpu-$(XDRIVER_XF86_VIDEO_AMDGPU_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_AMDGPU_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_AMDGPU_LICENSE = MIT
-- 
2.20.1
