From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Wed, 12 Oct 2016 23:05:24 +0200
Subject: [Buildroot] [PATCH 4/4] package/tinydtls: indentation cleanup
In-Reply-To: <1476306324-6162-1-git-send-email-jerzy.grzegorek@trzebnica.net>
References: <1476306324-6162-1-git-send-email-jerzy.grzegorek@trzebnica.net>
Message-ID: <1476306324-6162-4-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 package/tinydtls/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/tinydtls/Config.in b/package/tinydtls/Config.in
index 33b08fe..2f90eb2 100644
--- a/package/tinydtls/Config.in
+++ b/package/tinydtls/Config.in
@@ -10,4 +10,4 @@ config BR2_PACKAGE_TINYDTLS
 	  https://sourceforge.net/projects/tinydtls
 
 comment "tinydtls needs a toolchain w/ threads"
-        depends on !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
-- 
1.9.1
