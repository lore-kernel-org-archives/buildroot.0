From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  5 Jun 2016 19:52:20 +0200
Subject: [Buildroot] [PATCH 27/28] package/open-plc-utils: bump version
In-Reply-To: <1465149141-15774-1-git-send-email-bernd.kuhls@t-online.de>
References: <1465149141-15774-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1465149141-15774-27-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/open-plc-utils/open-plc-utils.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/open-plc-utils/open-plc-utils.mk b/package/open-plc-utils/open-plc-utils.mk
index a674372..67c8d7d 100644
--- a/package/open-plc-utils/open-plc-utils.mk
+++ b/package/open-plc-utils/open-plc-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPEN_PLC_UTILS_VERSION = 05ef40c0a2949cfaf1c3230e10679fbcf912d174
+OPEN_PLC_UTILS_VERSION = 1be781d1ea81827e5f6c1a35961c65dd4d15472c
 OPEN_PLC_UTILS_SITE = $(call github,qca,open-plc-utils,$(OPEN_PLC_UTILS_VERSION))
 OPEN_PLC_UTILS_LICENSE = BSD-3c
 OPEN_PLC_UTILS_LICENSE_FILES = LICENSE
-- 
2.8.1
