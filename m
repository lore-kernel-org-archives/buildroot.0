From: Peter Seiderer <ps.report@gmx.net>
Date: Thu, 26 Feb 2015 00:05:07 +0100
Subject: [Buildroot] [PATCH v1 3/4] directfb-examples: bump version to 1.7.0
In-Reply-To: <1424905508-30186-1-git-send-email-ps.report@gmx.net>
References: <1424905508-30186-1-git-send-email-ps.report@gmx.net>
Message-ID: <1424905508-30186-3-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/directfb-examples/directfb-examples.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/directfb-examples/directfb-examples.mk b/package/directfb-examples/directfb-examples.mk
index 16d2a86..6efc288 100644
--- a/package/directfb-examples/directfb-examples.mk
+++ b/package/directfb-examples/directfb-examples.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DIRECTFB_EXAMPLES_VERSION = 1.6.0
+DIRECTFB_EXAMPLES_VERSION = 1.7.0
 DIRECTFB_EXAMPLES_SITE = http://www.directfb.org/downloads/Extras
 DIRECTFB_EXAMPLES_SOURCE = DirectFB-examples-$(DIRECTFB_EXAMPLES_VERSION).tar.gz
 DIRECTFB_EXAMPLES_LICENSE = MIT
-- 
2.1.4
