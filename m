From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Fri, 16 Dec 2016 12:19:16 +0100
Subject: [Buildroot] [PATCH] can-utils: bump version
Message-ID: <1481887156-18543-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/can-utils/can-utils.hash | 2 +-
 package/can-utils/can-utils.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/can-utils/can-utils.hash b/package/can-utils/can-utils.hash
index 09e3c4d..5e0bccc 100644
--- a/package/can-utils/can-utils.hash
+++ b/package/can-utils/can-utils.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 8db112e69fceef16617895fa9d4222221fdf44c19eef64912480336c59904765 can-utils-b70a76670dbe8925c2a7c75f90d36a28a8878d7a.tar.gz
+sha256  9899f8838d52459769b61ba3cb2d1e079a5d28fbef1a23859489753da91fce82  can-utils-64edc021d22441002028bc451548b9e7f1874b91.tar.gz
diff --git a/package/can-utils/can-utils.mk b/package/can-utils/can-utils.mk
index e95cf22..46caf62 100644
--- a/package/can-utils/can-utils.mk
+++ b/package/can-utils/can-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CAN_UTILS_VERSION = b70a76670dbe8925c2a7c75f90d36a28a8878d7a
+CAN_UTILS_VERSION = 64edc021d22441002028bc451548b9e7f1874b91
 CAN_UTILS_SITE = $(call github,linux-can,can-utils,$(CAN_UTILS_VERSION))
 CAN_UTILS_AUTORECONF = YES
 
-- 
2.1.4
