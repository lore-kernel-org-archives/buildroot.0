From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  7 Feb 2016 17:02:47 +0100
Subject: [Buildroot] [PATCH 03/28] package/libplatform: bump version
In-Reply-To: <1454860992-25114-1-git-send-email-bernd.kuhls@t-online.de>
References: <1454860992-25114-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1454860992-25114-4-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libplatform/libplatform.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libplatform/libplatform.mk b/package/libplatform/libplatform.mk
index 4eb934f..6d54915 100644
--- a/package/libplatform/libplatform.mk
+++ b/package/libplatform/libplatform.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPLATFORM_VERSION = 1.0.10
+LIBPLATFORM_VERSION = feafe68e3e0b02c3261aefb3d711863ef6fadd38
 LIBPLATFORM_SITE = $(call github,Pulse-Eight,platform,$(LIBPLATFORM_VERSION))
 LIBPLATFORM_LICENSE = GPLv2+, PHP license v3.01
 LIBPLATFORM_LICENSE_FILES = src/os.h src/util/fstrcmp.c
-- 
2.7.0
