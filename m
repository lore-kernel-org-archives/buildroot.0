From: spdawson at gmail.com <spdawson@gmail.com>
Date: Fri,  9 Nov 2012 13:24:19 +0000
Subject: [Buildroot] [PATCH] ethtool: fix license information
Message-ID: <1352467459-20262-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 package/ethtool/ethtool.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ethtool/ethtool.mk b/package/ethtool/ethtool.mk
index a336b52..8c5961c 100644
--- a/package/ethtool/ethtool.mk
+++ b/package/ethtool/ethtool.mk
@@ -7,6 +7,6 @@
 ETHTOOL_VERSION = 3.6
 ETHTOOL_SITE = $(BR2_KERNEL_MIRROR)/software/network/ethtool
 ETHTOOL_LICENSE = GPLv2
-ETHTOOL_LICENSE_FILE = COPYING
+ETHTOOL_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
-- 
1.7.10.4
