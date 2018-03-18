From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 18 Mar 2018 23:25:11 +0100
Subject: [Buildroot] [git commit] package/x11r7/xdriver_xf86-video-amdgpu:
 bump version to 18.0.1
Message-ID: <20180318222950.1A1EE83745@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=28a5247aaf78e7eac23230878429875734380235
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../xdriver_xf86-video-amdgpu/xdriver_xf86-video-amdgpu.hash   | 10 +++++-----
 .../xdriver_xf86-video-amdgpu/xdriver_xf86-video-amdgpu.mk     |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-amdgpu/xdriver_xf86-video-amdgpu.hash b/package/x11r7/xdriver_xf86-video-amdgpu/xdriver_xf86-video-amdgpu.hash
index b03a010f84..d0fae63e61 100644
--- a/package/x11r7/xdriver_xf86-video-amdgpu/xdriver_xf86-video-amdgpu.hash
+++ b/package/x11r7/xdriver_xf86-video-amdgpu/xdriver_xf86-video-amdgpu.hash
@@ -1,7 +1,7 @@
-# From https://lists.x.org/archives/xorg-announce/2018-March/002844.html
-md5 24b2c9dc27a6083289bc86023eb3b1fe  xf86-video-amdgpu-18.0.0.tar.bz2
-sha1 360d619de1629913d356c60f1e155553e0e55dbb  xf86-video-amdgpu-18.0.0.tar.bz2
-sha256 e909b9707d2562dfc36d8075a8cbddbc93901aaa8f2522d9a429c3fc5ad66d94  xf86-video-amdgpu-18.0.0.tar.bz2
-sha512 5f9fa173c1b2f90878a9cc961e49abb0ad56db16fd80ec9fe6788fcc90eaa1906f3bff74437cb9afa95b9212ff946e1558736739f27e959a3848e77e4dabbd17  xf86-video-amdgpu-18.0.0.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2018-March/002883.html
+md5 d8368d204cb98d4387c8890562db1143  xf86-video-amdgpu-18.0.1.tar.bz2
+sha1 a9c7125eae9870f26afa5167d5683f8d5e1b43c0  xf86-video-amdgpu-18.0.1.tar.bz2
+sha256 7484682ccb403b3ca9e26d1c980572f08cdfa3469e2b2c9a9affc3d51b52691b  xf86-video-amdgpu-18.0.1.tar.bz2
+sha512 eb3b76240d4e5084d68b5063b5b19ad5f5bb1f93ea9929301d9e17a48ddc1cb713b76529cb93d133b3547fe78ae8a4455f6b15f6ddf88c29349f82bb1a0db1c4  xf86-video-amdgpu-18.0.1.tar.bz2
 # Locally computed
 sha256 58847c8e97190c401afa84b3f0b8b147379c876a184e99af2cb51bfd40ac8936  COPYING
diff --git a/package/x11r7/xdriver_xf86-video-amdgpu/xdriver_xf86-video-amdgpu.mk b/package/x11r7/xdriver_xf86-video-amdgpu/xdriver_xf86-video-amdgpu.mk
index 2c3986252c..5c1fb3f844 100644
--- a/package/x11r7/xdriver_xf86-video-amdgpu/xdriver_xf86-video-amdgpu.mk
+++ b/package/x11r7/xdriver_xf86-video-amdgpu/xdriver_xf86-video-amdgpu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_AMDGPU_VERSION = 18.0.0
+XDRIVER_XF86_VIDEO_AMDGPU_VERSION = 18.0.1
 XDRIVER_XF86_VIDEO_AMDGPU_SOURCE = xf86-video-amdgpu-$(XDRIVER_XF86_VIDEO_AMDGPU_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_AMDGPU_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_AMDGPU_LICENSE = MIT
