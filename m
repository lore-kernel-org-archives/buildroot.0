From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 20 Mar 2015 14:02:00 +0100
Subject: [Buildroot] [git commit] package: normalize separator size to 80
Message-ID: <20150320130209.529487FC98@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=76c02c6b46950fa475b925e1b5eda3c43ee69aaa
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/dvdauthor/dvdauthor.mk     |    4 ++--
 package/memtest86/memtest86.mk     |    4 ++--
 package/mjpegtools/mjpegtools.mk   |    4 ++--
 package/mono/mono.mk               |    4 ++--
 package/monolite/monolite.mk       |    4 ++--
 package/tinyalsa/tinyalsa.mk       |    4 ++--
 package/x11r7/libepoxy/libepoxy.mk |    2 +-
 package/x264/x264.mk               |    4 ++--
 package/xorriso/xorriso.mk         |    4 ++--
 9 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/package/dvdauthor/dvdauthor.mk b/package/dvdauthor/dvdauthor.mk
index 68cce4f..be006f1 100644
--- a/package/dvdauthor/dvdauthor.mk
+++ b/package/dvdauthor/dvdauthor.mk
@@ -1,8 +1,8 @@
-###############################################################################
+################################################################################
 #
 # dvdauthor
 #
-###############################################################################
+################################################################################
 
 DVDAUTHOR_VERSION = 0.7.1
 DVDAUTHOR_SITE = http://sourceforge.net/projects/dvdauthor/files/dvdauthor/$(DVDAUTHOR_VERSION)
diff --git a/package/memtest86/memtest86.mk b/package/memtest86/memtest86.mk
index eb01d96..ef98f61 100644
--- a/package/memtest86/memtest86.mk
+++ b/package/memtest86/memtest86.mk
@@ -1,8 +1,8 @@
-###############################################################################
+################################################################################
 #
 # memtest86
 #
-###############################################################################
+################################################################################
 
 MEMTEST86_VERSION = 4.20
 MEMTEST86_SOURCE = memtest86+-$(MEMTEST86_VERSION).tar.gz
diff --git a/package/mjpegtools/mjpegtools.mk b/package/mjpegtools/mjpegtools.mk
index 347fa68..76ae968 100644
--- a/package/mjpegtools/mjpegtools.mk
+++ b/package/mjpegtools/mjpegtools.mk
@@ -1,8 +1,8 @@
-###############################################################################
+################################################################################
 #
 # mjpegtools
 #
-###############################################################################
+################################################################################
 
 MJPEGTOOLS_VERSION = 2.1.0
 MJPEGTOOLS_SITE = http://sourceforge.net/projects/mjpeg/files/mjpegtools/$(MJPEGTOOLS_VERSION)
diff --git a/package/mono/mono.mk b/package/mono/mono.mk
index 65cd973..c9335ef 100644
--- a/package/mono/mono.mk
+++ b/package/mono/mono.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # mono
 #
-#############################################################
+################################################################################
 
 MONO_VERSION = 3.12.0
 MONO_SITE = http://download.mono-project.com/sources/mono
diff --git a/package/monolite/monolite.mk b/package/monolite/monolite.mk
index ddc2e92..b3c7553 100644
--- a/package/monolite/monolite.mk
+++ b/package/monolite/monolite.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # monolite
 #
-#############################################################
+################################################################################
 
 MONOLITE_VERSION = 111
 MONOLITE_SITE = http://storage.bos.xamarin.com/mono-dist-master/latest
diff --git a/package/tinyalsa/tinyalsa.mk b/package/tinyalsa/tinyalsa.mk
index a3dcc9a..e470b47 100644
--- a/package/tinyalsa/tinyalsa.mk
+++ b/package/tinyalsa/tinyalsa.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # tinyalsa
 #
-#############################################################
+################################################################################
 
 TINYALSA_VERSION = f2a7b6d3d81bd337a540d56704b4aaa7bdb046fe
 TINYALSA_SITE = $(call github,tinyalsa,tinyalsa,$(TINYALSA_VERSION))
diff --git a/package/x11r7/libepoxy/libepoxy.mk b/package/x11r7/libepoxy/libepoxy.mk
index 9858cfe..d908893 100644
--- a/package/x11r7/libepoxy/libepoxy.mk
+++ b/package/x11r7/libepoxy/libepoxy.mk
@@ -2,7 +2,7 @@
 #
 # libepoxy
 #
-#################################################################################
+################################################################################
 
 LIBEPOXY_VERSION = v1.2
 LIBEPOXY_SITE = $(call github,anholt,libepoxy,$(LIBEPOXY_VERSION))
diff --git a/package/x264/x264.mk b/package/x264/x264.mk
index 1e198bc..9968fbe 100644
--- a/package/x264/x264.mk
+++ b/package/x264/x264.mk
@@ -1,8 +1,8 @@
-###############################################################
+################################################################################
 #
 # x264
 #
-###############################################################
+################################################################################
 
 X264_VERSION = 20140930-2245-stable
 X264_SOURCE = x264-snapshot-$(X264_VERSION).tar.bz2
diff --git a/package/xorriso/xorriso.mk b/package/xorriso/xorriso.mk
index 3c068f7..5826340 100644
--- a/package/xorriso/xorriso.mk
+++ b/package/xorriso/xorriso.mk
@@ -1,8 +1,8 @@
-###############################################################################
+################################################################################
 #
 # xorriso
 #
-###############################################################################
+################################################################################
 
 XORRISO_VERSION = 1.3.8
 XORRISO_SITE = $(BR2_GNU_MIRROR)/xorriso
