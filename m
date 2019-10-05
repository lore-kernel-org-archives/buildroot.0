From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 5 Oct 2019 23:46:13 +0200
Subject: [Buildroot] [git commit] package/libgphoto2: bump to version 2.5.23
Message-ID: <20191005214213.2B4C28910C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6675b3e584a52b24d1ec768a930ea9f2b0a0de52
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libgphoto2/libgphoto2.hash | 8 ++++----
 package/libgphoto2/libgphoto2.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/libgphoto2/libgphoto2.hash b/package/libgphoto2/libgphoto2.hash
index e0590df89b..0d965da0f1 100644
--- a/package/libgphoto2/libgphoto2.hash
+++ b/package/libgphoto2/libgphoto2.hash
@@ -1,7 +1,7 @@
-# https://sourceforge.net/projects/gphoto/files/libgphoto/2.5.17/
-md5 ae78e7a7936a6962c3a22b256bee1869 libgphoto2-2.5.17.tar.bz2
-sha1 b55167bbb73518c5b7f67f90e619c46d05005c7d libgphoto2-2.5.17.tar.bz2
+# https://sourceforge.net/projects/gphoto/files/libgphoto/2.5.23/
+md5 bf052ce815e607dc781c5b0f3c5ca5c0 libgphoto2-2.5.23.tar.bz2
+sha1 01f91d2b5d2aef7e80ab846fea4d5eb5cc67ed79 libgphoto2-2.5.23.tar.bz2
 
 # Locally calculated hash
-sha256 417464f0a313fa937e8a71cdf18a371cf01e750830195cd63ae31da0d092b555 libgphoto2-2.5.17.tar.bz2
+sha256 d8af23364aa40fd8607f7e073df74e7ace05582f4ba13f1724d12d3c97e8852d libgphoto2-2.5.23.tar.bz2
 sha256 ebc385a0b1d477be5177ed6d9129557aa59a3ad0f26ebe7dd97ee942a0fb68ee COPYING
diff --git a/package/libgphoto2/libgphoto2.mk b/package/libgphoto2/libgphoto2.mk
index 2828fcb36f..63e6a8775f 100644
--- a/package/libgphoto2/libgphoto2.mk
+++ b/package/libgphoto2/libgphoto2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGPHOTO2_VERSION = 2.5.17
+LIBGPHOTO2_VERSION = 2.5.23
 LIBGPHOTO2_SOURCE = libgphoto2-$(LIBGPHOTO2_VERSION).tar.bz2
 # Project is maintained on github but github tarball doesn't have
 # configure, so use tarballs from SourceForge
