From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 20 Oct 2016 07:43:13 -0300
Subject: [Buildroot] [PATCH] iw: bump to version 4.9
Message-ID: <1476960193-30446-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/iw/iw.hash | 2 +-
 package/iw/iw.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/iw/iw.hash b/package/iw/iw.hash
index f22ceb1..414f342 100644
--- a/package/iw/iw.hash
+++ b/package/iw/iw.hash
@@ -1,2 +1,2 @@
 # From https://www.kernel.org/pub/software/network/iw/sha256sums.asc
-sha256	d1720c04bc26661d42e71d13746d5c3aeedb6bdf743f7d6b7b056f0abd345ee8	iw-4.7.tar.xz
+sha256	324cc805fad52cba2c16b9ab569906889fb645cc962aac4cfda1db85d2de97ce	iw-4.9.tar.xz
diff --git a/package/iw/iw.mk b/package/iw/iw.mk
index 925a770..faff5fc 100644
--- a/package/iw/iw.mk
+++ b/package/iw/iw.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IW_VERSION = 4.7
+IW_VERSION = 4.9
 IW_SOURCE = iw-$(IW_VERSION).tar.xz
 IW_SITE = $(BR2_KERNEL_MIRROR)/software/network/iw
 IW_LICENSE = ISC
-- 
2.7.3
