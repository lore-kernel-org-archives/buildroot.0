From: spdawson at gmail.com <spdawson@gmail.com>
Date: Mon, 16 Dec 2013 08:38:31 +0000
Subject: [Buildroot] [PATCH] zyre: bump git snapshot
Message-ID: <1387183111-23508-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 package/zyre/zyre.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/zyre/zyre.mk b/package/zyre/zyre.mk
index 3e28212..405697a 100644
--- a/package/zyre/zyre.mk
+++ b/package/zyre/zyre.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-ZYRE_VERSION = 44a57a449a34bb6310b5ce4b17f1ce42f9b17beb
-ZYRE_SITE = git://github.com/zeromq/zyre.git
+ZYRE_VERSION = 378b8b5cf76d10f5e41b339a4bcb0dc6197a9edf
+ZYRE_SITE = $(call github,zeromq,zyre,$(ZYRE_VERSION))
 ZYRE_LICENSE = LGPLv3+
 ZYRE_LICENSE_FILES = COPYING COPYING.LESSER
 ZYRE_INSTALL_STAGING = YES
-- 
1.8.3.2
