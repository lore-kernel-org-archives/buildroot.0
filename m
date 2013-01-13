From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Sun, 13 Jan 2013 14:42:14 +0100
Subject: [Buildroot] [PATCH 1/1] ofono : bump version
Message-ID: <1358084534-16502-1-git-send-email-sagaert.johan@skynet.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


ofono : bump version
Signed-off-by: Sagaert Johan <sagaert.johan@skynet.be>
---
 package/ofono/ofono.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ofono/ofono.mk b/package/ofono/ofono.mk
index 6e6849b..e552eac 100644
--- a/package/ofono/ofono.mk
+++ b/package/ofono/ofono.mk
@@ -3,7 +3,7 @@
 # ofono
 #
 #############################################################
-OFONO_VERSION = 1.6
+OFONO_VERSION = 1.7
 OFONO_SITE = $(BR2_KERNEL_MIRROR)/linux/network/ofono
 OFONO_DEPENDENCIES = \
 	host-pkgconf \
-- 
1.8.0.1
