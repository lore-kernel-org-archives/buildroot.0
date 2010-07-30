From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 30 Jul 2010 10:42:31 +0200
Subject: [Buildroot] [git commit master 1/1] CHANGES: add a bunch of issues
	resolved by Thomas
Message-ID: <20100730084249.17061836DC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=31aab0c974bf6f1e679b2b98d005e387e7669aef
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Thanks!

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES |   15 +++++++++++++++
 1 files changed, 15 insertions(+), 0 deletions(-)

diff --git a/CHANGES b/CHANGES
index ad36054..a39a2fb 100644
--- a/CHANGES
+++ b/CHANGES
@@ -54,14 +54,26 @@
 	#387:  Tremor not installed to toolchain
 	#401:  new package: ffmpeg
 	#475:  uImage target for U-boot failed generating
+	#543:  ATK requires X11 on DirectFB target
+	#575:  webkit: Buildroot Libtool Patch Fails
 	#583:  build fails with external x86_64 toolchain
 	#729:  sstrip creates corrupted headers
 	#829:  Webkit r44552 needs libXt
 	#835:  Package Dataflashboot-1.05 does not compile with buildroot...
+	#847:  Compiling target-gcc v4.4 fails with "libc.so.0: cannot open...
+	#859:  Add (head of) nptl branch to list of uClibc versions
+	#949:  compile with debug info
+	#955:  Grub fails to build with External Toolchain
 	#1051: Webkit doesn't compile (Linuxthreads new, x86)
 	#1213: Move .config into output directory
+	#1225: Buildroot fails to account for "nof" subdirectory (no float...
+	#1231: (sparc) Linux kernel fails to build
+	#1261: The getline() in output/build/linux-2.6.28/scripts/unifdef.c...
+	#1339: Busybox needs -fno-strict-aliasing to compile cleanly
 	#1393: neon config fails libxml/parser.h: libxml2 requires, but not ...
 	#1405: WebKit fails to build because pthread_getattr_np is not impl...
+	#1675: GMP Error during buildroot make process
+	#1741: external toolchain linking error
 	#1753: lmbench: convert to generic package infrastructure
 	#1771: Fakeroot and the target/generic/device_table.txt create bad...
 	#1807: LZMA 4.32.7, Required header file(s) are missing
@@ -87,10 +99,13 @@
 	#2095: make gconfig: undefined reference to symbol 'dlsym@@GLIBC_2.2.5'
 	#2101: blackbox depends on locale support
 	#2119: Tries to build kernel, although disabled in config
+	#2125: libXfont build fail
 	#2143: buildroot compiler generates segfaulting statically linked exe..
+	#2149: xterm build failure
 	#2155: Compression lzo don't set for ubifs
 	#2161: [SECURITY] Update libpng to 1.2.44
 	#2167: Bump busybox to 1.17.0, convert to gentargets, drop 1.12, ...
+	#2181: pixman can't apply pixman-0.10.0-no-tests.patch
 	#2191: linux-fusion build fail
 	#2221: Qt does not compile (dependencies not taken into account?)
 	#2233: Atmel atstk target skeletons have /etc/mtab as a file, not ...
-- 
1.7.1
