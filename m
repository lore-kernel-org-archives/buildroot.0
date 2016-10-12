From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Wed, 12 Oct 2016 23:05:23 +0200
Subject: [Buildroot] [PATCH 3/4] package/iozone: indentation cleanup
In-Reply-To: <1476306324-6162-1-git-send-email-jerzy.grzegorek@trzebnica.net>
References: <1476306324-6162-1-git-send-email-jerzy.grzegorek@trzebnica.net>
Message-ID: <1476306324-6162-3-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 package/iozone/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/iozone/Config.in b/package/iozone/Config.in
index fe49bd1..33c938e 100644
--- a/package/iozone/Config.in
+++ b/package/iozone/Config.in
@@ -10,4 +10,4 @@ config BR2_PACKAGE_IOZONE
 
 comment "iozone needs a toolchain w/ NPTL"
 	depends on BR2_USE_MMU
-        depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL
-- 
1.9.1
