From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 1 Nov 2019 15:25:20 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] CHANGES: update with
 recent changes
Message-ID: <20191101141842.E5A058E4FF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d55cb8771ee595edd49313af15da4454d7b31175
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/CHANGES b/CHANGES
index 5d2bc0064f..3d5f55f6dd 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,25 @@
+2019.02.7, not yet released:
+
+	Important / security related fixes.
+
+	support/testing: use a kernel with HW_RANDOM_VIRTIO to work
+	around issues with lack of entrophy
+
+	toolchain: Also copy libssp.so for external toolchains if SSP
+	to handle toolchains providing SSP support in libssp rather
+	than in the C library
+
+	utils/test-pkg: ensure to exit with an error upon failure
+
+	Updated/fixed packages: asterisk, azmq, cups-filters, duma,
+	exfat, exfat-utils, file, gd, ghostscript, go, gvfs,
+	intel-microcode, kvm-unit-tests, libnspr, libnss, libopenssl,
+	libpcap, libpciaccess, librsvg, libseccomp, libsigrok,
+	libtorrent, libunwind, lua-sdl2, lxc, minizip, mjpegtools,
+	mongoose, php, python, python-pysnmp-apps, qemu, qt5base,
+	ruby, safeclib, samba4, sdl_mixer, sox, sudo, tcpdump, unscd,
+	util-lkinux, vtun, xvisor
+
 2019.02.6, Released October 3rd, 2019
 
 	Important / security related fixes.
