From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Fri, 28 Oct 2016 15:13:59 +0200
Subject: [Buildroot] [PATCH 1/1] package/libglob: fix license typo
Message-ID: <1477660439-12336-1-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 package/libglob/libglob.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libglob/libglob.mk b/package/libglob/libglob.mk
index 534f936..cd6922e 100644
--- a/package/libglob/libglob.mk
+++ b/package/libglob/libglob.mk
@@ -7,7 +7,7 @@
 LIBGLOB_VERSION = 1.0
 LIBGLOB_SITE = $(call github,voidlinux,libglob,$(LIBGLOB_VERSION))
 LIBGLOB_LICENSE = BSD-3c
-LIBGLOB_LICENSE_FILE = LICENSE
+LIBGLOB_LICENSE_FILES = LICENSE
 LIBGLOB_INSTALL_STAGING = YES
 
 ifeq ($(BR2_SHARED_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
-- 
1.9.1
