From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 4 May 2015 21:28:31 +0200
Subject: [Buildroot] [git commit] Update for 2015.05-rc1
Message-ID: <20150504192859.7C5FE818A3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5628a15a69ad386a04af24f6dab130cdca01bf23
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                    |    2 +-
 Makefile                   |    2 +-
 docs/website/download.html |   14 +++++++-------
 docs/website/news.html     |   13 +++++++++++++
 4 files changed, 22 insertions(+), 9 deletions(-)

diff --git a/CHANGES b/CHANGES
index 975fa1b..e28eef7 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,4 +1,4 @@
-2015.05, Not yet released
+2015.05-rc1, Released May 4th, 2015
 
 	Fixes all over the tree and new features.
 
diff --git a/Makefile b/Makefile
index 3983fce..282c7ea 100644
--- a/Makefile
+++ b/Makefile
@@ -28,7 +28,7 @@
 all:
 
 # Set and export the version string
-export BR2_VERSION := 2015.05-git
+export BR2_VERSION := 2015.05-rc1
 
 # Check for minimal make version (note: this check will break at make 10.x)
 MIN_MAKE_VERSION = 3.81
diff --git a/docs/website/download.html b/docs/website/download.html
index e8cde7d..6a880c6 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -17,22 +17,22 @@ or
 (<a href="/downloads/buildroot-2015.02.tar.bz2.sign">PGP signature</a>).
 
 <p>
-<!--
-The latest release candidate is <b>2015.02-rc3</b>, which can be
+
+The latest release candidate is <b>2015.05-rc1</b>, which can be
 downloaded here:<p>
 
-<a href="/downloads/buildroot-2015.02-rc3.tar.gz">buildroot-2015.02-rc3.tar.gz</a>
-(<a href="/downloads/buildroot-2015.02-rc3.tar.gz.sign">PGP signature</a>)
+<a href="/downloads/buildroot-2015.05-rc1.tar.gz">buildroot-2015.05-rc1.tar.gz</a>
+(<a href="/downloads/buildroot-2015.05-rc1.tar.gz.sign">PGP signature</a>)
 or
-<a href="/downloads/buildroot-2015.02-rc3.tar.bz2">buildroot-2015.02-rc3.tar.bz2</a>
-(<a href="/downloads/buildroot-2015.02-rc3.tar.bz2.sign">PGP signature</a>).
+<a href="/downloads/buildroot-2015.05-rc1.tar.bz2">buildroot-2015.05-rc1.tar.bz2</a>
+(<a href="/downloads/buildroot-2015.05-rc1.tar.bz2.sign">PGP signature</a>).
 <p>
 
 This and earlier releases (and their PGP signatures) can always be downloaded from
 <a href="/downloads/">http://buildroot.net/downloads/</a>.
 
 <p>
--->
+
 You can also obtain daily snapshots of the latest Buildroot source tree if you
 want to follow development, but cannot or do not wish to use Git.
 
diff --git a/docs/website/news.html b/docs/website/news.html
index 308152a..eef668c 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -8,6 +8,19 @@
 <p>
 
 <ul>
+  <li><b>4 May 2015 -- 2015.05-rc1 released</b>
+
+    <p>We have a new release candidate! Lots of changes all over the
+    tree, see the <a
+    href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2015.05-rc1">CHANGES</a>
+    file for details.</p>
+
+    <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
+    <a href="/downloads/buildroot-2015.05-rc1.tar.bz2">2015.05-rc1
+    release candidate</a>, and report any problems found to the
+    <a href="support.html">mailing list</a> or
+    <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+
   <li><b>1 March 2015 -- 2015.02 released</b>
 
     <p>The stable 2015.02 release is out - Thanks to everyone
