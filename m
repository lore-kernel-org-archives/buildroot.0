From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 15 Sep 2018 16:44:01 +0200
Subject: [Buildroot] [PATCH 1/2] package/x11r7/xdriver_xf86-video-amdgpu:
 bump version to 18.1.0
Message-ID: <20180915144402.9073-1-bernd.kuhls@t-online.de>
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
index d0fae63e61..999f971811 100644
--- a/package/x11r7/xdriver_xf86-video-amdgpu/xdriver_xf86-video-amdgpu.hash
+++ b/package/x11r7/xdriver_xf86-video-amdgpu/xdriver_xf86-video-amdgpu.hash
@@ -1,7 +1,7 @@
-# From https://lists.x.org/archives/xorg-announce/2018-March/002883.html
-md5 d8368d204cb98d4387c8890562db1143  xf86-video-amdgpu-18.0.1.tar.bz2
-sha1 a9c7125eae9870f26afa5167d5683f8d5e1b43c0  xf86-video-amdgpu-18.0.1.tar.bz2
-sha256 7484682ccb403b3ca9e26d1c980572f08cdfa3469e2b2c9a9affc3d51b52691b  xf86-video-amdgpu-18.0.1.tar.bz2
-sha512 eb3b76240d4e5084d68b5063b5b19ad5f5bb1f93ea9929301d9e17a48ddc1cb713b76529cb93d133b3547fe78ae8a4455f6b15f6ddf88c29349f82bb1a0db1c4  xf86-video-amdgpu-18.0.1.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2018-September/002918.html
+md5  5d75f5993cda5e013cd851c5947ec450  xf86-video-amdgpu-18.1.0.tar.bz2
+sha1 d3097af7da3b56396721e214f348e7ceb5f3a358  xf86-video-amdgpu-18.1.0.tar.bz2
+sha256 e11f25bb51d718b8ea938ad2b8095323c0ab16f4ddffd92091d80f9a445a9672  xf86-video-amdgpu-18.1.0.tar.bz2
+sha512 371f1a9f6cd2ce3b7117361222d196950c5efa01d957783c79a37c19a2273ce33d133fa51bb68432b8535aad61cb14fbb61d173a167d318b2533eb2507b7a903  xf86-video-amdgpu-18.1.0.tar.bz2
 # Locally computed
 sha256 58847c8e97190c401afa84b3f0b8b147379c876a184e99af2cb51bfd40ac8936  COPYING
diff --git a/package/x11r7/xdriver_xf86-video-amdgpu/xdriver_xf86-video-amdgpu.mk b/package/x11r7/xdriver_xf86-video-amdgpu/xdriver_xf86-video-amdgpu.mk
index b8b7dcfe2f..6a8266d0b0 100644
--- a/package/x11r7/xdriver_xf86-video-amdgpu/xdriver_xf86-video-amdgpu.mk
+++ b/package/x11r7/xdriver_xf86-video-amdgpu/xdriver_xf86-video-amdgpu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_AMDGPU_VERSION = 18.0.1
+XDRIVER_XF86_VIDEO_AMDGPU_VERSION = 18.1.0
 XDRIVER_XF86_VIDEO_AMDGPU_SOURCE = xf86-video-amdgpu-$(XDRIVER_XF86_VIDEO_AMDGPU_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_AMDGPU_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_AMDGPU_LICENSE = MIT
-- 
2.18.0
