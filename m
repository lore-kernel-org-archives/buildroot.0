From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 24 Nov 2010 16:40:28 +0100
Subject: [Buildroot] [git commit master 1/1] documentation: clarify
	Buildroot steps
Message-ID: <20101124154223.51E828DCB3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=0d2804011b3ac9f1b204bec654a6effeb9e990e1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/buildroot.html |   11 +++++------
 1 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/docs/buildroot.html b/docs/buildroot.html
index 0a0114a..0b87bff 100644
--- a/docs/buildroot.html
+++ b/docs/buildroot.html
@@ -185,15 +185,14 @@
     <p>This command will generally perform the following steps:</p>
     <ul>
       <li>Download source files (as required)</li>
-      <li>Configure cross-compile toolchain</li>
-      <li>Build/install cross-compile toolchain</li>
+      <li>Configure, build and install the cross-compiling toolchain
+      if an internal toolchain is used, or import a toolchain if an
+      external toolchain is used</li>
       <li>Build/install selected target packages</li>
-      <li>Build a kernel image</li>
+      <li>Build a kernel image, if selected</li>
+      <li>Build a bootloader image, if selected</li>
       <li>Create a root filesystem in selected formats</li>
     </ul>
-    <p>Some of the above steps might not be performed if they are not
-    selected in the Buildroot configuration.
-   </p>
 
     <p>Buildroot output is stored in a single directory, <code>output/</code>.
     This directory contains several subdirectories:</p>
-- 
1.7.2.2
