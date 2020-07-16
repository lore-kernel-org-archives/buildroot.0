From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 16 Jul 2020 23:44:51 +0200
Subject: [Buildroot] [PATCH 1/1] Config.in: update BR2_OPTIMIZE_FAST label
Message-ID: <20200716214451.2074700-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update label as suggested by St?phane Veyret

Fixes:
 - https://bugs.buildroot.org/show_bug.cgi?id=13046

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Config.in b/Config.in
index 0104d1319e..377e570065 100644
--- a/Config.in
+++ b/Config.in
@@ -521,7 +521,7 @@ config BR2_OPTIMIZE_S
 	  This is the default.
 
 config BR2_OPTIMIZE_FAST
-	bool "optimize for fast"
+	bool "optimize for fast (may break packages!)"
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_6
 	help
 	  Optimize for fast. Disregard strict standards
-- 
2.27.0
