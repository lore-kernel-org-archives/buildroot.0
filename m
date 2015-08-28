From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 28 Aug 2015 11:28:05 +0200
Subject: [Buildroot] [git commit] package/libdrm: bump to version 2.4.64
Message-ID: <20150901083107.E1AE5801E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c7be6b532032d6728ee912839b1ebd048b0e28ff
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libdrm/libdrm.hash |    4 ++--
 package/libdrm/libdrm.mk   |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libdrm/libdrm.hash b/package/libdrm/libdrm.hash
index 05944c5..c67b2e5 100644
--- a/package/libdrm/libdrm.hash
+++ b/package/libdrm/libdrm.hash
@@ -1,2 +1,2 @@
-# From http://lists.freedesktop.org/archives/dri-devel/2015-June/085375.html
-sha256	906c294bdbe1c94c3ca084305d61a6e5a8367f3b4986e6cc13b1e9b3f75931dc	libdrm-2.4.62.tar.bz2
+# From http://lists.freedesktop.org/archives/dri-devel/2015-August/088677.html
+sha256	b60786fe7d6e42adb3966ce1a658f63fec528d537396381cbda93bcc99a934b6	libdrm-2.4.64.tar.bz2
diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
index 1768214..b11d686 100644
--- a/package/libdrm/libdrm.mk
+++ b/package/libdrm/libdrm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBDRM_VERSION = 2.4.62
+LIBDRM_VERSION = 2.4.64
 LIBDRM_SOURCE = libdrm-$(LIBDRM_VERSION).tar.bz2
 LIBDRM_SITE = http://dri.freedesktop.org/libdrm
 LIBDRM_LICENSE = MIT
