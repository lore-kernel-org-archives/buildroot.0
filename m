From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 24 Nov 2010 15:38:37 +0100
Subject: [Buildroot] [PATCH 3/8] documentation: Remove mention of gcc 3.x
In-Reply-To: <cover.1290609511.git.thomas.petazzoni@free-electrons.com>
References: <cover.1290609511.git.thomas.petazzoni@free-electrons.com>
Message-ID: <167302e722ed84dff2f673d88682444e4d0ef6ac.1290609511.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We don't support gcc 3.x anymore, so get rid of 3.x-specific details

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/buildroot.html |    9 +++------
 1 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/docs/buildroot.html b/docs/buildroot.html
index 571414b..333ea22 100644
--- a/docs/buildroot.html
+++ b/docs/buildroot.html
@@ -676,12 +676,9 @@ endif
     then to use <code>ARCH-linux-gcc</code>, <code>ARCH-linux-objdump</code>,
     <code>ARCH-linux-ld</code>, etc.</p>
 
-    <p><b>Important</b>: do not try to move a gcc-3.x toolchain to another
-    directory &mdash; it won't work because there are some hardcoded paths
-    in the gcc-3.x configuration. If you are using a current gcc-4.x, it is
-    possible to relocate the toolchain &mdash; but then <code>--sysroot</code>
-    must be passed every time the compiler is called to tell where the
-    libraries and header files are.</p>
+    <p>It is possible to relocate the toolchain &mdash; but
+    then <code>--sysroot</code> must be passed every time the compiler
+    is called to tell where the libraries and header files are.</p>
 
     <p>It is also possible to generate the Buildroot toolchain in a
     directory other than <code>output/staging</code> by using the <code>
-- 
1.7.0.4
