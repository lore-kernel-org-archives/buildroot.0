From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 12 Apr 2020 19:40:02 +0300
Subject: [Buildroot] [PATCH] package/can-utils: bump to version 2020.02.04
Message-ID: <277bf7cab1292b4a03da8fd4aa5ba724575dfaa4.1586709602.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/can-utils/can-utils.hash | 2 +-
 package/can-utils/can-utils.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/can-utils/can-utils.hash b/package/can-utils/can-utils.hash
index adbf5b0bcac2..f76576773a74 100644
--- a/package/can-utils/can-utils.hash
+++ b/package/can-utils/can-utils.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  ea0f96a02af37f16713284c7bdccdbae716d9bcb979ccfb51185d696c31f9ecf  can-utils-2020.02.0.tar.gz
+sha256  a766aad89955b9cfcca27f61ef988fa169565c3657d2789808c0f33a7afa23c8  can-utils-2020.02.04.tar.gz
 sha256  c3dc748f5e725cf5ed89784fe78e4ff1b05d309bf1e7ade4c572e8fde1b8406c  LICENSES/BSD-3-Clause
 sha256  995a31f60a9ddb4c609214cc7d17ca94cc3cbc7f37e1e64dba81e7f8ea9d4f91  LICENSES/GPL-2.0-only.txt
diff --git a/package/can-utils/can-utils.mk b/package/can-utils/can-utils.mk
index cd4dba56167d..5227bf4852a0 100644
--- a/package/can-utils/can-utils.mk
+++ b/package/can-utils/can-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CAN_UTILS_VERSION = 2020.02.0
+CAN_UTILS_VERSION = 2020.02.04
 CAN_UTILS_SITE = $(call github,linux-can,can-utils,v$(CAN_UTILS_VERSION))
 CAN_UTILS_LICENSE = BSD-3-Clause or GPL-2.0
 CAN_UTILS_LICENSE_FILES = LICENSES/BSD-3-Clause LICENSES/GPL-2.0-only.txt
-- 
2.25.1
