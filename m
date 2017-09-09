From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 9 Sep 2017 22:17:41 +0200
Subject: [Buildroot] [git commit] package/x11r7/xdriver_xf86-video-ati: bump
	version to 7.10.0
Message-ID: <20170909201815.850B3801A2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=450e7c9824a2861197efbbc5594a99102a8927f7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Added all hashes provided by upstream.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.hash | 7 +++++--
 package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk   | 2 +-
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.hash b/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.hash
index 2cb4037..117c574 100644
--- a/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.hash
+++ b/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.hash
@@ -1,2 +1,5 @@
-# From https://lists.freedesktop.org/archives/xorg/2017-March/058669.html
-sha256 3cad872e6330afb1707da11e4e959e6887ebe5bcd81854b4d2e496c52c059875  xf86-video-ati-7.9.0.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2017-September/002806.html
+md5 0ff538f78ae82ccce384dadf7a705863  xf86-video-ati-7.10.0.tar.bz2
+sha1 38e535ecc8445c1b9464ac34db959337929887f7  xf86-video-ati-7.10.0.tar.bz2
+sha256 ee51d642e3105cb5424f02622dc2966b87b42d498bb34104a70fcf6d4a8f4e79  xf86-video-ati-7.10.0.tar.bz2
+sha512 1f2f4af1d299af62644693e6fbc47a5078c9bc5e7887a1ac217121ef2fd29d8c9f50a8d9be9ddb0887d0b49141bb33484f82c1313a472ad6867266b53b4a11ad  xf86-video-ati-7.10.0.tar.bz2
diff --git a/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk b/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk
index bc92358..f8b8f70 100644
--- a/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk
+++ b/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_ATI_VERSION = 7.9.0
+XDRIVER_XF86_VIDEO_ATI_VERSION = 7.10.0
 XDRIVER_XF86_VIDEO_ATI_SOURCE = xf86-video-ati-$(XDRIVER_XF86_VIDEO_ATI_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_ATI_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_ATI_LICENSE = MIT
