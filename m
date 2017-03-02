From: Wolfgang Grandegger <wg@grandegger.com>
Date: Thu, 2 Mar 2017 17:06:33 +0100
Subject: [Buildroot] [PATCH] package/can-utils: add license information
Message-ID: <58b30e3e-a64e-a608-ee0e-7d616d4c9932@grandegger.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Wolfgang Grandegger <wg@grandegger.com>
---
 package/can-utils/can-utils.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/can-utils/can-utils.mk b/package/can-utils/can-utils.mk
index 6be41a6..bdc311d 100644
--- a/package/can-utils/can-utils.mk
+++ b/package/can-utils/can-utils.mk
@@ -6,6 +6,7 @@
 
 CAN_UTILS_VERSION = c3305fdd515464153d20199db232b6124bc962c0
 CAN_UTILS_SITE = $(call github,linux-can,can-utils,$(CAN_UTILS_VERSION))
+CAN_UTILS_LICENSE = GPLv2, GPLv2+, BSD-3c
 CAN_UTILS_AUTORECONF = YES
 
 $(eval $(autotools-package))
-- 
1.9.1
