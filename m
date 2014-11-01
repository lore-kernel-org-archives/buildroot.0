From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Sat,  1 Nov 2014 10:21:30 +0100
Subject: [Buildroot] [PATCH 2/6] cairo: bump to 1.12.12
In-Reply-To: <1414833694-4236-1-git-send-email-eric.le.bihan.dev@free.fr>
References: <1414833694-4236-1-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <1414833694-4236-3-git-send-email-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump cairo to version 1.12.12.

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 package/cairo/cairo.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/cairo/cairo.mk b/package/cairo/cairo.mk
index 4b5fdfe..e6fb007 100644
--- a/package/cairo/cairo.mk
+++ b/package/cairo/cairo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CAIRO_VERSION = 1.12.10
+CAIRO_VERSION = 1.12.12
 CAIRO_SOURCE = cairo-$(CAIRO_VERSION).tar.xz
 CAIRO_LICENSE = LGPLv2.1+
 CAIRO_LICENSE_FILES = COPYING
-- 
1.9.3
