From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 12 May 2014 22:16:28 +0200
Subject: [Buildroot] [git commit] CHANGES: fix typos
Message-ID: <20140512204138.6EED29BE7B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=41d53bca67b4cdd77de9d272026a4eb3f4e2cd9d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Reported-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/CHANGES b/CHANGES
index d7e0582..b2106c3 100644
--- a/CHANGES
+++ b/CHANGES
@@ -20,7 +20,7 @@
 	for ARC, Internal toolchain support for Aarch64 and
 	Microblaze. Environment variable to control debug output of
 	toolchain wrapper renamed to BR2_DEBUG_WRAPPER to match the
-	other variables. Toolchain tupple vendor name can now be
+	other variables. Toolchain tuple vendor name can now be
 	customized. Updated external Linaro ARM/Aarch64
 	toolchains. Added external Linaro ARMEB toolchain.
 	A GDB gdbinit file is now generated for external toolchains to
@@ -31,7 +31,7 @@
 	features can specify these requirements in Kconfig.
 
 	Infrastructure: Support for (but disabled as it leads to
-	unreproducable builds) toplevel parallel builds. See the
+	unreproducible builds) toplevel parallel builds. See the
 	comment at the top of Makefile for details about how to enable
 	it and what the problems are if you want to test it.
 	Python package infrastructure extended to support Python 3.x
