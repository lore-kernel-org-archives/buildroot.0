From: Adam Duskett <aduskett@gmail.com>
Date: Thu, 19 Oct 2017 11:14:44 -0400
Subject: [Buildroot] [PATCH 1/1] qemu: bump to 2.10.1
Message-ID: <20171019151444.2520-1-Adamduskett@outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also add sha256sums for license files.

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
---
 package/qemu/qemu.hash | 4 +++-
 package/qemu/qemu.mk   | 2 +-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/qemu/qemu.hash b/package/qemu/qemu.hash
index 405d192508..db43c9a2d8 100644
--- a/package/qemu/qemu.hash
+++ b/package/qemu/qemu.hash
@@ -1,2 +1,4 @@
 # Locally computed, tarball verified with GPG signature
-sha256 7b50634d729dcabe4a96d74062832274fa2f4c883e82904f5e6955f801edab54  qemu-2.8.1.1.tar.xz
+sha256 1dd51a908fc68c7d935b0b31fb184c5669bc23b5a1b081816e824714f2a11caa  qemu-2.10.1.tar.xz
+sha256 6f04ae8364d0079a192b14635f4b1da294ce18724c034c39a6a41d1b09df6100  COPYING
+sha256 48ffe9fc7f1d5462dbd19340bc4dd1d8a9e37c61ed535813e614cbe4a5f0d4df  COPYING.LIB
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 0bf13cd2c5..402ad68b5c 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QEMU_VERSION = 2.8.1.1
+QEMU_VERSION = 2.10.1
 QEMU_SOURCE = qemu-$(QEMU_VERSION).tar.xz
 QEMU_SITE = http://download.qemu.org
 QEMU_LICENSE = GPL-2.0, LGPL-2.1, MIT, BSD-3-Clause, BSD-2-Clause, Others/BSD-1c
-- 
2.13.6
