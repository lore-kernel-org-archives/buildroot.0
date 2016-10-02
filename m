From: Petr Vorel <petr.vorel@gmail.com>
Date: Mon,  3 Oct 2016 00:36:33 +0200
Subject: [Buildroot] [PATCH v2 1/1] ofono: bump to version 1.18
Message-ID: <20161002223633.32230-1-petr.vorel@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
Changes since v1:
Remove duplicate Signed-off-by:

 package/ofono/ofono.hash | 2 +-
 package/ofono/ofono.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ofono/ofono.hash b/package/ofono/ofono.hash
index 50c92ed..d611736 100644
--- a/package/ofono/ofono.hash
+++ b/package/ofono/ofono.hash
@@ -1,2 +1,2 @@
 # From https://www.kernel.org/pub/linux/network/ofono/sha256sums.asc
-sha256	cbf20f07fd15253c682b23c1786d517f505c3688f7c4ea93da777e1523b89635  ofono-1.17.tar.xz
+sha256	53cdbf342913f46bce4827241c60e24255a3d43a94945edf77482ae5b312d51f  ofono-1.18.tar.xz
diff --git a/package/ofono/ofono.mk b/package/ofono/ofono.mk
index 588c9cd..8234396 100644
--- a/package/ofono/ofono.mk
+++ b/package/ofono/ofono.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OFONO_VERSION = 1.17
+OFONO_VERSION = 1.18
 OFONO_SOURCE = ofono-$(OFONO_VERSION).tar.xz
 OFONO_SITE = $(BR2_KERNEL_MIRROR)/linux/network/ofono
 OFONO_LICENSE = GPLv2
-- 
1.8.0
