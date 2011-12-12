From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Mon, 12 Dec 2011 15:43:51 +0100
Subject: [Buildroot] [PATCH 1/1] libosip2 : bump version.
Message-ID: <1323701031-27344-1-git-send-email-sagaert.johan@skynet.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Bump libosip2 version since libeXosip2 depends on this.

Signed-off-by: Sagaert Johan <sagaert.johan@skynet.be>
---
 package/libosip2/libosip2.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libosip2/libosip2.mk b/package/libosip2/libosip2.mk
index 29d2a55..1cb926a 100644
--- a/package/libosip2/libosip2.mk
+++ b/package/libosip2/libosip2.mk
@@ -3,7 +3,7 @@
 # libosip2
 #
 #############################################################
-LIBOSIP2_VERSION = 3.3.0
+LIBOSIP2_VERSION = 3.5.0
 LIBOSIP2_SOURCE = libosip2_$(LIBOSIP2_VERSION).orig.tar.gz
 LIBOSIP2_PATCH = libosip2_$(LIBOSIP2_VERSION)-1.diff.gz
 LIBOSIP2_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/libo/libosip2
-- 
1.7.8
