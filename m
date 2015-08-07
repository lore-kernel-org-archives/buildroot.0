From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri,  7 Aug 2015 20:50:56 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/x11r7/libepoxy: bump version
	to 1.3.1
Message-ID: <1438973456-7236-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/libepoxy/libepoxy.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/x11r7/libepoxy/libepoxy.mk b/package/x11r7/libepoxy/libepoxy.mk
index 7570226..26d90f3 100644
--- a/package/x11r7/libepoxy/libepoxy.mk
+++ b/package/x11r7/libepoxy/libepoxy.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBEPOXY_VERSION = v1.2
+LIBEPOXY_VERSION = v1.3.1
 LIBEPOXY_SITE = $(call github,anholt,libepoxy,$(LIBEPOXY_VERSION))
 LIBEPOXY_INSTALL_STAGING = YES
 LIBEPOXY_AUTORECONF = YES
-- 
2.1.4
