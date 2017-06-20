From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 20 Jun 2017 22:12:54 +0200
Subject: [Buildroot] [git commit] docs/manual: drop mention of removed
	external toolchains
Message-ID: <20170620201445.266827FED4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=533a3321b048d4af1bf98a7a99188b7f452b47c7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The CodeSourcery x86 and sh, the ADI Blackfin, and the Xilinx Mircoblaze
external toolchain profiles have all been removed. Update the manual.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/configure.txt | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/docs/manual/configure.txt b/docs/manual/configure.txt
index 945f5b1..008813c 100644
--- a/docs/manual/configure.txt
+++ b/docs/manual/configure.txt
@@ -146,19 +146,17 @@ cross-compilation toolchains. Buildroot knows about a number of
 well-known cross-compilation toolchains (from
 http://www.linaro.org[Linaro] for ARM,
 http://www.mentor.com/embedded-software/sourcery-tools/sourcery-codebench/editions/lite-edition/[Sourcery
-CodeBench] for ARM, x86, x86-64, PowerPC, MIPS and SuperH,
-https://blackfin.uclinux.org/gf/project/toolchain[Blackfin toolchains
-from Analog Devices], etc.) and is capable of downloading them
-automatically, or it can be pointed to a custom toolchain, either
-available for download or installed locally.
+CodeBench] for ARM, x86-64, PowerPC, and MIPS, and is capable of
+downloading them automatically, or it can be pointed to a custom
+toolchain, either available for download or installed locally.
 
 Then, you have three solutions to use an external toolchain:
 
 * Use a predefined external toolchain profile, and let Buildroot
   download, extract and install the toolchain. Buildroot already knows
-  about a few CodeSourcery, Linaro, Blackfin and Xilinx toolchains.
-  Just select the toolchain profile in +Toolchain+ from the
-  available ones. This is definitely the easiest solution.
+  about a few CodeSourcery and Linaro toolchains. Just select the
+  toolchain profile in +Toolchain+ from the available ones. This is
+  definitely the easiest solution.
 
 * Use a predefined external toolchain profile, but instead of having
   Buildroot download and extract the toolchain, you can tell Buildroot
