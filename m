From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Sep 2015 13:56:50 +0200
Subject: [Buildroot] [git commit] package/libdrm: bump to version 2.4.65
Message-ID: <20150919115740.22D05819C2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ffeffa6d165033f2d6b9931890c266ee6adc2a43
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libdrm/libdrm.hash |    4 ++--
 package/libdrm/libdrm.mk   |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libdrm/libdrm.hash b/package/libdrm/libdrm.hash
index c67b2e5..95dcd7a 100644
--- a/package/libdrm/libdrm.hash
+++ b/package/libdrm/libdrm.hash
@@ -1,2 +1,2 @@
-# From http://lists.freedesktop.org/archives/dri-devel/2015-August/088677.html
-sha256	b60786fe7d6e42adb3966ce1a658f63fec528d537396381cbda93bcc99a934b6	libdrm-2.4.64.tar.bz2
+# From http://lists.freedesktop.org/archives/dri-devel/2015-September/090394.html
+sha256	71960ac8bde7d710992b1bc8879935e8300a870c36bd06f22412d0447e3d96c4	libdrm-2.4.65.tar.bz2
diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
index b11d686..01fa8d5 100644
--- a/package/libdrm/libdrm.mk
+++ b/package/libdrm/libdrm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBDRM_VERSION = 2.4.64
+LIBDRM_VERSION = 2.4.65
 LIBDRM_SOURCE = libdrm-$(LIBDRM_VERSION).tar.bz2
 LIBDRM_SITE = http://dri.freedesktop.org/libdrm
 LIBDRM_LICENSE = MIT
