From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Sat, 27 Oct 2012 12:32:20 +0200
Subject: [Buildroot] [PATCH 1/1] directfb bump version 1.4.17
Message-ID: <1351333940-8793-1-git-send-email-sagaert.johan@skynet.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Bump version to 1.4.17  (buxfix release)
Signed-off-by: Sagaert Johan <sagaert.johan@skynet.be>
---
 package/directfb/directfb.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/directfb/directfb.mk b/package/directfb/directfb.mk
index e5763d7..b1e35ae 100644
--- a/package/directfb/directfb.mk
+++ b/package/directfb/directfb.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 DIRECTFB_VERSION_MAJOR = 1.4
-DIRECTFB_VERSION = $(DIRECTFB_VERSION_MAJOR).16
+DIRECTFB_VERSION = $(DIRECTFB_VERSION_MAJOR).17
 DIRECTFB_SITE = http://www.directfb.org/downloads/Core/DirectFB-$(DIRECTFB_VERSION_MAJOR)
 DIRECTFB_SOURCE = DirectFB-$(DIRECTFB_VERSION).tar.gz
 DIRECTFB_LICENSE = LGPLv2.1+
-- 
1.8.0
