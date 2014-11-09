From: Baruch Siach <baruch@tkos.co.il>
Date: Sun,  9 Nov 2014 07:50:01 +0200
Subject: [Buildroot] [PATCH] Config.in.legacy: fix typo
Message-ID: <c9a84dba6988deda9bd1ef7bfd7021a125137e09.1415512201.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 Config.in.legacy | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index d60f4eb4c0c3..b12655643b84 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -106,7 +106,7 @@ config BR2_x86_generic
 	select BR2_LEGACY
 	help
 	  The generic x86 CPU variant has been removed. Use another
-	  CPU variant insted.
+	  CPU variant instead.
 
 config BR2_GCC_VERSION_4_4_X
 	bool "gcc 4.4.x has been removed"
-- 
2.1.1
