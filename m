From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 21 May 2010 15:26:27 +0200
Subject: [Buildroot] [PATCH 1/2] Extend the introduction page
In-Reply-To: <cover.1274448358.git.thomas.petazzoni@free-electrons.com>
References: <cover.1274448358.git.thomas.petazzoni@free-electrons.com>
Message-ID: <5ee1551cef6d883ebaf70f4296f1207a3ce896c8.1274448358.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/about.html |   61 +++++++++++++++++++++++++++++++++++++++++-------------
 1 files changed, 46 insertions(+), 15 deletions(-)

diff --git a/docs/about.html b/docs/about.html
index 89ca62b..b985c4f 100644
--- a/docs/about.html
+++ b/docs/about.html
@@ -12,22 +12,53 @@
 </a>
 </div>
 
-Buildroot is a set of Makefiles and patches that makes it easy to generate a
-cross-compilation toolchain and root filesystem for your target Linux
-system using the <a href= "http://www.uclibc.org/">uClibc C library</a>.
-Buildroot is useful mainly for people working with small or embedded
-systems.  Embedded systems often use processors that are not the regular
-x86 processors everyone is used to using on their PC. It can be PowerPC
-processors, MIPS processors, ARM processors, etc.  And to be extra safe,
-you do not need to be root to build or run Buildroot.
-
-<p>
-
-Buildroot is maintained by <a href=
-"mailto:jacmet@uclibc.org">Peter Korsgaard</a>, and
-licensed under the
+<p>Buildroot is a set of Makefiles and patches that makes it easy to
+generate a complete embedded Linux system. Buildroot can generate any
+or all of a cross-compilation toolchain, a root filesystem, a kernel
+image and a bootloader image. Buildroot is useful mainly for people
+working with small or embedded systems, using various CPU
+architectures (x86, ARM, MIPS, PowerPC, etc.) : it automates the
+building process of your embedded system and eases the
+cross-compilation process.</p>
+
+<p>The major Buildroot features are:</p>
+
+<ul>
+
+  <li>Can <b>handle everything</b> in your embedded system development
+  project: cross-compiling toolchain, root filesystem generation,
+  kernel image compilation and bootloader compilation. Buildroot is
+  also sufficiently flexible that it can also be used for only one or
+  several of these steps.</li>
+
+  <li>Is <b>very easy</b> to set up, thanks to its menuconfig and
+  xconfig configuration interfaces, familiar to all embedded Linux
+  developers. Building a basic embedded Linux system with Buildroot
+  typically takes 15-30 minutes.</li>
+
+  <li>Supports <b>several hundreds of packages</b> for userspace
+  applications and libraries: X.org stack, Gtk2, Qt, DirectFB, SDL,
+  GStreamer and a large number of network-related and system-related
+  utilities and libraries are supported.</li>
+
+  <li>Supports <b>multiple filesystem types</b> for the root
+  filesystem image: JFFS2, UBIFS, tarballs, romfs, cramfs, squashfs
+  and more.</li>
+
+  <li>Can generate an uClibc cross-compilation toolchain, or re-use
+  your existing glibc, eglibc or uClibc cross-compilation
+  toolchain</li>
+
+  <li>Has a <b>simple structure</b> that makes it easy to understand
+  and extend. It relies only on the well-know Makefile language.</li>
+
+</ul>
+
+<p>Buildroot is maintained by <a href=
+"mailto:jacmet@uclibc.org">Peter Korsgaard</a>, and licensed under the
 <a href="http://www.gnu.org/licenses/old-licenses/gpl-2.0.html">GNU
-GENERAL PUBLIC LICENSE V2 (Or later)</a>.
+GENERAL PUBLIC LICENSE V2 (Or later)</a>. Stable releases are
+delivered every three months.</p>
 
 
 <!--#include file="footer.html" -->
-- 
1.6.3.3
