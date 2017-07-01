From: Peter Seiderer <ps.report@gmx.net>
Date: Sat,  1 Jul 2017 23:36:35 +0200
Subject: [Buildroot] [PATCH v2] manual: fix test-pkg missing.config file name
Message-ID: <20170701213635.18610-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 docs/manual/adding-packages-tips.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/manual/adding-packages-tips.txt b/docs/manual/adding-packages-tips.txt
index 8b2361d20d..19577fa821 100644
--- a/docs/manual/adding-packages-tips.txt
+++ b/docs/manual/adding-packages-tips.txt
@@ -105,7 +105,7 @@ The results mean:
   snippet were not present in the final configuration. This is due to
   options having dependencies not satisfied by the toolchain, such as
   for example a package that +depends on BR2_USE_MMU+ with a noMMU
-  toolchain. The missing options are reported in +config.missing+ in
+  toolchain. The missing options are reported in +missing.config+ in
   the output build directory (+~/br-test-pkg/TOOLCHAIN_NAME/+ by
   default).
 * `FAILED`: the build failed. Inspect the +logfile+ file in the output
-- 
2.11.0
