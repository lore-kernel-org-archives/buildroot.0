From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 24 Nov 2010 16:40:28 +0100
Subject: [Buildroot] [git commit master 1/1] documentation: Update details
	about external toolchains
Message-ID: <20101124154223.CF8D98DCB3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=6e2a35c9d484bdea1d7494c2569336a3a3af3816
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/buildroot.html |   18 +++++++++++-------
 1 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/docs/buildroot.html b/docs/buildroot.html
index 333ea22..aed3856 100644
--- a/docs/buildroot.html
+++ b/docs/buildroot.html
@@ -729,6 +729,17 @@ endif
     <ul>
       <li>Select the <code>External binary toolchain</code> toolchain
       type</li>
+      <li>Select the appropriate <code>External toolchain C
+      library</code></li>
+      <li>Select the appropriate values for <code>Enable large
+      file</code>, <code>Enable IPv6</code>, <code>Enable
+      RPC</code>, <code>Enable toolchain
+      locale/i18n</code>, <code>Enable WCHAR</code>, <code>Enable
+      program invocation</code>, <code>Build/install c++ compiler and
+      libstdc++</code>, according to the configuration of your
+      external toolchain. Buildroot will check those values at the
+      beginning of the compilation process and will tell you if you
+      used incorrect values.</li>
       <li>Adjust the <code>External toolchain path</code>
       appropriately. It should be set to a path where a bin/ directory
       contains your cross-compiling tools</li>
@@ -737,13 +748,6 @@ endif
       correspond to your cross-compiling tools</li>
     </ul>
 
-    <p>If you are using an external toolchain based on <i>uClibc</i>, the
-    <code>Core C library from the external toolchain</code> and
-    <code>Libraries to copy from the external toolchain</code> options
-    should already have correct values. However, if your external
-    toolchain is based on <i>glibc</i>, you'll have to change these values
-    according to your cross-compiling toolchain.</p>
-
     <p>To generate external toolchains, we recommend using
     <a href="http://ymorin.is-a-geek.org/dokuwiki/projects/crosstool">Crosstool-NG</a>.
     It allows generating toolchains based on <i>uClibc</i>, <i>glibc</i>
-- 
1.7.2.2
