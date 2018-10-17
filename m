From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 17 Oct 2018 21:45:57 +0200
Subject: [Buildroot] [git commit] package/libdrm: bump version to 2.4.96
Message-ID: <20181017194429.6FA58811CB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=53671131abfa3e4cbec46baed9668bc9fd4c335c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libdrm/libdrm.hash | 10 +++++-----
 package/libdrm/libdrm.mk   |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/libdrm/libdrm.hash b/package/libdrm/libdrm.hash
index ac59dac4f5..78b3ef75ac 100644
--- a/package/libdrm/libdrm.hash
+++ b/package/libdrm/libdrm.hash
@@ -1,5 +1,5 @@
-# From https://lists.freedesktop.org/archives/dri-devel/2018-October/191989.html
-md5 41b9ed196a27f5dc7fb88412b704e9fd  libdrm-2.4.95.tar.bz2
-sha1 fd7c1002001ef1aa1b6094eb2b78f1031e233bb3  libdrm-2.4.95.tar.bz2
-sha256 ef772a51b4bed97a2c243194d9a98da97319e0dbdf800d07773b025aacc895c6  libdrm-2.4.95.tar.bz2
-sha512 9bf8178a871bb059471f58f236c8362245e08877b732b2c8366d402e8066c9a74707e4ec3bf680fca12303f1319875edc98ae8e31bc9826f172798f47197e631  libdrm-2.4.95.tar.bz2
+# From https://lists.freedesktop.org/archives/dri-devel/2018-October/193244.html
+md5 f296d87272b1befeada3bb135751ab3d  libdrm-2.4.96.tar.bz2
+sha1 51eb4c248a437b3f200bd1cd84461d3e0b60d71e  libdrm-2.4.96.tar.bz2
+sha256 0d561acf7bb4cc59dc82415100e6c1a44860e8c380e00f9592923e3cd08db393  libdrm-2.4.96.tar.bz2
+sha512 008cb7658d953b44e11fa3cc6e00dfeb3efb59c7fdadd59f7066101aff138acbbc2f2508e9ebe0528340e39dc7693937755d1641816ddde135c10a13e7d81e3b  libdrm-2.4.96.tar.bz2
diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
index e5b693cb11..18ef9cdd2e 100644
--- a/package/libdrm/libdrm.mk
+++ b/package/libdrm/libdrm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBDRM_VERSION = 2.4.95
+LIBDRM_VERSION = 2.4.96
 LIBDRM_SOURCE = libdrm-$(LIBDRM_VERSION).tar.bz2
 LIBDRM_SITE = https://dri.freedesktop.org/libdrm
 LIBDRM_LICENSE = MIT
