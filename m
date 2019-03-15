From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 15 Mar 2019 21:33:09 +0100
Subject: [Buildroot] [git commit] package/x11r7/xapp_xfsinfo: bump version
 to 1.0.6
Message-ID: <20190315203120.12A9B83480@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=db6c223f7fdbeb756dd15ed94a2cb50f25e1a6d5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Added all hashes provided by upstream and license hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/x11r7/xapp_xfsinfo/xapp_xfsinfo.hash | 9 +++++++--
 package/x11r7/xapp_xfsinfo/xapp_xfsinfo.mk   | 2 +-
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xapp_xfsinfo/xapp_xfsinfo.hash b/package/x11r7/xapp_xfsinfo/xapp_xfsinfo.hash
index b1bcc0bc8a..67480a51aa 100644
--- a/package/x11r7/xapp_xfsinfo/xapp_xfsinfo.hash
+++ b/package/x11r7/xapp_xfsinfo/xapp_xfsinfo.hash
@@ -1,2 +1,7 @@
-# From http://lists.x.org/archives/xorg-announce/2014-December/002512.html
-sha256	d38f4b6db4038f52ba1a09123ef497993194288454c0c13d16debe246f120d8f	xfsinfo-1.0.5.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2019-February/002949.html
+md5 0060d6151427d9e570e54fc52a88e7d7  xfsinfo-1.0.6.tar.bz2
+sha1 cbfe7470179f1ab5eecf992226dc1b28902c6b4c  xfsinfo-1.0.6.tar.bz2
+sha256 8a3e8b9b9ae6ed571989d04e1846d39b9043e28f7623b500ebe1d47762c9b1d6  xfsinfo-1.0.6.tar.bz2
+sha512 901fc3817d7c95f2ba75ed0c51de91abd8efa67bbb93ad6b7d66e56a2f721af9db364e92f9ef2e719835fd48e934a5ea7402e5565c0ccd9b6b82633e869dc57b  xfsinfo-1.0.6.tar.bz2
+# Locally computed
+sha256 bae01fa08f30f21f9cfb75e8339d081b34e5e03d12677177f85a55b0ca41d0db  COPYING
diff --git a/package/x11r7/xapp_xfsinfo/xapp_xfsinfo.mk b/package/x11r7/xapp_xfsinfo/xapp_xfsinfo.mk
index 38d01e4949..bef9787ffe 100644
--- a/package/x11r7/xapp_xfsinfo/xapp_xfsinfo.mk
+++ b/package/x11r7/xapp_xfsinfo/xapp_xfsinfo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XFSINFO_VERSION = 1.0.5
+XAPP_XFSINFO_VERSION = 1.0.6
 XAPP_XFSINFO_SOURCE = xfsinfo-$(XAPP_XFSINFO_VERSION).tar.bz2
 XAPP_XFSINFO_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XFSINFO_LICENSE = MIT
