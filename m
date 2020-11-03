From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 3 Nov 2020 22:59:34 +0100
Subject: [Buildroot] [git commit] imlib2: Bump to version 1.6.1
Message-ID: <20201103214703.C4AE48050F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=23a79ddb45ed150cc36ddd3e16a0b5543b0342ad
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/imlib2/imlib2.hash | 6 +++---
 package/imlib2/imlib2.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/imlib2/imlib2.hash b/package/imlib2/imlib2.hash
index c52ce9d2f4..7cfb674906 100644
--- a/package/imlib2/imlib2.hash
+++ b/package/imlib2/imlib2.hash
@@ -1,8 +1,8 @@
 # From https://sourceforge.net/projects/enlightenment/files/imlib2-src/1.5.1/
-md5 390aa207693e051bb692f2db650c694b  imlib2-1.5.1.tar.bz2
-sha1 3e97e7157380f0cfbdf4f3c950a7a00bdfa6072c  imlib2-1.5.1.tar.bz2
+md5 da6a0b39bc3333f1833c791d96ed75a5  imlib2_loaders-1.6.1.tar.bz2
+sha1 29bc3c8d75cc8fb3bbd5d61e8ab29940d0943da8  imlib2_loaders-1.6.1.tar.bz2
 
 # Locally computed
-sha256 fa4e57452b8843f4a70f70fd435c746ae2ace813250f8c65f977db5d7914baae  imlib2-1.5.1.tar.bz2
+sha256 4d393a77e13da883c8ee2da3b029da3570210fe37d000c9ac33d9fce751b166d  imlib2-1.6.1.tar.bz2
 sha256 fb70339dd33a77b6213c7ae067fccf93d04af44ff3f937c61f8863f7970e73f6  COPYING
 sha256 8c9a2e92ed4937e2d30c2ea95439c36ed3002fc47e34efee43455a460fee8ef5  COPYING-PLAIN
diff --git a/package/imlib2/imlib2.mk b/package/imlib2/imlib2.mk
index 1c2e924d50..a684ec5b51 100644
--- a/package/imlib2/imlib2.mk
+++ b/package/imlib2/imlib2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMLIB2_VERSION = 1.5.1
+IMLIB2_VERSION = 1.6.1
 IMLIB2_SOURCE = imlib2-$(IMLIB2_VERSION).tar.bz2
 IMLIB2_SITE = http://downloads.sourceforge.net/project/enlightenment/imlib2-src/$(IMLIB2_VERSION)
 IMLIB2_LICENSE = Imlib2
