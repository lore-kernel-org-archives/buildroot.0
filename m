From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 15 Mar 2019 21:33:09 +0100
Subject: [Buildroot] [git commit] package/x11r7/xdriver_xf86-video-ati: bump
 version to 19.0.0
Message-ID: <20190315203120.72D1083480@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0764f509fc171f4d546df3a9ba7fbc75c545f036
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.hash   | 10 +++++-----
 package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.hash b/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.hash
index e9581cb084..4b6cce7af8 100644
--- a/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.hash
+++ b/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.hash
@@ -1,7 +1,7 @@
-# From https://lists.x.org/archives/xorg-announce/2018-September/002919.html
-md5  7910883fff7f4a462efac0fe059ed7e3  xf86-video-ati-18.1.0.tar.bz2
-sha1 87beb7d09f5b722570adda9a5a1822cbd19e7059  xf86-video-ati-18.1.0.tar.bz2
-sha256 6c335f423c1dc3d904550d41cb871ca4130ba7037dda67d82e3f1555e1bfb9ac  xf86-video-ati-18.1.0.tar.bz2
-sha512 7a58c9a6cb4876bd2ff37d837372b4e360e81fec7de6a6c7a48d70a5338d62745f734f5d4207f30aa368ff2d9ef44f5f1ef36afd73802a618998c16fe395ed53  xf86-video-ati-18.1.0.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2019-March/002967.html
+md5 0a95c1c8158d658bd0b3ac38a1b31382  xf86-video-ati-19.0.0.tar.bz2
+sha1 c7bb5d25ca725b8fa625a5f1a6948433e51b98a5  xf86-video-ati-19.0.0.tar.bz2
+sha256 dd907d318884bb6e81e7e62da7bb34af26aeeed3a81c21e0b46a4f3cae3ff457  xf86-video-ati-19.0.0.tar.bz2
+sha512 0674c8befa926fd3b431ce80d90f2cd0de17314efe7fd3a5ed0d78018d6cd32625b514bf68436a47eb15e5ad4b50317f3c09fd687b77e69a067d1210ee459827  xf86-video-ati-19.0.0.tar.bz2
 # Locally computed
 sha256 58847c8e97190c401afa84b3f0b8b147379c876a184e99af2cb51bfd40ac8936  COPYING
diff --git a/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk b/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk
index e89929d291..45401b7841 100644
--- a/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk
+++ b/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_ATI_VERSION = 18.1.0
+XDRIVER_XF86_VIDEO_ATI_VERSION = 19.0.0
 XDRIVER_XF86_VIDEO_ATI_SOURCE = xf86-video-ati-$(XDRIVER_XF86_VIDEO_ATI_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_ATI_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_ATI_LICENSE = MIT
