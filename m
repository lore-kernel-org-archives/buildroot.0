From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Mon, 12 Mar 2012 13:30:33 +0100
Subject: [Buildroot] [PATCH v1 1/1] libffi : bump version to 3.0.10
Message-ID: <1331555433-25941-1-git-send-email-sagaert.johan@skynet.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Sagaert Johan <sagaert.johan@skynet.be>
---
 package/libffi/libffi.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libffi/libffi.mk b/package/libffi/libffi.mk
index e9e87ef..2181ea1 100644
--- a/package/libffi/libffi.mk
+++ b/package/libffi/libffi.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-LIBFFI_VERSION = 3.0.9
+LIBFFI_VERSION = 3.0.10
 LIBFFI_SITE    = ftp://sources.redhat.com/pub/libffi/
 
 LIBFFI_INSTALL_STAGING = YES
-- 
1.7.9.3
