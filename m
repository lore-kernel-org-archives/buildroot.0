From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 26 Mar 2018 23:18:16 +0200
Subject: [Buildroot] [git commit] libcdio: bump to version 2.0.0
Message-ID: <20180326211821.EB3CF83CC0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=84835f94713ce4e5a6e06c08576276ae0c0ff21f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add license hash

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libcdio/libcdio.hash | 5 ++++-
 package/libcdio/libcdio.mk   | 2 +-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/libcdio/libcdio.hash b/package/libcdio/libcdio.hash
index 35c632a906..2b6f832cbe 100644
--- a/package/libcdio/libcdio.hash
+++ b/package/libcdio/libcdio.hash
@@ -1,2 +1,5 @@
 # Locally calculated after checking signature
-sha256 96e2c903f866ae96f9f5b9048fa32db0921464a2286f5b586c0f02699710025a  libcdio-0.94.tar.gz
+sha256 1b481b5da009bea31db875805665974e2fc568e2b2afa516f4036733657cf958  libcdio-2.0.0.tar.gz
+
+# Hash for license file:
+sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/libcdio/libcdio.mk b/package/libcdio/libcdio.mk
index f0fc33527a..f4a5591722 100644
--- a/package/libcdio/libcdio.mk
+++ b/package/libcdio/libcdio.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCDIO_VERSION = 0.94
+LIBCDIO_VERSION = 2.0.0
 LIBCDIO_SITE = $(BR2_GNU_MIRROR)/libcdio
 LIBCDIO_INSTALL_STAGING = YES
 LIBCDIO_LICENSE = GPL-3.0+
