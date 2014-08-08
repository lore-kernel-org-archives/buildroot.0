From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 8 Aug 2014 23:28:02 +0200
Subject: [Buildroot] [git commit] CHANGES: add highlights for 2014.08 release
Message-ID: <20140808212854.EA99F9D3E6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ec37bbcaa914678044fe3f2e627e0dac8f4d4c3e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES |   27 +++++++++++++++++++++++++++
 1 files changed, 27 insertions(+), 0 deletions(-)

diff --git a/CHANGES b/CHANGES
index c16f126..009108d 100644
--- a/CHANGES
+++ b/CHANGES
@@ -2,6 +2,33 @@
 
 	Fixes all over the tree and new features.
 
+	Architecture: Powerpc64 BE/LE added, AVR32 deprecated.
+	Improved altivec / SPE /atomic instructions
+	handling. Additional PowerPC CPU variants added.
+
+	Defconfigs: Atmel SAMA5D3, Congatec QMX6, Lego ev3, TS-5x00,
+	qemu-system-xtensa, qemu-aarch64-virt added. A number of
+	tweaks to existing ones. lpc32xx defconfigs removed.
+
+	Toolchain: Microblaze support for internal musl toolchain.
+	Default to GCC 4.8 for internal toolchain, remove deprecated
+	4.3 and 4.6 versions.
+	External CodeSourcery / Linaro toolchain updates, option to
+	copy gconv libraries for external toolchains.
+
+	Infrastructure: graph-depends: misc fixes, transitive
+	dependencies are not drawn by default. Download handling is
+	now done using helper scripts. Integrity of downloads can now
+	be verified using sha* hashes. Subversion download now uses
+	peg revisions for robustness.
+	Legal-info: License info of local or overridden packages are
+	saved as well. Toolchain packages are also taken into account.
+	autotools: Static linking with libtool / v1.5 improvements.
+	Gettextize support, similar to autoreconf.
+	kconfig package infrastructure added.
+
+	Misc: Version selection for busybox dropped.
+
 	Updated/fixed packages: aespipe, aiccu, alsa-lib, alsa-utils,
 	alsamixergui, argus, armadillo, at, atftp, atk, avahi,
 	avrdude, axel, b43-firmware, b43-fwcutter, bandwidthd, bc,
