From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 15 Mar 2018 19:48:45 +0100
Subject: [Buildroot] [PATCH 2/2] package/x11r7/xdriver_xf86-video-ati: bump
 version to 18.0.1
In-Reply-To: <20180315184845.26773-1-bernd.kuhls@t-online.de>
References: <20180315184845.26773-1-bernd.kuhls@t-online.de>
Message-ID: <20180315184845.26773-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.hash   | 10 +++++-----
 package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.hash b/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.hash
index 54c553e6ce..d37096e9e4 100644
--- a/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.hash
+++ b/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.hash
@@ -1,7 +1,7 @@
-# From https://lists.x.org/archives/xorg-announce/2018-March/002854.html
-md5 4d41bfe860dc719654cad3f82d00f6f3  xf86-video-ati-18.0.0.tar.bz2
-sha1 da1b89a747264d976d824ddc7b5b4f803d3cf765  xf86-video-ati-18.0.0.tar.bz2
-sha256 2c0368fb620d1fdfa2b435e672d65444c2fb9df21bbaf979298484b89ef83981  xf86-video-ati-18.0.0.tar.bz2
-sha512 a9a634091f208099885039d42433cee061e03968417c0d535691833abcc9162d8d0a46f99bac902f0885beb14dcc9a011d104b535ffe492562fd5bb740ad4721  xf86-video-ati-18.0.0.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2018-March/002884.html
+md5 40e7c0a5a69aba3d84e0958f58705ea7  xf86-video-ati-18.0.1.tar.bz2
+sha1 b5a0b6a2fa839d668a3fb90280fede95f0bc130d  xf86-video-ati-18.0.1.tar.bz2
+sha256 72ea3b8127d4550b64f797457f5a7851a541fa4ee2cc3f345b6c1886b81714a0  xf86-video-ati-18.0.1.tar.bz2
+sha512 b468a78503a596bbf71a1b91b231ce1fa32908f619ff2dfe249352d046696a3641f2a9ff065e32545fff77100134b4b237591215e78ef885b6509d6b16112d14  xf86-video-ati-18.0.1.tar.bz2
 # Locally computed
 sha256 58847c8e97190c401afa84b3f0b8b147379c876a184e99af2cb51bfd40ac8936  COPYING
diff --git a/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk b/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk
index 0e9d412b75..8726695399 100644
--- a/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk
+++ b/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_ATI_VERSION = 18.0.0
+XDRIVER_XF86_VIDEO_ATI_VERSION = 18.0.1
 XDRIVER_XF86_VIDEO_ATI_SOURCE = xf86-video-ati-$(XDRIVER_XF86_VIDEO_ATI_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_ATI_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_ATI_LICENSE = MIT
-- 
2.11.0
