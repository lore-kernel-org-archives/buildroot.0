From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 20 Jul 2019 10:19:36 +0200
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xapp_xinput: bump version to
 1.6.3
Message-ID: <20190720081936.24939-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added all hashes provided by upstream, added license hash.
Updated _SITE according to release notes.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xapp_xinput/xapp_xinput.hash | 9 +++++++--
 package/x11r7/xapp_xinput/xapp_xinput.mk   | 4 ++--
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xapp_xinput/xapp_xinput.hash b/package/x11r7/xapp_xinput/xapp_xinput.hash
index 724b2e2637..456a58c702 100644
--- a/package/x11r7/xapp_xinput/xapp_xinput.hash
+++ b/package/x11r7/xapp_xinput/xapp_xinput.hash
@@ -1,2 +1,7 @@
-# From http://lists.x.org/archives/xorg-announce/2015-October/002643.html
-sha256	3694d29b4180952fbf13c6d4e59541310cbb11eef5bf888ff3d8b7f4e3aee5c4		xinput-1.6.2.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2019-July/003013.html
+md5 ac6b7432726008b2f50eba82b0e2dbe4  xinput-1.6.3.tar.bz2
+sha1 92ea7dfb3d8465921b0dca85da7d5b01cedae6c8  xinput-1.6.3.tar.bz2
+sha256 35a281dd3b9b22ea85e39869bb7670ba78955d5fec17c6ef7165d61e5aeb66ed  xinput-1.6.3.tar.bz2
+sha512 cb2fef866ac5a71dbca3e23b4ecadaca38e65dc1b30f8bb024bad92486554fafc472706619a1af04c746a4f53ce6aea827d694b9f4f0c7d0d46bb1da81984076  xinput-1.6.3.tar.bz2
+# Locally computed
+sha256 bbd35c7a8e8c5cb073935e84b29b0c53f7131a4ef1ce737dc2be5616941e07e1  COPYING
diff --git a/package/x11r7/xapp_xinput/xapp_xinput.mk b/package/x11r7/xapp_xinput/xapp_xinput.mk
index aaa7a80818..0d6c0deffe 100644
--- a/package/x11r7/xapp_xinput/xapp_xinput.mk
+++ b/package/x11r7/xapp_xinput/xapp_xinput.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XAPP_XINPUT_VERSION = 1.6.2
+XAPP_XINPUT_VERSION = 1.6.3
 XAPP_XINPUT_SOURCE = xinput-$(XAPP_XINPUT_VERSION).tar.bz2
-XAPP_XINPUT_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XINPUT_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_XINPUT_LICENSE = MIT
 XAPP_XINPUT_LICENSE_FILES = COPYING
 XAPP_XINPUT_DEPENDENCIES = xlib_libX11 xlib_libXi xlib_libXrandr xlib_libXinerama
-- 
2.20.1
