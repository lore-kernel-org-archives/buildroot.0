From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Wed, 28 Oct 2015 09:39:07 +0100
Subject: [Buildroot] [PATCH 2/2] luv: remove the default value of the
	$(PKG)_SOURCE variable
In-Reply-To: <1446021547-18360-1-git-send-email-jerzy.grzegorek@trzebnica.net>
References: <1446021547-18360-1-git-send-email-jerzy.grzegorek@trzebnica.net>
Message-ID: <1446021547-18360-2-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 package/luv/luv.mk             | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/luv/luv.mk b/package/luv/luv.mk
index 8e108a0..723afdb 100644
--- a/package/luv/luv.mk
+++ b/package/luv/luv.mk
@@ -5,7 +5,6 @@
 ################################################################################
 
 LUV_VERSION = 1.7.4-4
-LUV_SOURCE = luv-$(LUV_VERSION).tar.gz
 LUV_SITE = https://github.com/luvit/luv/releases/download/$(LUV_VERSION)
 LUV_LICENSE = Apache-2.0
 LUV_LICENSE_FILES = LICENSE.txt
-- 
1.9.1
