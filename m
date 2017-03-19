From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Sun, 19 Mar 2017 10:59:49 +0100
Subject: [Buildroot] [PATCH 2/5] package/openocd: indentation cleanup
In-Reply-To: <1489917592-12454-1-git-send-email-jerzy.grzegorek@trzebnica.net>
References: <1489917592-12454-1-git-send-email-jerzy.grzegorek@trzebnica.net>
Message-ID: <1489917592-12454-2-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 package/openocd/openocd.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/openocd/openocd.mk b/package/openocd/openocd.mk
index 0d18365..8407bbc 100644
--- a/package/openocd/openocd.mk
+++ b/package/openocd/openocd.mk
@@ -108,7 +108,7 @@ HOST_OPENOCD_DEPENDENCIES = host-libftdi host-libusb host-libusb-compat
 # build system believe the documentation doesn't need to be
 # regenerated.
 define OPENOCD_FIX_VERSION_TEXI
-       touch -r $(@D)/doc/openocd.info $(@D)/doc/version.texi
+	touch -r $(@D)/doc/openocd.info $(@D)/doc/version.texi
 endef
 OPENOCD_POST_BUILD_HOOKS += OPENOCD_FIX_VERSION_TEXI
 HOST_OPENOCD_POST_BUILD_HOOKS += OPENOCD_FIX_VERSION_TEXI
-- 
1.9.1
