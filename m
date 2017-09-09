From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 9 Sep 2017 22:17:36 +0200
Subject: [Buildroot] [git commit] package/x11r7/xdriver_xf86-video-amdgpu:
	bump version to 1.4.0
Message-ID: <20170909201815.78D0880298@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3eb95e6311f354a4fbc8b8ebaaf0d490cf04c217
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Added sha512 hash provided by upstream.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../xdriver_xf86-video-amdgpu/xdriver_xf86-video-amdgpu.hash     | 9 +++++----
 .../x11r7/xdriver_xf86-video-amdgpu/xdriver_xf86-video-amdgpu.mk | 2 +-
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-amdgpu/xdriver_xf86-video-amdgpu.hash b/package/x11r7/xdriver_xf86-video-amdgpu/xdriver_xf86-video-amdgpu.hash
index 13246b6..b5910f3 100644
--- a/package/x11r7/xdriver_xf86-video-amdgpu/xdriver_xf86-video-amdgpu.hash
+++ b/package/x11r7/xdriver_xf86-video-amdgpu/xdriver_xf86-video-amdgpu.hash
@@ -1,4 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2017-March/002788.html
-md5 e2ee9e16ffbd45ebda68a7ff638a04f2  xf86-video-amdgpu-1.3.0.tar.bz2
-sha1 7b89fe6e22e6739257c0f03c9f034c9c579a8bce  xf86-video-amdgpu-1.3.0.tar.bz2
-sha256 c1630f228938be949273f72b29ae70822dde064ad79c3ccb14d55f427e3f4e70  xf86-video-amdgpu-1.3.0.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2017-September/002805.html
+md5 15a54f0a7870a57e3f611c9114924137  xf86-video-amdgpu-1.4.0.tar.bz2
+sha1 d9971cc6177095219a6687328aef25a72df3dd9d  xf86-video-amdgpu-1.4.0.tar.bz2
+sha256 f8cac4bf3dd795b93cc337e5c0c62618026f597890a10d996f09c73eb88ba67c  xf86-video-amdgpu-1.4.0.tar.bz2
+sha512 cae6417a45f6b981e007e080486083f1c38eaca58c6e331b04bbf46c86f23394742a722ae0d798d8dcad66879e99d90e57f04ae9ccb198f3ed26ec745878ccc2  xf86-video-amdgpu-1.4.0.tar.bz2
diff --git a/package/x11r7/xdriver_xf86-video-amdgpu/xdriver_xf86-video-amdgpu.mk b/package/x11r7/xdriver_xf86-video-amdgpu/xdriver_xf86-video-amdgpu.mk
index 9bd7536..50e5310 100644
--- a/package/x11r7/xdriver_xf86-video-amdgpu/xdriver_xf86-video-amdgpu.mk
+++ b/package/x11r7/xdriver_xf86-video-amdgpu/xdriver_xf86-video-amdgpu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_AMDGPU_VERSION = 1.3.0
+XDRIVER_XF86_VIDEO_AMDGPU_VERSION = 1.4.0
 XDRIVER_XF86_VIDEO_AMDGPU_SOURCE = xf86-video-amdgpu-$(XDRIVER_XF86_VIDEO_AMDGPU_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_AMDGPU_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_AMDGPU_LICENSE = MIT
