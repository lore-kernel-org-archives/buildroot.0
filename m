From: Francois Perrad <fperrad@gmail.com>
Date: Wed, 26 Mar 2014 19:46:09 +0100
Subject: [Buildroot] [PATCH] manual/using: output/toolchain is gone
Message-ID: <1395859569-23982-1-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 docs/manual/using.txt |    7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

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
-- 
1.7.9.5
