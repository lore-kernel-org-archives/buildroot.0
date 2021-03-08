From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 08 Mar 2021 07:44:50 -0000
Subject: [Buildroot] [git commit] package/x11r7/xdriver_xf86-video-nouveau:
 bump version to 1.0.17
Message-ID: <20210308072134.1CE5581607@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f0b41307a336b4d3eee383e913019e39067459d0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://lists.freedesktop.org/archives/nouveau/2021-January/037766.html

Reformatted hashes.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../xdriver_xf86-video-nouveau.hash                           | 11 +++++------
 .../xdriver_xf86-video-nouveau/xdriver_xf86-video-nouveau.mk  |  2 +-
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-nouveau/xdriver_xf86-video-nouveau.hash b/package/x11r7/xdriver_xf86-video-nouveau/xdriver_xf86-video-nouveau.hash
index b70728f9b7..336f29be46 100644
--- a/package/x11r7/xdriver_xf86-video-nouveau/xdriver_xf86-video-nouveau.hash
+++ b/package/x11r7/xdriver_xf86-video-nouveau/xdriver_xf86-video-nouveau.hash
@@ -1,7 +1,6 @@
-# From https://lists.freedesktop.org/archives/nouveau/2019-January/032053.html
-md5 ecd9be89d853301167e3d564c49f7a8e  xf86-video-nouveau-1.0.16.tar.bz2
-sha1 a2d19439ceed315079207a62c6888a12e8489995  xf86-video-nouveau-1.0.16.tar.bz2
-sha256 304060806415579cdb5c1f71f1c54d11cacb431b5552b170decbc883ed43bf06  xf86-video-nouveau-1.0.16.tar.bz2
-sha512 41b7839c37372660968ab7da2bc3d9feef3cab4e994d05d4ba6e59071f0d1b1f8d7dcdbcb15a42a375a556d28dc067f9ffe45d73c1d121ad307d199107ade3e0  xf86-video-nouveau-1.0.16.tar.bz2
+# From https://lists.freedesktop.org/archives/nouveau/2021-January/037766.html
+sha256  499322e27a55c8183166bf2dd1e47d085eb834143e0d7036baba8427b90c156b  xf86-video-nouveau-1.0.17.tar.bz2
+sha512  adba58ba5298d1a5b3f9f8540f9ef2cb2e10e47bba8e374103ec2e1f92e915f5f4393ed0021168cd649646e12315135a1efcdf77e8fb1648e1295914d87279b2  xf86-video-nouveau-1.0.17.tar.bz2
+
 # Locally computed
-sha256 27d8cbdcde7a0bd062ce49cdf8c672201452a64e3e6823f09b1beffe2c4b8eff  COPYING
+sha256  27d8cbdcde7a0bd062ce49cdf8c672201452a64e3e6823f09b1beffe2c4b8eff  COPYING
diff --git a/package/x11r7/xdriver_xf86-video-nouveau/xdriver_xf86-video-nouveau.mk b/package/x11r7/xdriver_xf86-video-nouveau/xdriver_xf86-video-nouveau.mk
index d85cbfe4a4..e63bc611bf 100644
--- a/package/x11r7/xdriver_xf86-video-nouveau/xdriver_xf86-video-nouveau.mk
+++ b/package/x11r7/xdriver_xf86-video-nouveau/xdriver_xf86-video-nouveau.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_NOUVEAU_VERSION = 1.0.16
+XDRIVER_XF86_VIDEO_NOUVEAU_VERSION = 1.0.17
 XDRIVER_XF86_VIDEO_NOUVEAU_SOURCE = xf86-video-nouveau-$(XDRIVER_XF86_VIDEO_NOUVEAU_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_NOUVEAU_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_NOUVEAU_LICENSE = MIT
