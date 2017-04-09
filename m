From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 9 Apr 2017 09:46:38 +0200
Subject: [Buildroot] [git commit] package/libdrm: bump version to 2.4.79
Message-ID: <20170409074642.815DB826DB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4100196152b879194807080e7caf7e88dcd0e39a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libdrm/libdrm.hash | 10 +++++-----
 package/libdrm/libdrm.mk   |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/libdrm/libdrm.hash b/package/libdrm/libdrm.hash
index 82bcc05..d823ac0 100644
--- a/package/libdrm/libdrm.hash
+++ b/package/libdrm/libdrm.hash
@@ -1,5 +1,5 @@
-# From https://lists.freedesktop.org/archives/dri-devel/2017-April/138416.html
-md5 049ee80ce816cbef7669e7807b2ee816  libdrm-2.4.78.tar.bz2
-sha1 fdf0e8f2951e75d8d230a7960d32f4f3ca6ceb90  libdrm-2.4.78.tar.bz2
-sha256 3dbe2ed3e2ee6ebe8a848195286ef362f66675a7102958e42906d734aa6925d8  libdrm-2.4.78.tar.bz2
-sha512 f5010583322a4742bbbb55d5d7083f11366be0f11ae51a6830a9ce14c1cb7e2a8163f92db15d2c90a464a5cfce9d3bfa4e6f9739bcb382fe7007eae1b288ee85  libdrm-2.4.78.tar.bz2
+# From https://lists.freedesktop.org/archives/dri-devel/2017-April/138561.html
+md5 84ba6e8e6c97d2684938eb949e6dfdf8  libdrm-2.4.79.tar.bz2
+sha1 0dd194538c90619146a83a65f2074564e1a14d55  libdrm-2.4.79.tar.bz2
+sha256 c6aaf319293bce38023e9a637471b0f45c93c807d2a279060d741fc7a2e5b197  libdrm-2.4.79.tar.bz2
+sha512 62d6dbdf5e4e73e948fcb128a3ee76c88843d0aabf0af5751526829e9b95cff151a121af88ba9625acc7f5bc4ecfa71f9a3762005d5da76cff1d91dfc8ea8ea7  libdrm-2.4.79.tar.bz2
diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
index 2b294fe..ea7c727 100644
--- a/package/libdrm/libdrm.mk
+++ b/package/libdrm/libdrm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBDRM_VERSION = 2.4.78
+LIBDRM_VERSION = 2.4.79
 LIBDRM_SOURCE = libdrm-$(LIBDRM_VERSION).tar.bz2
 LIBDRM_SITE = http://dri.freedesktop.org/libdrm
 LIBDRM_LICENSE = MIT
