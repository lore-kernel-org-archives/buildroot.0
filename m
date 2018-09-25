From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 25 Sep 2018 22:23:29 +0200
Subject: [Buildroot] [git commit] imlib2: bump to version 1.5.1
Message-ID: <20180925202259.6FA9D88D72@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8fd99cad1fe72124682ba272a4677f3b8c88855f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Acked-by: Petr Vorel <petr.vorel@gmail.com>
Tested-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/imlib2/imlib2.hash | 7 ++++---
 package/imlib2/imlib2.mk   | 2 +-
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/imlib2/imlib2.hash b/package/imlib2/imlib2.hash
index 62ebac32ea..c52ce9d2f4 100644
--- a/package/imlib2/imlib2.hash
+++ b/package/imlib2/imlib2.hash
@@ -1,7 +1,8 @@
-# From https://sourceforge.net/projects/enlightenment/files/imlib2-src/1.4.10/
-md5 a0de8524592bbd9f24fcc6cb8352137c  imlib2-1.4.10.tar.bz2
-sha1 664df65c6265a2825d685d2f3a4f0d072eb626ac  imlib2-1.4.10.tar.bz2
+# From https://sourceforge.net/projects/enlightenment/files/imlib2-src/1.5.1/
+md5 390aa207693e051bb692f2db650c694b  imlib2-1.5.1.tar.bz2
+sha1 3e97e7157380f0cfbdf4f3c950a7a00bdfa6072c  imlib2-1.5.1.tar.bz2
 
 # Locally computed
+sha256 fa4e57452b8843f4a70f70fd435c746ae2ace813250f8c65f977db5d7914baae  imlib2-1.5.1.tar.bz2
 sha256 fb70339dd33a77b6213c7ae067fccf93d04af44ff3f937c61f8863f7970e73f6  COPYING
 sha256 8c9a2e92ed4937e2d30c2ea95439c36ed3002fc47e34efee43455a460fee8ef5  COPYING-PLAIN
diff --git a/package/imlib2/imlib2.mk b/package/imlib2/imlib2.mk
index 21a96cb1ca..1c2e924d50 100644
--- a/package/imlib2/imlib2.mk
+++ b/package/imlib2/imlib2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMLIB2_VERSION = 1.4.10
+IMLIB2_VERSION = 1.5.1
 IMLIB2_SOURCE = imlib2-$(IMLIB2_VERSION).tar.bz2
 IMLIB2_SITE = http://downloads.sourceforge.net/project/enlightenment/imlib2-src/$(IMLIB2_VERSION)
 IMLIB2_LICENSE = Imlib2
