From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 8 Jul 2013 23:09:49 +0200
Subject: [Buildroot] [git commit] Make the microblaze toolchains easily
	distinguishable
Message-ID: <20130708211212.10A9A99CC4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cd3444683558e162361632dcd967509c0372b3d2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It was confusing to have two different toolchains with the
same label.

Signed-off-by: Jan Viktorin <xvikto03@stud.fit.vutbr.cz>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/toolchain-external/Config.in |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 946063f..130b705 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -649,7 +649,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R1
 	  http://blackfin.uclinux.org.
 
 config BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEEL_14_3
-	bool "Xilinx Little Endian Microblaze GNU Tools"
+	bool "Xilinx Little Endian Microblaze GNU Tools 14.3"
 	depends on BR2_microblazeel
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
@@ -661,7 +661,7 @@ config BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEEL_14_3
 	  uses gcc 4.6.2, binutils 2.21.53, glibc 2.14 and gdb 7.4.50.
 
 config BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEEL_V2
-	bool "Xilinx Little Endian Microblaze GNU Tools"
+	bool "Xilinx Little Endian Microblaze GNU Tools v2"
 	depends on BR2_microblazeel
 	depends on BR2_HOSTARCH = "x86_64"
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
