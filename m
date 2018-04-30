From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 30 Apr 2018 17:38:35 +0200
Subject: [Buildroot] [git commit] libgphoto2: bump to version 2.5.17
Message-ID: <20180430154011.5E0AD8A483@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ce1def52a6896c2f0fc3e5d39201acd2ead9fe66
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libgphoto2/libgphoto2.hash | 9 +++++----
 package/libgphoto2/libgphoto2.mk   | 2 +-
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/libgphoto2/libgphoto2.hash b/package/libgphoto2/libgphoto2.hash
index 1afe275ce3..e0590df89b 100644
--- a/package/libgphoto2/libgphoto2.hash
+++ b/package/libgphoto2/libgphoto2.hash
@@ -1,6 +1,7 @@
-# https://sourceforge.net/projects/gphoto/files/libgphoto/2.5.13/
-md5 73bf5b3d94c8c6f5fad9ea6b5e561843 libgphoto2-2.5.13.tar.bz2
-sha1 cef2d2f1930f8ada16a63aca15683188231a626a libgphoto2-2.5.13.tar.bz2
+# https://sourceforge.net/projects/gphoto/files/libgphoto/2.5.17/
+md5 ae78e7a7936a6962c3a22b256bee1869 libgphoto2-2.5.17.tar.bz2
+sha1 b55167bbb73518c5b7f67f90e619c46d05005c7d libgphoto2-2.5.17.tar.bz2
 
 # Locally calculated hash
-sha256 ceaacbdf187d1cd1aed5336991f46b0100f6960b6c8383f9aeab98f1f64780ef libgphoto2-2.5.13.tar.bz2
+sha256 417464f0a313fa937e8a71cdf18a371cf01e750830195cd63ae31da0d092b555 libgphoto2-2.5.17.tar.bz2
+sha256 ebc385a0b1d477be5177ed6d9129557aa59a3ad0f26ebe7dd97ee942a0fb68ee COPYING
diff --git a/package/libgphoto2/libgphoto2.mk b/package/libgphoto2/libgphoto2.mk
index f6dadf1f45..2828fcb36f 100644
--- a/package/libgphoto2/libgphoto2.mk
+++ b/package/libgphoto2/libgphoto2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGPHOTO2_VERSION = 2.5.13
+LIBGPHOTO2_VERSION = 2.5.17
 LIBGPHOTO2_SOURCE = libgphoto2-$(LIBGPHOTO2_VERSION).tar.bz2
 # Project is maintained on github but github tarball doesn't have
 # configure, so use tarballs from SourceForge
