From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Tue,  8 Mar 2016 22:58:06 +0100
Subject: [Buildroot] [PATCH 4/4] ubus: indentation cleanup
In-Reply-To: <1457474286-18685-1-git-send-email-jerzy.grzegorek@trzebnica.net>
References: <1457474286-18685-1-git-send-email-jerzy.grzegorek@trzebnica.net>
Message-ID: <1457474286-18685-4-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 package/ubus/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ubus/Config.in b/package/ubus/Config.in
index 391fc8d..c14f6a8 100644
--- a/package/ubus/Config.in
+++ b/package/ubus/Config.in
@@ -1,6 +1,6 @@
 comment "ubus needs a toolchain w/ dynamic library"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
-        depends on BR2_STATIC_LIBS
+	depends on BR2_STATIC_LIBS
 
 config BR2_PACKAGE_UBUS
 	bool "ubus"
-- 
1.9.1
