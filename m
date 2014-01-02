From: spdawson at gmail.com <spdawson@gmail.com>
Date: Thu,  2 Jan 2014 22:06:40 +0000
Subject: [Buildroot] [PATCH 3/3] zyre: bump git snapshot
In-Reply-To: <1388700400-25062-1-git-send-email-spdawson@gmail.com>
References: <1388700400-25062-1-git-send-email-spdawson@gmail.com>
Message-ID: <1388700400-25062-4-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 package/zyre/zyre.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/zyre/zyre.mk b/package/zyre/zyre.mk
index 423091f..405697a 100644
--- a/package/zyre/zyre.mk
+++ b/package/zyre/zyre.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZYRE_VERSION = d5b8cb1f66fb5059d9eeb0702a7c2055a63cd8a7
+ZYRE_VERSION = 378b8b5cf76d10f5e41b339a4bcb0dc6197a9edf
 ZYRE_SITE = $(call github,zeromq,zyre,$(ZYRE_VERSION))
 ZYRE_LICENSE = LGPLv3+
 ZYRE_LICENSE_FILES = COPYING COPYING.LESSER
-- 
1.8.3.2
