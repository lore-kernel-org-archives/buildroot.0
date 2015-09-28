From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 28 Sep 2015 21:27:57 +0200
Subject: [Buildroot] [PATCH 2/2] package/libdcadec: bump version
In-Reply-To: <1443468477-25001-1-git-send-email-bernd.kuhls@t-online.de>
References: <1443468477-25001-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1443468477-25001-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libdcadec/libdcadec.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libdcadec/libdcadec.mk b/package/libdcadec/libdcadec.mk
index 1c423f0..76862a6 100644
--- a/package/libdcadec/libdcadec.mk
+++ b/package/libdcadec/libdcadec.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBDCADEC_VERSION = 7b3b44cd180c9345c98be9062eac701eab5c7454
+LIBDCADEC_VERSION = 2a9186e34ce557d3af1a20f5b558d1e6687708b9
 LIBDCADEC_SITE = $(call github,foo86,dcadec,$(LIBDCADEC_VERSION))
 LIBDCADEC_LICENSE = LGPLv2.1+
 LIBDCADEC_LICENSE_FILES = COPYING.LGPLv2.1
-- 
2.5.3
