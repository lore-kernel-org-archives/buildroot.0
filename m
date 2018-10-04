From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 4 Oct 2018 14:37:03 +0200
Subject: [Buildroot] [git commit] package/bitstream: bump version to 1.4
Message-ID: <20181004132323.71A8B8CA36@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d52e17701d73749fe81495b7c956268362ca0bbd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Added license hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/bitstream/bitstream.hash | 10 ++++++----
 package/bitstream/bitstream.mk   |  2 +-
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/bitstream/bitstream.hash b/package/bitstream/bitstream.hash
index a62f733d86..6a384e302d 100644
--- a/package/bitstream/bitstream.hash
+++ b/package/bitstream/bitstream.hash
@@ -1,4 +1,6 @@
-# From https://get.videolan.org/bitstream/1.2/bitstream-1.2.tar.bz2
-sha256 ccfbb438711606de1fad881b58c8f134e2d82b4d53a88ea48f2d1bcb49ca5ad2  bitstream-1.2.tar.bz2
-# From https://get.videolan.org/bitstream/1.2/bitstream-1.2.tar.bz2.md5
-md5 c4b2dbd84eb5799f1525eb9a4e01dc56  bitstream-1.2.tar.bz2
+# From https://get.videolan.org/bitstream/1.4/bitstream-1.4.tar.bz2.md5
+md5 https://get.videolan.org/bitstream/1.4/bitstream-1.4.tar.bz2.md5
+# From https://get.videolan.org/bitstream/1.4/bitstream-1.4.tar.bz2.sha256
+sha256 b2484940d3b8733bec9dd1ec1731de428261dff31c9f95874264be9dc9ce786b  bitstream-1.4.tar.bz2
+# Locally computed
+sha256 9644a812f9a8377a59acb7092a36ce8882a39743425d9171a8fb84637e2f6e04  COPYING
diff --git a/package/bitstream/bitstream.mk b/package/bitstream/bitstream.mk
index 0b28ffe756..1746d1386c 100644
--- a/package/bitstream/bitstream.mk
+++ b/package/bitstream/bitstream.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BITSTREAM_VERSION = 1.2
+BITSTREAM_VERSION = 1.4
 BITSTREAM_SOURCE = bitstream-$(BITSTREAM_VERSION).tar.bz2
 BITSTREAM_SITE = https://get.videolan.org/bitstream/$(BITSTREAM_VERSION)
 BITSTREAM_LICENSE = MIT
