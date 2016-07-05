From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 5 Jul 2016 10:43:33 +0200
Subject: [Buildroot] [git commit] package/libgpg-error: Fix typo
Message-ID: <20160705084412.AF8F481913@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f812c6b36f59583d37aab25aef8a292494532c6e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix autobuilders failures:
http://autobuild.buildroot.net/results/a45/a45d4310e9313d7e12a584e373c54916b5502d32/
http://autobuild.buildroot.net/results/3e0/3e09ed66bc9705ce6e02560f792f1872e2ff438a/
http://autobuild.buildroot.net/results/3f5/3f588651bd8565962274d6f7930c7c7031ca26af/
http://autobuild.buildroot.net/results/779/77955a015d6027544b4ba2cb5098cc83fc7bcfce/
http://autobuild.buildroot.net/results/215/215c4a5512b9b7bd9c302e46618fa7319c6dc293/

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libgpg-error/Config.in | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/package/libgpg-error/Config.in b/package/libgpg-error/Config.in
index 4a667b4..40424e4 100644
--- a/package/libgpg-error/Config.in
+++ b/package/libgpg-error/Config.in
@@ -21,29 +21,29 @@ config BR2_PACKAGE_LIBGPG_ERROR
 
 config BR2_PACKAGE_LIBGPG_ERROR_SYSCFG
 	string
-	default "aarch64-unkown-linux-gnu" \
+	default "aarch64-unknown-linux-gnu" \
 		if BR2_aarch64 || BR2_aarch64_eb
 	default "arm-unknown-linux-gnueabi" \
 		if BR2_arm || BR2_armeb
 	default "i686-pc-linux-gnu" \
 		if BR2_i386
-	default "mips-unkown-linux-gnu" \
+	default "mips-unknown-linux-gnu" \
 		if BR2_mips || BR2_mipsel
-	default "mips64el-unkown-linux-gnuabi64" \
+	default "mips64el-unknown-linux-gnuabi64" \
 		if BR2_mips64 || BR2_mips64el
-	default "m68k-unkown-linux-gnu" \
+	default "m68k-unknown-linux-gnu" \
 		if BR2_m68k
 	default "nios2-unknown-linux-gnu" \
 		if BR2_nios2
-	default "powerpc-unkown-linux-gnu" \
+	default "powerpc-unknown-linux-gnu" \
 		if BR2_powerpc
-	default "powerpc64-unkown-linux-gnu" \
+	default "powerpc64-unknown-linux-gnu" \
 		if BR2_powerpc64 || BR2_powerpc64le
-	default "sh4-unkown-linux-gnu" \
+	default "sh4-unknown-linux-gnu" \
 		if BR2_sh4 || BR2_sh4eb || BR2_sh4a || BR2_sh4aeb
-	default "sparc-unkown-linux-gnu" \
+	default "sparc-unknown-linux-gnu" \
 		if BR2_sparc
 	default "sparc64-unknown-linux-gnu" \
 		if BR2_sparc64
 	default "x86_64-pc-linux-gnu" \
-		if BR2_x86_64
\ No newline at end of file
+		if BR2_x86_64
