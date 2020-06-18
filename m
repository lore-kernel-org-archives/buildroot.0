From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 18 Jun 2020 23:36:19 +0200
Subject: [Buildroot] [git commit] package/qwt: bump version to 6.1.5
Message-ID: <20200619094524.B02F581403@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1f62b4de22533d658ea4a5dcd4a93b0b6cf2ff0a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix:
- http://autobuild.buildroot.net/results/27ac3c09048744189236bd67aa643163d0d01ad5/
- http://autobuild.buildroot.net/results/9693ad79e4c23c9c0324df02a4d57c662b82fbce/
- http://autobuild.buildroot.net/results/e8aafa2a1a5fa4e207d2e8bb8c9570789a8ccaa7/

Respect hash rules

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qwt/qwt.hash | 10 +++++-----
 package/qwt/qwt.mk   |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/qwt/qwt.hash b/package/qwt/qwt.hash
index 95e910e5e4..5e9a9a3d7a 100644
--- a/package/qwt/qwt.hash
+++ b/package/qwt/qwt.hash
@@ -1,7 +1,7 @@
-# From https://sourceforge.net/projects/qwt/files/qwt/6.1.4/
-sha1 a1028cb0a33322920266fb183869023b8ed30394  qwt-6.1.4.tar.bz2
-md5  4fb1852f694420e3ab9c583526edecc5          qwt-6.1.4.tar.bz2
+# From https://sourceforge.net/projects/qwt/files/qwt/6.1.5/
+sha1  07c71427f1f4bbd0354b3a98965943ce2f220766  qwt-6.1.5.tar.bz2
+md5  d65582f99312796ed42c3be3208ed3db  qwt-6.1.5.tar.bz2
 
 # Locally computed
-sha256 1529215329e51fc562e0009505a838f427919a18b362afff441f035b2d9b5bd9  qwt-6.1.4.tar.bz2
-sha256 d8737db330e1eeb439962e11654ab7f1aece3561d9415454a8c538643824ede6  COPYING
+sha256  4076de63ec2b5e84379ddfebf27c7b29b8dc9074f3db7e2ca61d11a1d8adc041  qwt-6.1.5.tar.bz2
+sha256  d8737db330e1eeb439962e11654ab7f1aece3561d9415454a8c538643824ede6  COPYING
diff --git a/package/qwt/qwt.mk b/package/qwt/qwt.mk
index f09304d0e4..95a041e97a 100644
--- a/package/qwt/qwt.mk
+++ b/package/qwt/qwt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QWT_VERSION = 6.1.4
+QWT_VERSION = 6.1.5
 QWT_SOURCE = qwt-$(QWT_VERSION).tar.bz2
 QWT_SITE = http://downloads.sourceforge.net/project/qwt/qwt/$(QWT_VERSION)
 QWT_INSTALL_STAGING = YES
