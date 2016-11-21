From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 21 Nov 2016 23:18:33 +0100
Subject: [Buildroot] [git commit branch/next] libgtk2: bump version to
	2.24.31
Message-ID: <20161121221836.D617F81992@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=291388e5455d94363221a48b16feeeb76217506c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libgtk2/libgtk2.hash | 4 ++--
 package/libgtk2/libgtk2.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libgtk2/libgtk2.hash b/package/libgtk2/libgtk2.hash
index 175702f..3388c5c 100644
--- a/package/libgtk2/libgtk2.hash
+++ b/package/libgtk2/libgtk2.hash
@@ -1,2 +1,2 @@
-# From http://ftp.gnome.org/pub/gnome/sources/gtk+/2.24/gtk+-2.24.30.sha256sum
-sha256	0d15cec3b6d55c60eac205b1f3ba81a1ed4eadd9d0f8e7c508bc7065d0c4ca50	gtk+-2.24.30.tar.xz
+# From http://ftp.gnome.org/pub/gnome/sources/gtk+/2.24/gtk+-2.24.31.sha256sum
+sha256 68c1922732c7efc08df4656a5366dcc3afdc8791513400dac276009b40954658  gtk+-2.24.31.tar.xz
diff --git a/package/libgtk2/libgtk2.mk b/package/libgtk2/libgtk2.mk
index 94fa97f..cf8b2f4 100644
--- a/package/libgtk2/libgtk2.mk
+++ b/package/libgtk2/libgtk2.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBGTK2_VERSION_MAJOR = 2.24
-LIBGTK2_VERSION = $(LIBGTK2_VERSION_MAJOR).30
+LIBGTK2_VERSION = $(LIBGTK2_VERSION_MAJOR).31
 LIBGTK2_SOURCE = gtk+-$(LIBGTK2_VERSION).tar.xz
 LIBGTK2_SITE = http://ftp.gnome.org/pub/gnome/sources/gtk+/$(LIBGTK2_VERSION_MAJOR)
 LIBGTK2_INSTALL_STAGING = YES
