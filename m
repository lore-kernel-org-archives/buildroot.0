From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 9 May 2020 13:45:03 +0200
Subject: [Buildroot] [git commit] package/mbuffer: bump to version 20200505
Message-ID: <20200509113557.EC82B90F56@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=692e63caf25afd242d141862f40fc4d6c91a8c34
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This bump will fix a build failure with gcc 4.8

Fixes:
 - http://autobuild.buildroot.org/results/1a7fe7ac8cbe9997bc5d1e9ade24bc2ee6ac6abe

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mbuffer/mbuffer.hash | 4 ++--
 package/mbuffer/mbuffer.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mbuffer/mbuffer.hash b/package/mbuffer/mbuffer.hash
index 105fe29fe7..688ada6900 100644
--- a/package/mbuffer/mbuffer.hash
+++ b/package/mbuffer/mbuffer.hash
@@ -1,8 +1,8 @@
 # From http://www.maier-komor.de/mbuffer.html
-md5  e4acaa1e6a9a879e7394f04e02e1ae83  mbuffer-20191016.tgz
+md5  df39047654456f260665d66711cabcc5  mbuffer-20200505.tgz
 
 # Locally computed after checking signature upstream
-sha256  8dc210454765c18901074bc16e126c655135a486e73d69855caf74a157ddbe17  mbuffer-20191016.tgz
+sha256  cc046183149e51814c23b9f83fd748cc1625a88ee128651ea500aa7bd5f01f0b  mbuffer-20200505.tgz
 
 # Hash for license file
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE
diff --git a/package/mbuffer/mbuffer.mk b/package/mbuffer/mbuffer.mk
index f87b2b114f..6aaf29c9ca 100644
--- a/package/mbuffer/mbuffer.mk
+++ b/package/mbuffer/mbuffer.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MBUFFER_VERSION = 20191016
+MBUFFER_VERSION = 20200505
 MBUFFER_SOURCE = mbuffer-$(MBUFFER_VERSION).tgz
 MBUFFER_SITE = http://www.maier-komor.de/software/mbuffer
 MBUFFER_LICENSE = GPL-3.0+
