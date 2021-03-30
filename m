From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 30 Mar 2021 23:23:03 +0200
Subject: [Buildroot] [git commit] package/qwt: bump version to 6.1.6
Message-ID: <20210330205827.BECED8A8F0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2d42cf256dd8e336ea06606ffd8b360a924eda29
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog ([1]):

  1) Maintenance
    - QwtPlotLayout::activate: avoid compiler issues with Qt 5.15
    - QwtPointPolar: missing copy constructor added

[1] https://sourceforge.net/p/qwt/code/HEAD/tree/tags/qwt-6.1.6/CHANGES-6.1

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qwt/qwt.hash | 8 ++++----
 package/qwt/qwt.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/qwt/qwt.hash b/package/qwt/qwt.hash
index 5e9a9a3d7a..d4fd210cbd 100644
--- a/package/qwt/qwt.hash
+++ b/package/qwt/qwt.hash
@@ -1,7 +1,7 @@
-# From https://sourceforge.net/projects/qwt/files/qwt/6.1.5/
-sha1  07c71427f1f4bbd0354b3a98965943ce2f220766  qwt-6.1.5.tar.bz2
-md5  d65582f99312796ed42c3be3208ed3db  qwt-6.1.5.tar.bz2
+# From https://sourceforge.net/projects/qwt/files/qwt/6.1.6
+md5  cc71be5d6c33c2fc19ae8082ccdd3e83  qwt-6.1.6.tar.bz2
+sha1  b1f17a86c9b1b0790a0c0067ef69fb6277efac79  qwt-6.1.6.tar.bz2
 
 # Locally computed
-sha256  4076de63ec2b5e84379ddfebf27c7b29b8dc9074f3db7e2ca61d11a1d8adc041  qwt-6.1.5.tar.bz2
+sha256  99460d31c115ee4117b0175d885f47c2c590d784206f09815dc058fbe5ede1f6  qwt-6.1.6.tar.bz2
 sha256  d8737db330e1eeb439962e11654ab7f1aece3561d9415454a8c538643824ede6  COPYING
diff --git a/package/qwt/qwt.mk b/package/qwt/qwt.mk
index 95a041e97a..9f0b78655f 100644
--- a/package/qwt/qwt.mk
+++ b/package/qwt/qwt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QWT_VERSION = 6.1.5
+QWT_VERSION = 6.1.6
 QWT_SOURCE = qwt-$(QWT_VERSION).tar.bz2
 QWT_SITE = http://downloads.sourceforge.net/project/qwt/qwt/$(QWT_VERSION)
 QWT_INSTALL_STAGING = YES
