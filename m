From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Apr 2017 15:51:07 +0200
Subject: [Buildroot] [git commit] package/qt: fix header
Message-ID: <20170422135133.1B2D681E93@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=42ec2bd4a4ec7337c34772559024fcc9e135c898
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The header was non-standard according to check-package.

Signed-off-by: Adam Duskett <aduskett@codeblue.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qt/qt.mk | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index 2580ee7..690a4b4 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -1,13 +1,6 @@
 ################################################################################
 #
-# Qt Embedded for Linux
-#
-# This makefile was originally composed by Thomas Lundquist <thomasez@zelow.no>
-# Later heavily modified by buildroot developers
-#
-# BTW, this uses alot of FPU calls and it's pretty slow if you use
-# the kernels FPU emulation so it's better to choose soft float in the
-# buildroot config (and uClibc.config of course, if you have your own.)
+# qt
 #
 ################################################################################
 
