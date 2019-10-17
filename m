From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 17 Oct 2019 08:05:41 +0200
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xdriver_xf86-video-ati: bump
 version to 19.1.0
Message-ID: <20191017060541.4996-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../xdriver_xf86-video-ati/xdriver_xf86-video-ati.hash | 10 +++++-----
 .../xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk   |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.hash b/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.hash
index 34d9ded346..c6f8c53ef9 100644
--- a/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.hash
+++ b/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.hash
@@ -1,7 +1,7 @@
-# From https://lists.x.org/archives/xorg-announce/2019-March/002986.html
-md5 47eccf71823206ade9629cba69de7ef6  xf86-video-ati-19.0.1.tar.bz2
-sha1 e8899c2d237381d9278429a1427e02fcba1d5174  xf86-video-ati-19.0.1.tar.bz2
-sha256 5cb6015d8664546ad1311bc9c363d7bc41ebf60e7046ceb44dd38e5b707961b0  xf86-video-ati-19.0.1.tar.bz2
-sha512 e04c5395e3a49d81b8f7a4b0e11fe8c9ebd17af056a4eab4541873796dce05b103c93fb185f3a00873010df0655cd7311e6d27e177aeb7345c4c8017bbd1eb17  xf86-video-ati-19.0.1.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2019-October/003027.html
+md5 6e49d3c2839582af415ceded76e626e6  xf86-video-ati-19.1.0.tar.bz2
+sha1 aea1d11c05531b03f2eb67c6785cddf6d7f30e5f  xf86-video-ati-19.1.0.tar.bz2
+sha256 659f5a1629eea5f5334d9b39b18e6807a63aa1efa33c1236d9cc53acbb223c49  xf86-video-ati-19.1.0.tar.bz2
+sha512 73a81f6c492daf2e89067fb52b3033dc0fe6841f109627ddca1aee54a45a738c8c134443753a2a2aaa2c131e1d560057ebc76351ff2304c16407df3ff568fcd6  xf86-video-ati-19.1.0.tar.bz2
 # Locally computed
 sha256 58847c8e97190c401afa84b3f0b8b147379c876a184e99af2cb51bfd40ac8936  COPYING
diff --git a/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk b/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk
index c9344f8596..f7aeba8ba6 100644
--- a/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk
+++ b/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_ATI_VERSION = 19.0.1
+XDRIVER_XF86_VIDEO_ATI_VERSION = 19.1.0
 XDRIVER_XF86_VIDEO_ATI_SOURCE = xf86-video-ati-$(XDRIVER_XF86_VIDEO_ATI_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_ATI_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_ATI_LICENSE = MIT
-- 
2.20.1
