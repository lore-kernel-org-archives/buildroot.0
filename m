From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 5 May 2020 22:56:09 +0200
Subject: [Buildroot] [git commit] CHANGES: start updating for 2020.05-rc1
 release
Message-ID: <20200505204103.5E91B90044@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1025d09f9503179a19ef8119a814515d48d4c4c8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 CHANGES | 61 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/CHANGES b/CHANGES
index 60177304b3..5a2f2d20fd 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,64 @@
+2020.05-rc1, to be released
+
+	Addition of support for gobject-introspection: both the
+	gobject-introspection package itself, but also introspection
+	support was enabled in a number of other packages.
+
+	Support for Qt 5.6 was dropped as its support was dropped
+	upstream, only one version of Qt is supported at the moment:
+	Qt 5.14.2.
+
+	Addition of support for the apparmor Linux security module, by
+	adding the necessary user-space packages.
+
+	Addition of a qmake package infrastructure, now used by most
+	Qt-related packages.
+
+	The Luarocks package infrastructure has been extended to
+	support build host packages.
+
+	The package infrastructure was improved to allow each package
+	to indicate the Linux kernel configuration options it needs.
+
+	Addition of support for generating filesystem images using the
+	EROFS filesystem.
+
+	The logic that calculates the list of files installed by each
+	package was reworked to be compatible with the top-level
+	parallel build functionality.
+
+	Addition of a package for a pre-compiled ARM32 bare-metal
+	toolchain, which can be used to build ARM32 code in ARM64
+	configurations, such as firmware/bootloader code.
+
+	The Qemu defconfigs are now boot-tested in Qemu as part of the
+	Gitlab continuous integration.
+
+	Toolchain: gcc 9.x bumped to 9.3.0, gcc 8.x bumped to 8.4.0,
+	gdb bumped to 8.3.1.
+
+	New packages: apcupsd, apparmor, arm-gnu-a-toolchain, bearssl,
+	belle-sip, belr, cage, chartjs, erofs-utils, exfatprogs,
+	gobject-introspection, ibm-sw-tpm2, imx-seco, jbig2dec,
+	libapparmor, libiberty, libfuse3, libtextstyle, libudfread,
+	libuhttpd, libuwsc, lua-lyaml, matio, mbuffer, netdata,
+	openfpgaloader, perl-i18n, perl-locale-maketext-lexicon,
+	perl-lwp-protocol-https,
+	perl-mojolicious-plugin-authorization,
+	perl-mojolicious-plugin-cspheader,
+	perl-mojolicious-plugin-i18n,
+	perl-mojolicious-plugin-securityheader, perl-mozilla-ca,
+	perl-path-class, pistache, pkcs11-helper, prelink-cross,
+	python-argon2-cffi, python-canopen, python-cbor2,
+	python-filelock, python-flatbuffers, python-greenlet,
+	python-modbus-tk, python-pyalsa, python-pysftp, python-regex,
+	python-snappy, rtty, tinyproxy, udev-gentoo-scripts, unbound,
+	vuejs, wlroots.
+
+	New defconfigs: freescale_imx6ullevk, freescale_imx8qmmek,
+	nanopi_neo4, nanopi_r1, nitrogen8mm, nitrogen8mn, olpc_xo1,
+	olpc_xo175, roc_rk3399_pc, stm32mp157a_dk1, zynq_qmtech
+
 2020.02.1, released April 10th, 2020
 
 	Important / security related fixes.
