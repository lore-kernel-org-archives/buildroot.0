From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 4 Oct 2016 14:42:48 +0200
Subject: [Buildroot] [git commit] package/libdrm: bump version to 2.4.71
Message-ID: <20161004124435.3D842821D6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ed83bf1c6a32ed999422c68fd1ef79128b0911b3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libdrm/libdrm.hash | 4 ++--
 package/libdrm/libdrm.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libdrm/libdrm.hash b/package/libdrm/libdrm.hash
index c205780..bda054e 100644
--- a/package/libdrm/libdrm.hash
+++ b/package/libdrm/libdrm.hash
@@ -1,2 +1,2 @@
-# From https://lists.freedesktop.org/archives/dri-devel/2016-July/113899.html
-sha256	b17d4b39ed97ca0e4cffa0db06ff609e617bac94646ec38e8e0579d530540e7b	libdrm-2.4.70.tar.bz2
+# From https://lists.freedesktop.org/archives/dri-devel/2016-October/119998.html
+sha256	c66287ddeee5f46ea8f8880b94b80acb3bbc33ba6321d17767eef145046df9b8	libdrm-2.4.71.tar.bz2
diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
index d8d7744..d06f3ec 100644
--- a/package/libdrm/libdrm.mk
+++ b/package/libdrm/libdrm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBDRM_VERSION = 2.4.70
+LIBDRM_VERSION = 2.4.71
 LIBDRM_SOURCE = libdrm-$(LIBDRM_VERSION).tar.bz2
 LIBDRM_SITE = http://dri.freedesktop.org/libdrm
 LIBDRM_LICENSE = MIT
