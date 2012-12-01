From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 30 Nov 2012 22:59:02 -0800
Subject: [Buildroot] [git commit] Update for 2012.11-rc2
Message-ID: <20121201065940.C8B7C8B445@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1a59dfae0ce9e93da413285e7c47a16f7317123e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES            |   11 ++++++-----
 Makefile           |    2 +-
 docs/download.html |    6 +++---
 docs/news.html     |   12 ++++++++++++
 4 files changed, 22 insertions(+), 9 deletions(-)

diff --git a/CHANGES b/CHANGES
index 7e5de2e..98fa5c2 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,4 +1,4 @@
-2012.11, Not released yet:
+2012.11-rc2, Released November 30th, 2012:
 
 	Minor fixes around the tree.
 
@@ -7,10 +7,11 @@
 	Add checks for legacy features.
 
 	Updated/fixed packages: acpid, alsa-lib, arptables, binutils,
-	busybox, ccache, cjson, cramfs, directfb, flex, gdb, hiawatha,
-	imagemagick, lcdproc, libdaemon, libecore, libhid, libmad,
-	libpcap, libusb, linux-fusion, matchbox, ocf-linux, owl-linux,
-	scons, strace
+	busybox, ccache, cjson, cramfs, directfb, flex, fluxbox, gdb,
+	hiawatha, igh-ethercat, imagemagick, imlib2, lcdproc,
+	libdaemon, libecore, libhid, libmad, libpcap, libsigc, libusb,
+	linux-fusion, matchbox, ocf-linux, owl-linux, python, rrdtool,
+	scons, strace, sylpheed
 
 	Issues resolved (http://bugs.uclibc.org):
 
diff --git a/Makefile b/Makefile
index 1141ef2..d3f9b40 100644
--- a/Makefile
+++ b/Makefile
@@ -24,7 +24,7 @@
 #--------------------------------------------------------------
 
 # Set and export the version string
-export BR2_VERSION:=2012.11-rc1
+export BR2_VERSION:=2012.11-rc2
 
 # Check for minimal make version (note: this check will break at make 10.x)
 MIN_MAKE_VERSION=3.81
diff --git a/docs/download.html b/docs/download.html
index c34a311..cdf5950 100644
--- a/docs/download.html
+++ b/docs/download.html
@@ -14,12 +14,12 @@ or
 <a href="/downloads/buildroot-2012.08.tar.bz2">buildroot-2012.08.tar.bz2</a>.
 
 <p>
-The latest release candidate is <b>2012.11-rc1</b>, which can be
+The latest release candidate is <b>2012.11-rc2</b>, which can be
 downloaded here:<p>
 
-<a href="/downloads/buildroot-2012.11-rc1.tar.gz">buildroot-2012.11-rc1.tar.gz</a>
+<a href="/downloads/buildroot-2012.11-rc2.tar.gz">buildroot-2012.11-rc2.tar.gz</a>
 or
-<a href="/downloads/buildroot-2012.11-rc1.tar.bz2">buildroot-2012.11-rc1.tar.bz2</a>.
+<a href="/downloads/buildroot-2012.11-rc2.tar.bz2">buildroot-2012.11-rc2.tar.bz2</a>.
 <p>
 
 This and earlier releases can always be downloaded from
diff --git a/docs/news.html b/docs/news.html
index 94183e0..84f4cc3 100644
--- a/docs/news.html
+++ b/docs/news.html
@@ -5,6 +5,18 @@
 <p>
 
 <ul>
+  <li><b>30 November 2012 -- 2012.11-rc2 released</b>
+
+    <p>RC2 is out with more bugfixes - See the <a
+    href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2012.11_rc2">CHANGES</a>
+    file for details.
+
+    <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
+    <a href="/downloads/buildroot-2012.11-rc2.tar.bz2">2012.11-rc2
+    release candidate</a>, and report any problems found to the <a
+    href="lists.html">mailing list</a> or <a
+    href="https://bugs.uclibc.org">bug tracker</a>.</p>
+
   <li><b>17 November 2012 -- 2012.11-rc1 released</b>
 
     <p>We have a new release candidate! Lots of changes all over the
