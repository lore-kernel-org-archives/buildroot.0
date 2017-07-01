From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 2 Jul 2017 00:36:28 +0200
Subject: [Buildroot] [git commit] manual: fix test-pkg missing.config file
	name
Message-ID: <20170701223328.860F07FA0E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=487e9382f6b79ddd3223f91283f435b16a9a6092
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/adding-packages-tips.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/manual/adding-packages-tips.txt b/docs/manual/adding-packages-tips.txt
index 8b2361d..19577fa 100644
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
