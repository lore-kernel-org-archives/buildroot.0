From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 11 Jun 2019 00:16:35 +0200
Subject: [Buildroot] [PATCH 2/2] package/mdadm: bump to version 4.1
In-Reply-To: <20190610221635.19496-1-fontaine.fabrice@gmail.com>
References: <20190610221635.19496-1-fontaine.fabrice@gmail.com>
Message-ID: <20190610221635.19496-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/mdadm/mdadm.hash | 3 ++-
 package/mdadm/mdadm.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/mdadm/mdadm.hash b/package/mdadm/mdadm.hash
index 6132a6d8ca..34a711f4bb 100644
--- a/package/mdadm/mdadm.hash
+++ b/package/mdadm/mdadm.hash
@@ -1,2 +1,3 @@
 # From https://www.kernel.org/pub/linux/utils/raid/mdadm/sha256sums.asc
-sha256 1d6ae7f24ced3a0fa7b5613b32f4a589bb4881e3946a5a2c3724056254ada3a9  mdadm-4.0.tar.xz
+sha256 ab7688842908d3583a704d491956f31324c3a5fc9f6a04653cb75d19f1934f4a  mdadm-4.1.tar.xz
+sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/mdadm/mdadm.mk b/package/mdadm/mdadm.mk
index b2ed5049aa..171782712f 100644
--- a/package/mdadm/mdadm.mk
+++ b/package/mdadm/mdadm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MDADM_VERSION = 4.0
+MDADM_VERSION = 4.1
 MDADM_SOURCE = mdadm-$(MDADM_VERSION).tar.xz
 MDADM_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/raid/mdadm
 MDADM_LICENSE = GPL-2.0+
-- 
2.20.1
