From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 29 Feb 2012 23:19:47 +0100
Subject: [Buildroot] [git commit] Update for 2012.02
Message-ID: <20120229222111.E41A390BBA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=03ceab6d1611cf378ac9bec92134354bcdd963d1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES            |    6 +++++-
 Makefile           |    2 +-
 docs/download.html |   10 +++++-----
 docs/news.html     |    9 +++++++++
 4 files changed, 20 insertions(+), 7 deletions(-)

diff --git a/CHANGES b/CHANGES
index fbb8c07..9c1db25 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,7 @@
+2012.02, Released February 29th, 2012:
+
+	Updated/fixed packages: libecore
+
 2012.02-rc3, Released February 27th, 2012:
 
 	Fixes all over the tree.
@@ -41,7 +45,7 @@
 	Host utilities menu with commonly used host tools.
 
 	defconfigs: qemu configs for x86-64, mips and sparc, at91
-	defconfigs now use moder U-Boot / mainline Linux, added
+	defconfigs now use modern U-Boot / mainline Linux, added
 	lpc3250 defconfigs.
 
 	uClibc: remove 0.9.30, backport unshare() support, add
diff --git a/Makefile b/Makefile
index 5e2d381..c9f0eab 100644
--- a/Makefile
+++ b/Makefile
@@ -24,7 +24,7 @@
 #--------------------------------------------------------------
 
 # Set and export the version string
-export BR2_VERSION:=2012.02-rc3
+export BR2_VERSION:=2012.02
 
 # Check for minimal make version (note: this check will break at make 10.x)
 MIN_MAKE_VERSION=3.81
diff --git a/docs/download.html b/docs/download.html
index 672e114..2802609 100644
--- a/docs/download.html
+++ b/docs/download.html
@@ -6,14 +6,14 @@
 
 <p>
 
-The latest stable release is <b>2011.11</b>, which can be downloaded
+The latest stable release is <b>2012.02</b>, which can be downloaded
 here:<p>
 
-<a href="/downloads/buildroot-2011.11.tar.gz">buildroot-2011.11.tar.gz</a>
+<a href="/downloads/buildroot-2012.02.tar.gz">buildroot-2012.02.tar.gz</a>
 or
-<a href="/downloads/buildroot-2011.11.tar.bz2">buildroot-2011.11.tar.bz2</a>.
+<a href="/downloads/buildroot-2012.02.tar.bz2">buildroot-2012.02.tar.bz2</a>.
 <p>
-
+<!--
 The latest release candidate is <b>2012.02-rc3</b>, which can be
 downloaded here:<p>
 
@@ -21,7 +21,7 @@ downloaded here:<p>
 or
 <a href="/downloads/buildroot-2012.02-rc3.tar.bz2">buildroot-2012.02-rc3.tar.bz2</a>.
 <p>
-
+-->
 This and earlier releases can always be downloaded from
 <a href="/downloads/">http://buildroot.net/downloads/</a>.
 
diff --git a/docs/news.html b/docs/news.html
index 5fcbdd4..650184a 100644
--- a/docs/news.html
+++ b/docs/news.html
@@ -5,6 +5,15 @@
 <p>
 
 <ul>
+  <li><b>29 February 2012 -- 2012.02 released</b>
+
+    <p>The stable 2012.02 release is out - Thanks to everyone
+    contributing and testing the release candidates. See the
+    <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2012.02">CHANGES</a>
+    file for more details,
+    and go to the <a href="/downloads/">downloads page</a> to pick up the
+    <a href="/downloads/buildroot-2012.02.tar.bz2">2012.02 release</a>.</p>
+
   <li><b>27 February 2012 -- 2012.02-rc3 released</b>
 
     <p>RC3 is out with more bugfixes - See the <a
