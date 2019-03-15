From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 15 Mar 2019 21:33:09 +0100
Subject: [Buildroot] [git commit] package/x11r7/xdriver_xf86-video-amdgpu:
 bump version to 19.0.0
Message-ID: <20190315203120.6D54E83480@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1ef13fd5326955ac83a36deb82787d8d0e6d1712
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../xdriver_xf86-video-amdgpu/xdriver_xf86-video-amdgpu.hash   | 10 +++++-----
 .../xdriver_xf86-video-amdgpu/xdriver_xf86-video-amdgpu.mk     |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-amdgpu/xdriver_xf86-video-amdgpu.hash b/package/x11r7/xdriver_xf86-video-amdgpu/xdriver_xf86-video-amdgpu.hash
index 999f971811..7f1ad29110 100644
--- a/package/x11r7/xdriver_xf86-video-amdgpu/xdriver_xf86-video-amdgpu.hash
+++ b/package/x11r7/xdriver_xf86-video-amdgpu/xdriver_xf86-video-amdgpu.hash
@@ -1,7 +1,7 @@
-# From https://lists.x.org/archives/xorg-announce/2018-September/002918.html
-md5  5d75f5993cda5e013cd851c5947ec450  xf86-video-amdgpu-18.1.0.tar.bz2
-sha1 d3097af7da3b56396721e214f348e7ceb5f3a358  xf86-video-amdgpu-18.1.0.tar.bz2
-sha256 e11f25bb51d718b8ea938ad2b8095323c0ab16f4ddffd92091d80f9a445a9672  xf86-video-amdgpu-18.1.0.tar.bz2
-sha512 371f1a9f6cd2ce3b7117361222d196950c5efa01d957783c79a37c19a2273ce33d133fa51bb68432b8535aad61cb14fbb61d173a167d318b2533eb2507b7a903  xf86-video-amdgpu-18.1.0.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2019-March/002966.html
+md5 a9a1bee983e570614a78ae9070223149  xf86-video-amdgpu-19.0.0.tar.bz2
+sha1 7a9c6f08ec7c0a8cc665079c8f49716febc73729  xf86-video-amdgpu-19.0.0.tar.bz2
+sha256 8836147d4755908ec9e192b7cc485fbc2ce7706de33f7bea515294d3ba4c4f51  xf86-video-amdgpu-19.0.0.tar.bz2
+sha512 6a30fc03185816307f16693cd6b07f13694ca1b6b1327c58a951bccc8082f112bb768ab610229dc1040617eef860fc1ab17a7e6bf635c5a4e454e252f3addca8  xf86-video-amdgpu-19.0.0.tar.bz2
 # Locally computed
 sha256 58847c8e97190c401afa84b3f0b8b147379c876a184e99af2cb51bfd40ac8936  COPYING
diff --git a/package/x11r7/xdriver_xf86-video-amdgpu/xdriver_xf86-video-amdgpu.mk b/package/x11r7/xdriver_xf86-video-amdgpu/xdriver_xf86-video-amdgpu.mk
index 6a8266d0b0..a2cecae7b4 100644
--- a/package/x11r7/xdriver_xf86-video-amdgpu/xdriver_xf86-video-amdgpu.mk
+++ b/package/x11r7/xdriver_xf86-video-amdgpu/xdriver_xf86-video-amdgpu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_AMDGPU_VERSION = 18.1.0
+XDRIVER_XF86_VIDEO_AMDGPU_VERSION = 19.0.0
 XDRIVER_XF86_VIDEO_AMDGPU_SOURCE = xf86-video-amdgpu-$(XDRIVER_XF86_VIDEO_AMDGPU_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_AMDGPU_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_AMDGPU_LICENSE = MIT
