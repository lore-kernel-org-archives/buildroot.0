From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 24 Aug 2017 23:11:52 +0200
Subject: [Buildroot] [git commit] package/libdrm: bump version to 2.4.83
Message-ID: <20170902130619.D3A8B8016A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=089ad9cefd88b6952df2d28de9b0a6ed6fee3388
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libdrm/libdrm.hash | 10 +++++-----
 package/libdrm/libdrm.mk   |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/libdrm/libdrm.hash b/package/libdrm/libdrm.hash
index f864c55..704bf1b 100644
--- a/package/libdrm/libdrm.hash
+++ b/package/libdrm/libdrm.hash
@@ -1,5 +1,5 @@
-# From https://lists.freedesktop.org/archives/dri-devel/2017-July/147750.html
-md5 29867814123c3d23056b1d05aada1b9d  libdrm-2.4.82.tar.bz2
-sha1 c42ff308db6352eaf009a8209c7aaadbc951a89f  libdrm-2.4.82.tar.bz2
-sha256 43fa2dbd422d6d41ac141272cc9855360ce4d08c7cf7f2c7bb55dfe449c4ce1c  libdrm-2.4.82.tar.bz2
-sha512 e69fd8c2b392daabbb3a548179e3a21a555d5174c11d76a288eb2a08850849aa867c7777b67798ec00e026e998a3b128c22698f05a7b44eb24cddc5c8a3a02d0  libdrm-2.4.82.tar.bz2
+# From https://lists.freedesktop.org/archives/dri-devel/2017-August/151077.html
+md5 23800953ed7564988872e1e8c61fde31  libdrm-2.4.83.tar.bz2
+sha1 f78d392684d6e482e8c0a85d355619ac64c4ad6a  libdrm-2.4.83.tar.bz2
+sha256 03a52669da60ead62548a35bc430aafb6c2d8dd21ec9dba3a90f96eff5fe36d6  libdrm-2.4.83.tar.bz2
+sha512 8f894ff61939bca03ac857506a84bbbcbe2367e60c91a0f2388bfce5ae81e12ba2f96fe1c962416cf9e2d25ef04b98b5437c7015497789561311a72607b3bfcb  libdrm-2.4.83.tar.bz2
diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
index 0175dc9..e4d3e39 100644
--- a/package/libdrm/libdrm.mk
+++ b/package/libdrm/libdrm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBDRM_VERSION = 2.4.82
+LIBDRM_VERSION = 2.4.83
 LIBDRM_SOURCE = libdrm-$(LIBDRM_VERSION).tar.bz2
 LIBDRM_SITE = http://dri.freedesktop.org/libdrm
 LIBDRM_LICENSE = MIT
