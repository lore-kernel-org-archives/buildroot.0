From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 23 Feb 2014 22:17:18 +0100
Subject: [Buildroot] [git commit] docs/manual: update external toolchain
	examples
Message-ID: <20140223213139.3047E9B97B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=08ad8a7c0449cacc237215737c182f6730c6bc12
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Replace ADI by Analog Devices, which is clearer for most people, and
remove the Xilinx external toolchains since we have deprecated them.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/configure.txt |    7 +++----
 1 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/docs/manual/configure.txt b/docs/manual/configure.txt
index b566e8a..a6afafb 100644
--- a/docs/manual/configure.txt
+++ b/docs/manual/configure.txt
@@ -138,10 +138,9 @@ http://www.linaro.org[Linaro] for ARM,
 http://www.mentor.com/embedded-software/sourcery-tools/sourcery-codebench/editions/lite-edition/[Sourcery
 CodeBench] for ARM, x86, x86-64, PowerPC, MIPS and SuperH,
 https://blackfin.uclinux.org/gf/project/toolchain[Blackfin toolchains
-from ADI], http://git.xilinx.com/[Xilinx toolchains for Microblaze],
-etc.) and is capable of downloading them automatically, or it can be
-pointed to a custom toolchain, either available for download or
-installed locally.
+from Analog Devices], etc.) and is capable of downloading them
+automatically, or it can be pointed to a custom toolchain, either
+available for download or installed locally.
 
 Then, you have three solutions to use an external toolchain:
 
