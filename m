From: Petr Vorel <petr.vorel@gmail.com>
Date: Wed, 20 Jan 2021 21:22:10 +0100
Subject: [Buildroot] [PATCH 1/1] package/kmod: bump version to 28
Message-ID: <20210120202210.2832-1-petr.vorel@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
 package/kmod/kmod.hash | 2 +-
 package/kmod/kmod.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kmod/kmod.hash b/package/kmod/kmod.hash
index 3cb60b2dd3..f0bd436dc8 100644
--- a/package/kmod/kmod.hash
+++ b/package/kmod/kmod.hash
@@ -1,5 +1,5 @@
 # From https://www.kernel.org/pub/linux/utils/kernel/kmod/sha256sums.asc
-sha256  c1d3fbf16ca24b95f334c1de1b46f17bbe5a10b0e81e72668bdc922ebffbbc0c  kmod-27.tar.xz
+sha256  3969fc0f13daa98084256337081c442f8749310089e48aa695c9b4dfe1b3a26c  kmod-28.tar.xz
 
 # Locally calculated
 sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  libkmod/COPYING
diff --git a/package/kmod/kmod.mk b/package/kmod/kmod.mk
index d0f26a8841..7fed252c22 100644
--- a/package/kmod/kmod.mk
+++ b/package/kmod/kmod.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KMOD_VERSION = 27
+KMOD_VERSION = 28
 KMOD_SOURCE = kmod-$(KMOD_VERSION).tar.xz
 KMOD_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kernel/kmod
 KMOD_INSTALL_STAGING = YES
-- 
2.30.0
