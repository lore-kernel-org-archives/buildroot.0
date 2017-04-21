From: Adam Duskett <aduskett@gmail.com>
Date: Fri, 21 Apr 2017 11:24:52 -0400
Subject: [Buildroot] [PATCH 7/7] qt.mk: fix header.
In-Reply-To: <20170421152452.11236-1-aduskett@codeblue.com>
References: <20170421152452.11236-1-aduskett@codeblue.com>
Message-ID: <20170421152452.11236-7-aduskett@codeblue.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The header was non-standard according to check-package.

Signed-off-by: Adam Duskett <aduskett@codeblue.com>
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
 
-- 
2.9.3
