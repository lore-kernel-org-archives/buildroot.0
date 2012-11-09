From: Alexander Khryukin <alexander@mezon.ru>
Date: Fri,  9 Nov 2012 16:55:22 +0400
Subject: [Buildroot] [PATCH] libatomic_ops version update 7.3alpha2 old
	version 1.2 does not compiles with modern gcc and utils
Message-ID: <1352465722-23459-1-git-send-email-alexander@mezon.ru>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Alexander Khryukin <alexander@mezon.ru>
---
 package/libatomic_ops/libatomic_ops.mk | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/libatomic_ops/libatomic_ops.mk b/package/libatomic_ops/libatomic_ops.mk
index 6d50d0a..c946df0 100644
--- a/package/libatomic_ops/libatomic_ops.mk
+++ b/package/libatomic_ops/libatomic_ops.mk
@@ -1,12 +1,12 @@
 #############################################################
 #
-# Atomic_ops library
+## Atomic_ops library
 #
-#############################################################
+##############################################################
 
-LIBATOMIC_OPS_VERSION = 1.2
+LIBATOMIC_OPS_VERSION = 7.3alpha2
 LIBATOMIC_OPS_SOURCE = libatomic_ops-$(LIBATOMIC_OPS_VERSION).tar.gz
-LIBATOMIC_OPS_SITE = http://www.hpl.hp.com/research/linux/atomic_ops/download
-LIBATOMIC_OPS_INSTALL_STAGING = YES
+LIBATOMIC_OPS_SITE = http://www.hpl.hp.com/personal/Hans_Boehm/gc/gc_source/
+	LIBATOMIC_OPS_INSTALL_STAGING = YES
 
 $(eval $(autotools-package))
-- 
1.7.11.3
