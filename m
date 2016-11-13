From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 13 Nov 2016 18:21:56 +0100
Subject: [Buildroot] [git commit] CHANGES: update for -rc2
Message-ID: <20161113172223.15EC080F3D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=90aed6685f24d2fe60500e958841dd30dc56263f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 CHANGES | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/CHANGES b/CHANGES
index 5b1b62f..94cea41 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,34 @@
+2016.11-rc2, Released November 13th, 2016
+
+	Fixes all over the tree.
+
+	Architecture: add support for MIPS XBurst cores; remove MIPS
+	support for M5100 cores.
+
+	Updated/fixed packages: mesa3d, lttng-babeltrace, tinyalsa, pseudo,
+	czmq, libxml2, makedevs, binutils, kvm-unit-tests, libnss, privoxy,
+	qemu, ser2net, net-tools, ffmpeg, assimp, libmpeg2, ccache, mpv,
+	libxslt, python, python3, php, valgrind, guile, domoticz, efl,
+	jasper, kvmtool, go, wget, sane-backends, weston, tinymembench,
+	strace, openjpeg, lcms2.
+
+	Linux kernel: update default to 4.8.7.
+
+	CMake support: fix cmake wrapper to properly pass NDEBUG flag.
+
+	Filesystems: use a wrapper to pseudo, to better mimick the behaviour
+	of fakeroot; makedevs no longer breaks of the destination already
+	exists and is of the correct type/major/minor.
+
+	Defconfigs: a few legacy and broken defconfigs have been removed
+	because they now fail to build: kb9202_defconfig, mini2440_defconfig,
+	freescale_p2020ds, qmx6, calao*, atmel_sama5d4ek. Other defconfigs
+	have been updated: nanopi-neo, olimex_a20_olinuxino_lime_mali,
+	armadeus_apf51, armadeus_apf28, freescale_imx31_3stack, ci20,
+	olimex_a20_olinuxino_lime2, atmel_at91sam9260eknf,
+	atmel_at91sam9rlek, atmel_at91sam9g20dfc, atmel_at91sam9g45m10ek,
+	atmel_sama5d3xek.
+
 2016.11-rc1, Released November 3rd, 2016
 
 	Fixes all over the tree and new features.
