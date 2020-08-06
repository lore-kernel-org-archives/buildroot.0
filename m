From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 6 Aug 2020 22:36:12 +0200
Subject: [Buildroot] [git commit] CHANGES: update for 2020.08-rc1
Message-ID: <20200806203051.074918263C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d0fc0c4885e62d800141b0d38b0d50b1fab8c323
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 CHANGES | 54 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/CHANGES b/CHANGES
index 528a51cf15..d102856e69 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,57 @@
+2020.08-rc1, released August 6th, 2020
+
+	Toolchain:
+
+	- GCC 10.x added, GCC 9.x is the default
+	- binutils 2.34 added, binutils 2.33 is the default, binutils
+          2.31 removed
+	- glibc updated to 2.31
+	- ARC toolchain components updated to 2020.03-release.
+	- Enable uClibc-ng usage for RISC-V 64-bit
+
+	Infrastructure:
+
+	- qmake-package was fixed to be compatible with
+          BR2_PER_PACKAGE_DIRECTORIES
+	- complete rewrite of the Gitlab CI Yaml configuration file,
+          now generated directly by the Gitlab CI pipeline itselfs
+
+	Misc:
+
+	- cargo and cargo-bin packages removed, as cargo is now part
+          of Rust itself
+
+	Filesystem: ubinize configuration files can now use
+	BINARIES_DIR to refer to the $(O)/images directory.
+
+	New packages: bitwise, earlyoom, fuse-overlayfs, gloox,
+	kodi-pvr-octonet, kodi-pvr-zattoo, libabseil-cpp, libcutl,
+	libnids, libnpupnp, libodb, libodb-boost, libodb-mysql,
+	libodb-pgsql, mbpfan, netopeer2, odb, parprouted,
+	python-colorzero, python-gpiozero, python-pybind, python-yatl,
+	python3-decorator, qt5quicktimeline, resiprocate, ttyd,
+	unclutter-xfixes, urandom-scripts,
+
+	New defconfigs: bananapi_m2_zero, freescale_imx8mnevk,
+	globalscale_espressobin, imx6ullevk,
+	microchip_sama5d27_wlsom1_ek, rock_pi_4, rock_pi_n10
+
+	Removed packages: cargo, cargo-bin,
+	kodi-peripheral-steamcontroller
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#12941: Python GObject fails to build when using  BR2_PER_PACKAGE_DIRECTORIES
+	#12946: Grub: Decompressor is too big.
+	#12986: Mtools: Error converting to codepage 850
+	#13001: openjdk-bin replaces libfreetype.so from  host-freetype
+	#13011: Incorrect selection of gcc version
+	#13021: Minor code error when building granite-0.4.1
+	#13026: rpi-firmware: must not rename start files
+	#13046: Optimize for fast -Ofast is not compliant
+	#13081: host-e2fsprogs attempts to create udev  rules.d on build host if not exists
+	#13101: BR audit2allow support
+
 2020.05.1, released July 25th, 2020
 
 	Important / security related fixes.
