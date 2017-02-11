From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Feb 2017 15:58:42 +0100
Subject: [Buildroot] [git commit] CHANGES: final updates before 2017.02-rc1
Message-ID: <20170211150420.B6B16803A4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=133811eeefd35126050ef735d5f8eb76e13d3861
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 CHANGES | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/CHANGES b/CHANGES
index db7a541..b13f6db 100644
--- a/CHANGES
+++ b/CHANGES
@@ -10,6 +10,11 @@
 	    that use the Waf build system. 6 packages converted to
 	    this infrastructure.
 
+	  - add option <pkg>_PREFER_INSTALLER to the perl package
+	    infrastructure
+
+	Architecture:
+
 	  - add support for the OpenRISC CPU architecture
 
 	  - merge description of the ARM and ARM64 options, and add
@@ -32,15 +37,16 @@
 
 	  - Linaro toolchains updated to 2016.11, ARC toolchain
 	    components updated to arc-2016.09, MIPS Codescape
-	    toolchains bumped to 2016.05-06, CodeSourcery AMD64 bumped
-	    to 2016.11-19
+	    toolchains bumped to 2016.05-06, CodeSourcery AMD64 and
+	    NIOS2 toolchains bumped
 
 	  - remove Analog Devices toolchain for the Blackfin
-	    architecture
+	    architecture, remove pre-built musl toolchains from
+	    musl.codu.org
 
 	New defconfigs: Freescale i.MX23EVK, Qemu OpenRISC emulation,
-	Grinn chiliBoard, Freescale i.MX6Q SabreSD, BeagleBoard X15,
-	OrangePi One, ARC HS38 HAPS
+	Qemu NIOS2 emulation, Grinn chiliBoard, Freescale i.MX6Q
+	SabreSD, BeagleBoard X15, OrangePi One, ARC HS38 HAPS
 
 	New packages: angular-websocket, aubio, bctoolbox, darkhttpd,
 	ddrescue, easydbus, fakedate, git-crypt, hiredis, ifenslave,
