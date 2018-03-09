From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 9 Mar 2018 23:31:14 +0100
Subject: [Buildroot] [git commit] package/x11r7/xdriver_xf86-video-amdgpu:
 bump version to 18.0.0
Message-ID: <20180309223125.3D5D47FFA5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=23696d610f7eeacbcda6421334b321c89ddda2a5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Added license hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../xdriver_xf86-video-amdgpu/xdriver_xf86-video-amdgpu.hash | 12 +++++++-----
 .../xdriver_xf86-video-amdgpu/xdriver_xf86-video-amdgpu.mk   |  2 +-
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-amdgpu/xdriver_xf86-video-amdgpu.hash b/package/x11r7/xdriver_xf86-video-amdgpu/xdriver_xf86-video-amdgpu.hash
index b5910f3c0f..b03a010f84 100644
--- a/package/x11r7/xdriver_xf86-video-amdgpu/xdriver_xf86-video-amdgpu.hash
+++ b/package/x11r7/xdriver_xf86-video-amdgpu/xdriver_xf86-video-amdgpu.hash
@@ -1,5 +1,7 @@
-# From https://lists.x.org/archives/xorg-announce/2017-September/002805.html
-md5 15a54f0a7870a57e3f611c9114924137  xf86-video-amdgpu-1.4.0.tar.bz2
-sha1 d9971cc6177095219a6687328aef25a72df3dd9d  xf86-video-amdgpu-1.4.0.tar.bz2
-sha256 f8cac4bf3dd795b93cc337e5c0c62618026f597890a10d996f09c73eb88ba67c  xf86-video-amdgpu-1.4.0.tar.bz2
-sha512 cae6417a45f6b981e007e080486083f1c38eaca58c6e331b04bbf46c86f23394742a722ae0d798d8dcad66879e99d90e57f04ae9ccb198f3ed26ec745878ccc2  xf86-video-amdgpu-1.4.0.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2018-March/002844.html
+md5 24b2c9dc27a6083289bc86023eb3b1fe  xf86-video-amdgpu-18.0.0.tar.bz2
+sha1 360d619de1629913d356c60f1e155553e0e55dbb  xf86-video-amdgpu-18.0.0.tar.bz2
+sha256 e909b9707d2562dfc36d8075a8cbddbc93901aaa8f2522d9a429c3fc5ad66d94  xf86-video-amdgpu-18.0.0.tar.bz2
+sha512 5f9fa173c1b2f90878a9cc961e49abb0ad56db16fd80ec9fe6788fcc90eaa1906f3bff74437cb9afa95b9212ff946e1558736739f27e959a3848e77e4dabbd17  xf86-video-amdgpu-18.0.0.tar.bz2
+# Locally computed
+sha256 58847c8e97190c401afa84b3f0b8b147379c876a184e99af2cb51bfd40ac8936  COPYING
diff --git a/package/x11r7/xdriver_xf86-video-amdgpu/xdriver_xf86-video-amdgpu.mk b/package/x11r7/xdriver_xf86-video-amdgpu/xdriver_xf86-video-amdgpu.mk
index 50e5310e46..2c3986252c 100644
--- a/package/x11r7/xdriver_xf86-video-amdgpu/xdriver_xf86-video-amdgpu.mk
+++ b/package/x11r7/xdriver_xf86-video-amdgpu/xdriver_xf86-video-amdgpu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_AMDGPU_VERSION = 1.4.0
+XDRIVER_XF86_VIDEO_AMDGPU_VERSION = 18.0.0
 XDRIVER_XF86_VIDEO_AMDGPU_SOURCE = xf86-video-amdgpu-$(XDRIVER_XF86_VIDEO_AMDGPU_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_AMDGPU_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_AMDGPU_LICENSE = MIT
