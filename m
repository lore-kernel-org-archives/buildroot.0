From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 1 Nov 2019 14:59:34 +0100
Subject: [Buildroot] [git commit branch/2019.08.x] CHANGES: update with
 recent changes
Message-ID: <20191101135355.ED9D08E4FC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4c764561f536041e519c89118dbd5f4e6b25b687
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.08.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/CHANGES b/CHANGES
index 8bb5dcb4f8..fba44dd52b 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,25 @@
+2019.08.2, not yet released:
+
+	Important / security related fixes.
+
+	toolchain: Also copy libssp.so for external toolchains if SSP
+	to handle toolchains providing SSP support in libssp rather
+	than in the C library
+
+	utils/test-pkg: ensure to exit with an error upon failure
+
+	Updated/fixed packages: asterisk, azmq, binutils,
+	cups-filters, duma, exfat, exfat-utils, fdk-aac, file, gcc,
+	gd, ghostscript, go, gpsd, grpc, gst1-plugins-base, gvfs, icu,
+	intel-microcode, kvm-unit-tests, libnspr, libnss, libopenssl,
+	libpcap, libpciaccess, librsvg, libseccomp, libsigrok,
+	libtorrent, libunwind, libva, lua-sdl2, lxc, minizip,
+	mjpegtools, mongoose, mono, nbd, nfs-utils, php, python,
+	python-pysnmp-apps, python-tornado, qemu, qt5base, ruby,
+	safeclib, samba4, sdl_mixer, sox, sudo, suricata, tcpdump,
+	unscd, util-linux, vdr-plugin-vnsiserver, vtun, wireshark,
+	xvisor
+
 2019.08.1, released October 3rd, 2019
 
 	Important / security related fixes.
