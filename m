From: Wolfgang Grandegger <wg@grandegger.com>
Date: Fri, 3 Mar 2017 12:26:01 +0100
Subject: [Buildroot] [PATCH v2] package/can-utils: add license information
Message-ID: <68ff344f-81de-b4a4-9762-b117154cd751@grandegger.com>
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
index 6be41a6..31c2c9b 100644
--- a/package/can-utils/can-utils.mk
+++ b/package/can-utils/can-utils.mk
@@ -6,6 +6,7 @@
 
 CAN_UTILS_VERSION = c3305fdd515464153d20199db232b6124bc962c0
 CAN_UTILS_SITE = $(call github,linux-can,can-utils,$(CAN_UTILS_VERSION))
+CAN_UTILS_LICENSE = BSD-3c or GPLv2, GPLv2+
 CAN_UTILS_AUTORECONF = YES
 
 $(eval $(autotools-package))
-- 
1.9.1
