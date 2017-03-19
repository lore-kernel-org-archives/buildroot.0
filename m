From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 19 Mar 2017 21:51:55 +0100
Subject: [Buildroot] [PATCH 3/3] package/x11r7/xdriver_xf86-video-ati: bump
	version to 7.9.0
In-Reply-To: <20170319205155.3333-1-romain.naour@gmail.com>
References: <20170319205155.3333-1-romain.naour@gmail.com>
Message-ID: <20170319205155.3333-3-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.hash | 4 ++--
 package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk   | 2 +-
 package/x11r7/xserver_xorg-server/xserver_xorg-server.hash       | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.hash b/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.hash
index fe5ae0e..2cb4037 100644
--- a/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.hash
+++ b/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.hash
@@ -1,2 +1,2 @@
-# From https://lists.x.org/archives/xorg-announce/2016-November/002738.html
-sha256 401f5de772928f3dc4ce43a885adb0a47a2f61aa4a9e45d2ab3d184136a9d6fa  xf86-video-ati-7.8.0.tar.bz2
+# From https://lists.freedesktop.org/archives/xorg/2017-March/058669.html
+sha256 3cad872e6330afb1707da11e4e959e6887ebe5bcd81854b4d2e496c52c059875  xf86-video-ati-7.9.0.tar.bz2
diff --git a/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk b/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk
index ea70167..bc92358 100644
--- a/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk
+++ b/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_ATI_VERSION = 7.8.0
+XDRIVER_XF86_VIDEO_ATI_VERSION = 7.9.0
 XDRIVER_XF86_VIDEO_ATI_SOURCE = xf86-video-ati-$(XDRIVER_XF86_VIDEO_ATI_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_ATI_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_ATI_LICENSE = MIT
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash b/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
index b7b4635..841be04 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
@@ -4,4 +4,4 @@ sha256 fcf66fa6ad86227613d2d3e8ae13ded297e2a1e947e9060a083eaf80d323451f        x
 # From https://lists.x.org/archives/xorg-announce/2015-October/002650.html
 sha256 0c4b45c116a812a996eb432d8508cf26c2ec8c3916ff2a50781796882f8d6457        xorg-server-1.17.4.tar.bz2
 # From https://lists.freedesktop.org/archives/xorg/2017-March/058662.html
-sha256 8f93b98f1ac9fbd87515bfe329a069b48bbec98e5329584ab5fbf759a0953b8d        xorg-server-1.19.3.tar.bz2
+sha256 677a8166e03474719238dfe396ce673c4234735464d6dadf2959b600d20e5a98        xorg-server-1.19.3.tar.bz2
-- 
2.9.3
