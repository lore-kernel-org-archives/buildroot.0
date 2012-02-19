From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 19 Feb 2012 23:16:50 +0100
Subject: [Buildroot] [git commit] Update for 2012.02-rc2
Message-ID: <20120219221725.E877790AC7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3d6ff4f5271f6b5c139ffd226b6ab6c90d2a81aa
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES            |   15 ++++++++++++++-
 Makefile           |    2 +-
 docs/download.html |    6 +++---
 docs/news.html     |   15 ++++++++++++++-
 4 files changed, 32 insertions(+), 6 deletions(-)

diff --git a/CHANGES b/CHANGES
index 21de451..b2f8d7a 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,4 +1,17 @@
-2012.02-rc1: Released February 12th, 2012:
+2012.02-rc2, Released February 19th, 2012:
+
+	Fixes all over the tree.
+
+	Toolchain: uClibc: Added upstream post-0.9.33 fixes, Bump
+	linux-headers 3.0.x / 3.2.x stable versions.
+
+	Documentation: Added makedev / <pkg>_DEVICES /
+	<pkg>_PERMISSIONS documentation.
+
+	Updated/fixed packages: busybox, ffmpeg, gst-dsp, libecore,
+	libvncserver, mxml, python.
+
+2012.02-rc1, Released February 12th, 2012:
 
 	Fixes all over the tree and new features.
 
diff --git a/Makefile b/Makefile
index 7d8dd2e..428084b 100644
--- a/Makefile
+++ b/Makefile
@@ -24,7 +24,7 @@
 #--------------------------------------------------------------
 
 # Set and export the version string
-export BR2_VERSION:=2012.02-rc1
+export BR2_VERSION:=2012.02-rc2
 
 # Check for minimal make version (note: this check will break at make 10.x)
 MIN_MAKE_VERSION=3.81
diff --git a/docs/download.html b/docs/download.html
index 3e43cdf..ae6a261 100644
--- a/docs/download.html
+++ b/docs/download.html
@@ -14,12 +14,12 @@ or
 <a href="/downloads/buildroot-2011.11.tar.bz2">buildroot-2011.11.tar.bz2</a>.
 <p>
 
-The latest release candidate is <b>2012.02-rc1</b>, which can be
+The latest release candidate is <b>2012.02-rc2</b>, which can be
 downloaded here:<p>
 
-<a href="/downloads/buildroot-2012.02-rc1.tar.gz">buildroot-2012.02-rc1.tar.gz</a>
+<a href="/downloads/buildroot-2012.02-rc2.tar.gz">buildroot-2012.02-rc2.tar.gz</a>
 or
-<a href="/downloads/buildroot-2012.02-rc1.tar.bz2">buildroot-2012.02-rc1.tar.bz2</a>.
+<a href="/downloads/buildroot-2012.02-rc2.tar.bz2">buildroot-2012.02-rc2.tar.bz2</a>.
 <p>
 
 This and earlier releases can always be downloaded from
diff --git a/docs/news.html b/docs/news.html
index 9b50a55..4871245 100644
--- a/docs/news.html
+++ b/docs/news.html
@@ -5,7 +5,20 @@
 <p>
 
 <ul>
-  <li><b>12 December 2012 -- 2012.02-rc1 released</b>
+  <li><b>19 February 2012 -- 2012.02-rc2 released</b>
+
+    <p>Another week, another release candidate with more cleanups and
+    build fixes. See the <a
+    href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2012.02_rc2">CHANGES</a>
+    file for details.</p>
+
+    <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
+    <a href="/downloads/buildroot-2012.02-rc2.tar.bz2">2012.02-rc2
+    release candidate</a>, and report any problems found to the <a
+    href="lists.html">mailing list</a> or <a
+    href="https://bugs.uclibc.org">bug tracker</a>.</p>
+
+  <li><b>12 February 2012 -- 2012.02-rc1 released</b>
 
     <p>We have a new release candidate! Lots of changes all over the
     tree, see the <a
