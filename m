From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 27 Feb 2012 16:49:38 +0100
Subject: [Buildroot] [git commit] Update for 2012.02-rc3
Message-ID: <20120227155010.9904790BA6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6d24b41b097df67f73afc52babe8c454ebb30710
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES            |   15 +++++++++++++++
 Makefile           |    2 +-
 docs/download.html |    6 +++---
 docs/news.html     |   12 ++++++++++++
 4 files changed, 31 insertions(+), 4 deletions(-)

diff --git a/CHANGES b/CHANGES
index b2f8d7a..fbb8c07 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,18 @@
+2012.02-rc3, Released February 27th, 2012:
+
+	Fixes all over the tree.
+
+	Automatic host dependencies handling for cmake packages
+	fixed. Customize package deprecated as using a post-build
+	script is nowadays the preferred way of adding extra stuff to
+	the rootfs.
+
+	Linux-headers 3.0.x / 3.2.x stable version bumped.
+
+	QEMU defconfigs updated to 3.2.x kernels and readme fixed.
+
+	Updated/fixed packages: dropbear, ffmpeg, libpng
+
 2012.02-rc2, Released February 19th, 2012:
 
 	Fixes all over the tree.
diff --git a/Makefile b/Makefile
index 428084b..5e2d381 100644
--- a/Makefile
+++ b/Makefile
@@ -24,7 +24,7 @@
 #--------------------------------------------------------------
 
 # Set and export the version string
-export BR2_VERSION:=2012.02-rc2
+export BR2_VERSION:=2012.02-rc3
 
 # Check for minimal make version (note: this check will break at make 10.x)
 MIN_MAKE_VERSION=3.81
diff --git a/docs/download.html b/docs/download.html
index ae6a261..672e114 100644
--- a/docs/download.html
+++ b/docs/download.html
@@ -14,12 +14,12 @@ or
 <a href="/downloads/buildroot-2011.11.tar.bz2">buildroot-2011.11.tar.bz2</a>.
 <p>
 
-The latest release candidate is <b>2012.02-rc2</b>, which can be
+The latest release candidate is <b>2012.02-rc3</b>, which can be
 downloaded here:<p>
 
-<a href="/downloads/buildroot-2012.02-rc2.tar.gz">buildroot-2012.02-rc2.tar.gz</a>
+<a href="/downloads/buildroot-2012.02-rc3.tar.gz">buildroot-2012.02-rc3.tar.gz</a>
 or
-<a href="/downloads/buildroot-2012.02-rc2.tar.bz2">buildroot-2012.02-rc2.tar.bz2</a>.
+<a href="/downloads/buildroot-2012.02-rc3.tar.bz2">buildroot-2012.02-rc3.tar.bz2</a>.
 <p>
 
 This and earlier releases can always be downloaded from
diff --git a/docs/news.html b/docs/news.html
index 4871245..5fcbdd4 100644
--- a/docs/news.html
+++ b/docs/news.html
@@ -5,6 +5,18 @@
 <p>
 
 <ul>
+  <li><b>27 February 2012 -- 2012.02-rc3 released</b>
+
+    <p>RC3 is out with more bugfixes - See the <a
+    href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2012.02_rc3">CHANGES</a>
+    file for details.
+
+    <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
+    <a href="/downloads/buildroot-2012.02-rc3.tar.bz2">2012.02-rc3
+    release candidate</a>, and report any problems found to the <a
+    href="lists.html">mailing list</a> or <a
+    href="https://bugs.uclibc.org">bug tracker</a>.</p>
+
   <li><b>19 February 2012 -- 2012.02-rc2 released</b>
 
     <p>Another week, another release candidate with more cleanups and
