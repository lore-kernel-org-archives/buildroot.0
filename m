From: Francois Perrad <fperrad@gmail.com>
Date: Fri, 19 Jun 2015 21:13:22 +0200
Subject: [Buildroot] [V2 2/4] a10disp: bump to version v0.6.1
In-Reply-To: <1434741204-3988-1-git-send-email-francois.perrad@gadz.org>
References: <1434741204-3988-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1434741204-3988-3-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/a10disp/a10disp.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/a10disp/a10disp.mk b/package/a10disp/a10disp.mk
index 066e988..7353ede 100644
--- a/package/a10disp/a10disp.mk
+++ b/package/a10disp/a10disp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-A10DISP_VERSION = a899cc6dcf909360aac00482ede5369f3656f226
+A10DISP_VERSION = v0.6.1
 A10DISP_SITE = $(call github,hglm,a10disp,$(A10DISP_VERSION))
 A10DISP_LICENSE = MIT
 
-- 
2.1.4
