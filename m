From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 16 Sep 2018 15:08:51 +0200
Subject: [Buildroot] [git commit] package/x11r7/xdriver_xf86-video-ati: bump
 version to 18.1.0
Message-ID: <20180916131636.25D4C88255@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=64aebfa5b3bdd6414d6977abaab495042bfa3abf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.hash   | 10 +++++-----
 package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.hash b/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.hash
index d37096e9e4..e9581cb084 100644
--- a/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.hash
+++ b/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.hash
@@ -1,7 +1,7 @@
-# From https://lists.x.org/archives/xorg-announce/2018-March/002884.html
-md5 40e7c0a5a69aba3d84e0958f58705ea7  xf86-video-ati-18.0.1.tar.bz2
-sha1 b5a0b6a2fa839d668a3fb90280fede95f0bc130d  xf86-video-ati-18.0.1.tar.bz2
-sha256 72ea3b8127d4550b64f797457f5a7851a541fa4ee2cc3f345b6c1886b81714a0  xf86-video-ati-18.0.1.tar.bz2
-sha512 b468a78503a596bbf71a1b91b231ce1fa32908f619ff2dfe249352d046696a3641f2a9ff065e32545fff77100134b4b237591215e78ef885b6509d6b16112d14  xf86-video-ati-18.0.1.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2018-September/002919.html
+md5  7910883fff7f4a462efac0fe059ed7e3  xf86-video-ati-18.1.0.tar.bz2
+sha1 87beb7d09f5b722570adda9a5a1822cbd19e7059  xf86-video-ati-18.1.0.tar.bz2
+sha256 6c335f423c1dc3d904550d41cb871ca4130ba7037dda67d82e3f1555e1bfb9ac  xf86-video-ati-18.1.0.tar.bz2
+sha512 7a58c9a6cb4876bd2ff37d837372b4e360e81fec7de6a6c7a48d70a5338d62745f734f5d4207f30aa368ff2d9ef44f5f1ef36afd73802a618998c16fe395ed53  xf86-video-ati-18.1.0.tar.bz2
 # Locally computed
 sha256 58847c8e97190c401afa84b3f0b8b147379c876a184e99af2cb51bfd40ac8936  COPYING
diff --git a/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk b/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk
index 4f1b4da8bd..e89929d291 100644
--- a/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk
+++ b/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_ATI_VERSION = 18.0.1
+XDRIVER_XF86_VIDEO_ATI_VERSION = 18.1.0
 XDRIVER_XF86_VIDEO_ATI_SOURCE = xf86-video-ati-$(XDRIVER_XF86_VIDEO_ATI_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_ATI_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_ATI_LICENSE = MIT
