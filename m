From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 16 Jun 2017 06:32:51 +0300
Subject: [Buildroot] [PATCH 06/14] docs/manual: drop mention of removed
	external toolchains
In-Reply-To: <cover.1497583686.git.baruch@tkos.co.il>
References: <cover.1497583686.git.baruch@tkos.co.il>
Message-ID: <68b14ddaf554338963c1802d9de1506e85848aee.1497583686.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The CodeSourcery x86 and sh, the ADI Blackfin, and the Xilinx Mircoblaze
external toolchain profiles have all been removed. Update the manual.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 docs/manual/configure.txt | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/docs/manual/configure.txt b/docs/manual/configure.txt
index 945f5b11b730..008813c9b4df 100644
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
-- 
2.11.0
