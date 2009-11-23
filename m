From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 23 Nov 2009 13:03:59 +0100
Subject: [Buildroot] [git commit master] CHANGES: add non-package changes
	since 2009.08
Message-ID: <20091123120642.CF77377782@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=b8a917faaa4b330ad86ac0dd1191fe802d9eae9c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES |   12 +++++++++++-
 1 files changed, 11 insertions(+), 1 deletions(-)

diff --git a/CHANGES b/CHANGES
index ee33dd2..5245a0f 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,11 +1,21 @@
 2009.11, Not yet released:
 
+	Fixes all over the tree and new features.
+
+	Cleaned up / Simplified build directory layout. Refer to
+	docs/buildroot.html#using for details.
+
+	Target defconfig files moved to configs/ and listed in 'make help'
+	output.
+
 	Fixed *clean targets. Now clean removes everything generated,
 	so you can do a fresh rebuild. Distclean furthermore removes
 	kbuild tools and .config, bringing the source tree back in a
 	pristine state.
 
-	Toolchain: ARM cortex A8 support, GCC 4.4.2.
+	Toolchain: ARM cortex A8 support, GCC 4.4.2, sensible default
+	soft / hardfloat setting for architecture, ensure target-ldd
+	gets installed.
 
 	New packages: divine, gvfs, libarchive, libmicrohttpd,
 	sdl_sound, swfdec, sysstat
-- 
1.6.3.3
