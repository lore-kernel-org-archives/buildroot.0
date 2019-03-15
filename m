From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 15 Mar 2019 21:33:09 +0100
Subject: [Buildroot] [git commit] package/x11r7/xapp_xfd: bump version to
 1.1.3
Message-ID: <20190315203120.0BA5383480@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=19230bbcbcd9e0aaecac55deedf82218783247c5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Added all hashes provided by upstream and license hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/x11r7/xapp_xfd/xapp_xfd.hash | 9 +++++++--
 package/x11r7/xapp_xfd/xapp_xfd.mk   | 2 +-
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xapp_xfd/xapp_xfd.hash b/package/x11r7/xapp_xfd/xapp_xfd.hash
index 7b6824bec3..d1f5c45432 100644
--- a/package/x11r7/xapp_xfd/xapp_xfd.hash
+++ b/package/x11r7/xapp_xfd/xapp_xfd.hash
@@ -1,2 +1,7 @@
-# From http://lists.x.org/archives/xorg-announce/2013-July/002268.html
-sha256	c1a32222fbb891e46f9a82ebab005bc5e54ce006a2586195ec9ea7ab308e2759	xfd-1.1.2.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2019-March/002968.html
+md5 f9c9f2b101a96d4b50c2a4ab9b5ab5b1  xfd-1.1.3.tar.bz2
+sha1 ca6dbe2027b205992a52c6bb717a43508f12a8c4  xfd-1.1.3.tar.bz2
+sha256 192f938ba5830e84cc807d8ead2ad9655b43eaed6500c830f3e083aad10ed958  xfd-1.1.3.tar.bz2
+sha512 68e2d4ce5e24215353b6f3231191d69639c4dd90a703e03ccf152bbfe4012da071c387ba289f918fb0336a3be9ee49dc05cbec7273fa85f5e476ead7e10795f0  xfd-1.1.3.tar.bz2
+# Locally computed
+sha256 57ae10f24fc110dafb3b8d7735cf26b1905ff74e716745b2520e4ccd7751095c  COPYING
diff --git a/package/x11r7/xapp_xfd/xapp_xfd.mk b/package/x11r7/xapp_xfd/xapp_xfd.mk
index 06c9c83e4a..84b4a77770 100644
--- a/package/x11r7/xapp_xfd/xapp_xfd.mk
+++ b/package/x11r7/xapp_xfd/xapp_xfd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XFD_VERSION = 1.1.2
+XAPP_XFD_VERSION = 1.1.3
 XAPP_XFD_SOURCE = xfd-$(XAPP_XFD_VERSION).tar.bz2
 XAPP_XFD_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XFD_LICENSE = MIT
