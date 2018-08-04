From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 4 Aug 2018 19:10:50 +0200
Subject: [Buildroot] [git commit] CHANGES: update for 2018.08-rc1
Message-ID: <20180804170451.D6FCA8A65D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=340a09030445d2acffc18878c281539055a7aaf0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 CHANGES | 68 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/CHANGES b/CHANGES
index 07fd033a30..1372fc8978 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,71 @@
+2018.08-rc1, To be released
+
+	Toolchain:
+
+	- add support for gcc 8.x, switch to gcc 7.x as the default
+	  version
+	- add support for gdb 8.1, switch to gdb 8.0 as the default
+	  and remove gdb 7.10/7.11
+	- add support for binutils 2.31
+	- NIOSII CodeSourcery toolchain updated
+	- Linaro AArch64 BE toolchain added, and other Linaro
+	  toolchains updated
+	- Synopsys ARC pre-built toolchain updated
+
+	Architecture: add support for ARM Cortex-M7
+
+	Major updates:
+
+	- systemd bumped to 239
+	- Qt5 bumped to 5.11.1
+	- Rust bumped to 1.27
+	- GStreamer stack bumped to 1.14.2
+	- X.org server bumped to 1.20, and all X.org proto packages
+	  replaced by the single xorgproto package
+	- i.MX6 support packages bumped to 6.2.4
+
+	Linux: bumped to 4.17 by default.
+
+	Infrastructure: new package infrastructure added for packages
+	using the Meson build system
+
+	New packages: at-spi2-atk, at-spi2-core, capnproto, cmocka,
+	corkscrew, cutelyst, davfs2, flatcc, libidn2, libgit2,
+	libopusenc, mender, nghttp2, perl-convert-asn1, perl-crypt-blowfish,
+	perl-crypt-cbc, perl-digest-md5, perl-mime-base64-urlsafe,
+	perl-mojolicious-plugin-authentication, perl-net-ping,
+	perl-net-snmp, perl-net-ssh2, perl-net-telnet, pigz,
+	python-reentry, python-request-id, python-validators,
+	python-webob, shadowsocks-libev, speexdsp, xorgproto, wampcc
+
+	New defconfigs: NXP i.MX7D SDB, Boundary Devices Nitrogen 8M,
+	Olimex A10 OLinuxino, ZynqMP ZCU106
+
+	Removed packages: all xproto_* have been removed and replaced
+	by xorgproto
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#9411:	MUSL build with RT Error relocating /lib/libgcc_s.so.1:
+		__cpu_indicator_init: symbol not found
+	#9921: lockfile module within python-daemon not	 available
+	#10341: gdb install of py files when using buildroot toolchain
+		includes build path
+	#10661: /etc/init.d/S29netplug starts multiple	instances of netplugd
+	#10751: Missing dependency in pulseaudio package
+	#10811: kodi-17.6-Krypton does not compile for	freescale_* devices
+	#10856: openblas on qemu_x86_64_defconfig fails with
+		"sgemm_kernel.o: No such file or directory"
+	#11056: Compiling a file that uses libdrm headers fails with:
+		fatal error: drm.h: No such file or directory
+	#11061: support/download: git version=master broken
+	#11071: Building postgresql package on Debian 9.4  x64 for armel target fails
+	#11076: Docker containerd installed to incorrect  path
+	#11101: host-patchelf Endian Issue with relative  RPATH
+	#11111: raspberry pi 3 b+: missing BSP for 64-bit  kernel
+	#11121: statfs call corrupts memory struct statfs  too small
+	#11181: Switching toolchain does not work
+
 2018.05.1, Released July 20th, 2018
 
 	Important / security related fixes.
