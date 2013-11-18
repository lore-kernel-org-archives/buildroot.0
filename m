From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 18 Nov 2013 22:22:17 +0100
Subject: [Buildroot] [git commit] Update for 2013.11-rc2
Message-ID: <20131118212247.B2F309BD33@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b87c05dc95d7167d867f2aad132a1e908090b1ae
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES            |   22 ++++++++++++++++++++++
 Makefile           |    2 +-
 docs/download.html |    6 +++---
 docs/news.html     |   13 +++++++++++++
 4 files changed, 39 insertions(+), 4 deletions(-)

diff --git a/CHANGES b/CHANGES
index b1edb5c..93673c3 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,25 @@
+2013.11-rc2, Released November 18th, 2013
+
+	Fixes all over the tree.
+
+	Defconfigs: qemu_arm_versatile, qemu_arm_nuri, sheevaplug:
+	Adjust kernel versions.
+
+	Toolchain: avr32: fix for modern kernel headers
+
+	Bootloader: Barebox updated to 2013.10.1
+
+	Updated/fixed packages: dhcp, e2fsprogs, gst1-plugins-bad,
+	libcurl, libvncserver, nano, pc, qt5base, squashfs, ttcp,
+	wayland, wvstreams
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#3601: DHCPD S80dhcp-server startup script issues
+	#6320: Fix kernel compile issue if BR2_LINUX_KERNEL_CUSTOM_GIT_VERS..
+	#6416: Xenomai package, patch alternative
+	#6590: directfb-examples build failed whit linaro toolchain
+
 2013.11-rc1, Released November 12th, 2013
 
 	Architectures: Nios-II support, MIPS arch handling fixes
diff --git a/Makefile b/Makefile
index c7a0a6d..685e0ee 100644
--- a/Makefile
+++ b/Makefile
@@ -24,7 +24,7 @@
 #--------------------------------------------------------------
 
 # Set and export the version string
-export BR2_VERSION:=2013.11-rc1
+export BR2_VERSION:=2013.11-rc2
 
 # Check for minimal make version (note: this check will break at make 10.x)
 MIN_MAKE_VERSION=3.81
diff --git a/docs/download.html b/docs/download.html
index 64d774d..55e3538 100644
--- a/docs/download.html
+++ b/docs/download.html
@@ -15,12 +15,12 @@ or
 
 <p>
 
-The latest release candidate is <b>2013.11-rc1</b>, which can be
+The latest release candidate is <b>2013.11-rc2</b>, which can be
 downloaded here:<p>
 
-<a href="/downloads/buildroot-2013.11-rc1.tar.gz">buildroot-2013.11-rc1.tar.gz</a>
+<a href="/downloads/buildroot-2013.11-rc2.tar.gz">buildroot-2013.11-rc2.tar.gz</a>
 or
-<a href="/downloads/buildroot-2013.11-rc1.tar.bz2">buildroot-2013.11-rc1.tar.bz2</a>.
+<a href="/downloads/buildroot-2013.11-rc2.tar.bz2">buildroot-2013.11-rc2.tar.bz2</a>.
 <p>
 
 This and earlier releases can always be downloaded from
diff --git a/docs/news.html b/docs/news.html
index 12082eb..432c634 100644
--- a/docs/news.html
+++ b/docs/news.html
@@ -5,6 +5,19 @@
 <p>
 
 <ul>
+  <li><b>18 November 2013 -- 2013.11-rc2 released</b>
+
+    <p>Another week, another release candidate with more cleanups and
+    build fixes. See the <a
+    href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2013.11-rc2">CHANGES</a>
+    file for details.</p>
+
+    <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
+    <a href="/downloads/buildroot-2013.11-rc2.tar.bz2">2013.11-rc2
+    release candidate</a>, and report any problems found to the <a
+    href="lists.html">mailing list</a> or <a
+    href="https://bugs.uclibc.org">bug tracker</a>.</p>
+
   <li><b>13 November 2013 -- Announcement of the next Buildroot Developer Days</b>
 
     <p>The next <i>Buildroot Developer Days</i> meeting will take
