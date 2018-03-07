From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed,  7 Mar 2018 21:58:43 +0100
Subject: [Buildroot] [PATCH 18/19] package/x11r7/xdriver_xf86-video-ati:
 bump version to 18.0.0
In-Reply-To: <20180307205844.3240-1-bernd.kuhls@t-online.de>
References: <20180307205844.3240-1-bernd.kuhls@t-online.de>
Message-ID: <20180307205844.3240-18-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added license hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.hash | 12 +++++++-----
 .../x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk   |  2 +-
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.hash b/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.hash
index 117c5749ff..54c553e6ce 100644
--- a/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.hash
+++ b/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.hash
@@ -1,5 +1,7 @@
-# From https://lists.x.org/archives/xorg-announce/2017-September/002806.html
-md5 0ff538f78ae82ccce384dadf7a705863  xf86-video-ati-7.10.0.tar.bz2
-sha1 38e535ecc8445c1b9464ac34db959337929887f7  xf86-video-ati-7.10.0.tar.bz2
-sha256 ee51d642e3105cb5424f02622dc2966b87b42d498bb34104a70fcf6d4a8f4e79  xf86-video-ati-7.10.0.tar.bz2
-sha512 1f2f4af1d299af62644693e6fbc47a5078c9bc5e7887a1ac217121ef2fd29d8c9f50a8d9be9ddb0887d0b49141bb33484f82c1313a472ad6867266b53b4a11ad  xf86-video-ati-7.10.0.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2018-March/002854.html
+md5 4d41bfe860dc719654cad3f82d00f6f3  xf86-video-ati-18.0.0.tar.bz2
+sha1 da1b89a747264d976d824ddc7b5b4f803d3cf765  xf86-video-ati-18.0.0.tar.bz2
+sha256 2c0368fb620d1fdfa2b435e672d65444c2fb9df21bbaf979298484b89ef83981  xf86-video-ati-18.0.0.tar.bz2
+sha512 a9a634091f208099885039d42433cee061e03968417c0d535691833abcc9162d8d0a46f99bac902f0885beb14dcc9a011d104b535ffe492562fd5bb740ad4721  xf86-video-ati-18.0.0.tar.bz2
+# Locally computed
+sha256 58847c8e97190c401afa84b3f0b8b147379c876a184e99af2cb51bfd40ac8936  COPYING
diff --git a/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk b/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk
index f8b8f70cb6..0e9d412b75 100644
--- a/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk
+++ b/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_ATI_VERSION = 7.10.0
+XDRIVER_XF86_VIDEO_ATI_VERSION = 18.0.0
 XDRIVER_XF86_VIDEO_ATI_SOURCE = xf86-video-ati-$(XDRIVER_XF86_VIDEO_ATI_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_ATI_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_ATI_LICENSE = MIT
-- 
2.11.0
