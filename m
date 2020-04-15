From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 15 Apr 2020 21:41:29 +0200
Subject: [Buildroot] [git commit] package/bitstream: bump version to 1.5
Message-ID: <20200415193448.8C17D8ECD1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=56d740b0dd75226b139240f04d76dd0c56bd6c3d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://mailman.videolan.org/pipermail/bitstream-devel/2018-November/000116.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/bitstream/bitstream.hash | 8 ++++----
 package/bitstream/bitstream.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/bitstream/bitstream.hash b/package/bitstream/bitstream.hash
index 89da7c6fd0..0d2e5a1f1a 100644
--- a/package/bitstream/bitstream.hash
+++ b/package/bitstream/bitstream.hash
@@ -1,6 +1,6 @@
-# From https://get.videolan.org/bitstream/1.4/bitstream-1.4.tar.bz2.md5
-md5 dfb1449194250b2d364d54b5bbac858d  bitstream-1.4.tar.bz2
-# From https://get.videolan.org/bitstream/1.4/bitstream-1.4.tar.bz2.sha256
-sha256 b2484940d3b8733bec9dd1ec1731de428261dff31c9f95874264be9dc9ce786b  bitstream-1.4.tar.bz2
+# From https://get.videolan.org/bitstream/1.5/bitstream-1.5.tar.bz2.md5
+md5 34630d13332fd1575bcc8531b0a596be  bitstream-1.5.tar.bz2
+# From https://get.videolan.org/bitstream/1.5/bitstream-1.5.tar.bz2.sha256
+sha256 45fc5a5a6e4537a69fa8440821e87b76252135180a3070c631b0b36ce0a3b90a  bitstream-1.5.tar.bz2
 # Locally computed
 sha256 9644a812f9a8377a59acb7092a36ce8882a39743425d9171a8fb84637e2f6e04  COPYING
diff --git a/package/bitstream/bitstream.mk b/package/bitstream/bitstream.mk
index 1746d1386c..12124a63d3 100644
--- a/package/bitstream/bitstream.mk
+++ b/package/bitstream/bitstream.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BITSTREAM_VERSION = 1.4
+BITSTREAM_VERSION = 1.5
 BITSTREAM_SOURCE = bitstream-$(BITSTREAM_VERSION).tar.bz2
 BITSTREAM_SITE = https://get.videolan.org/bitstream/$(BITSTREAM_VERSION)
 BITSTREAM_LICENSE = MIT
