From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 9 Apr 2017 15:49:19 +0200
Subject: [Buildroot] [git commit] package/can-utils: add license information
Message-ID: <20170409134951.EE20982640@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=49665417ac6daefa755af52867d3a97533aca0de
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Wolfgang Grandegger <wg@grandegger.com>
[Thomas: use SPDX license codes.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/can-utils/can-utils.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/can-utils/can-utils.mk b/package/can-utils/can-utils.mk
index 6be41a6..45d5e29 100644
--- a/package/can-utils/can-utils.mk
+++ b/package/can-utils/can-utils.mk
@@ -6,6 +6,7 @@
 
 CAN_UTILS_VERSION = c3305fdd515464153d20199db232b6124bc962c0
 CAN_UTILS_SITE = $(call github,linux-can,can-utils,$(CAN_UTILS_VERSION))
+CAN_UTILS_LICENSE = BSD-3-Clause or GPL-2.0, GPL-2.0+
 CAN_UTILS_AUTORECONF = YES
 
 $(eval $(autotools-package))
