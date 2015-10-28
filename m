From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Wed, 28 Oct 2015 07:54:31 +0100
Subject: [Buildroot] [PATCH 1/1] luv: fix license typo
Message-ID: <1446015271-17243-1-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 package/luv/luv.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/luv/luv.mk b/package/luv/luv.mk
index 8e108a0..fd5c365 100644
--- a/package/luv/luv.mk
+++ b/package/luv/luv.mk
@@ -8,7 +8,7 @@ LUV_VERSION = 1.7.4-4
 LUV_SOURCE = luv-$(LUV_VERSION).tar.gz
 LUV_SITE = https://github.com/luvit/luv/releases/download/$(LUV_VERSION)
 LUV_LICENSE = Apache-2.0
-LUV_LICENSE_FILE = LICENSE.txt
+LUV_LICENSE_FILES = LICENSE.txt
 LUV_DEPENDENCIES = libuv
 LUV_INSTALL_STAGING = YES
 
-- 
1.9.1
