From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 26 Mar 2014 22:32:54 +0100
Subject: [Buildroot] [git commit] manual/using: output/toolchain is gone
Message-ID: <20140326213335.3464B9C3A5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b7090a24d193c63adb259364c98263b0823b0643
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/using.txt |    7 ++-----
 1 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/docs/manual/using.txt b/docs/manual/using.txt
index 9b0a81f..4a33f7e 100644
--- a/docs/manual/using.txt
+++ b/docs/manual/using.txt
@@ -75,8 +75,8 @@ This directory contains several subdirectories:
 * +images/+ where all the images (kernel image, bootloader and root
   filesystem images) are stored.
 
-* +build/+ where all the components except for the cross-compilation
-  toolchain are built (this includes tools needed to run Buildroot on
+* +build/+ where all the components are built
+  (this includes tools needed to run Buildroot on
   the host and packages compiled for the target). The +build/+
   directory contains one subdirectory for each of these components.
 
@@ -108,9 +108,6 @@ This directory contains several subdirectories:
   that are needed for the proper execution of Buildroot, including the
   cross-compilation toolchain.
 
-* +toolchain/+ contains the build directories for the various
-  components of the cross-compilation toolchain.
-
 These commands, +make menuconfig|nconfig|gconfig|xconfig+ and +make+, are the
 basic ones that allow to easily and quickly generate images fitting
 your needs, with all the supports and applications you enabled.
