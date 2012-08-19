From: spdawson at gmail.com <spdawson@gmail.com>
Date: Sun, 19 Aug 2012 21:08:44 +0100
Subject: [Buildroot] [PATCH 4/4] zxing: add license information
In-Reply-To: <1345406924-6574-1-git-send-email-spdawson@gmail.com>
References: <1345406924-6574-1-git-send-email-spdawson@gmail.com>
Message-ID: <1345406924-6574-4-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 package/zxing/zxing.mk |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/zxing/zxing.mk b/package/zxing/zxing.mk
index 54383e7..543d038 100644
--- a/package/zxing/zxing.mk
+++ b/package/zxing/zxing.mk
@@ -6,6 +6,8 @@
 ZXING_VERSION = 2.0
 ZXING_SITE = http://zxing.googlecode.com/files
 ZXING_SOURCE = ZXing-$(ZXING_VERSION).zip
+ZXING_LICENSE = Apache
+ZXING_LICENSE_FILES = COPYING
 ZXING_INSTALL_STAGING = YES
 
 ifneq ($(BR2_ENABLE_LOCALE),y)
-- 
1.7.9.5
