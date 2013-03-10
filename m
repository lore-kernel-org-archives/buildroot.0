From: Carsten Schoenert <c.schoenert@gmail.com>
Date: Sun, 10 Mar 2013 19:32:48 +0100
Subject: [Buildroot] [PATCH 07/10] directfb-examples: bump to version 1.6.0
In-Reply-To: <1362940371-25899-1-git-send-email-c.schoenert@gmail.com>
References: <1362940371-25899-1-git-send-email-c.schoenert@gmail.com>
Message-ID: <1362940371-25899-8-git-send-email-c.schoenert@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Carsten Schoenert <c.schoenert@gmail.com>

The previous version 1.2.0 isn't acting well with directfb 1.6.3 so
increasing the version to the latest available version on directfb.org.

Signed-off-by: Carsten Schoenert <c.schoenert@gmail.com>
---
 package/directfb-examples/directfb-examples.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/directfb-examples/directfb-examples.mk b/package/directfb-examples/directfb-examples.mk
index 26cc499..c7235d6 100644
--- a/package/directfb-examples/directfb-examples.mk
+++ b/package/directfb-examples/directfb-examples.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-DIRECTFB_EXAMPLES_VERSION = 1.2.0
+DIRECTFB_EXAMPLES_VERSION = 1.6.0
 DIRECTFB_EXAMPLES_SITE = http://www.directfb.org/downloads/Extras
 DIRECTFB_EXAMPLES_SOURCE = DirectFB-examples-$(DIRECTFB_EXAMPLES_VERSION).tar.gz
 DIRECTFB_EXAMPLES_INSTALL_STAGING = YES
-- 
1.7.10.4
