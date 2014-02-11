From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 11 Feb 2014 12:37:42 +0100
Subject: [Buildroot] [git commit] Update for 2014.02-rc1
Message-ID: <20140211123543.558CC9C541@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=690984cf61aa3ce633584766b2bc78bec2e3c420
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES            |    2 +-
 Makefile           |    2 +-
 docs/download.html |   14 +++++++-------
 docs/news.html     |   13 +++++++++++++
 4 files changed, 22 insertions(+), 9 deletions(-)

diff --git a/CHANGES b/CHANGES
index 416eec6..8a73cc1 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,4 +1,4 @@
-2014.02, Not yet released:
+2014.02-rc1, Released February 11th, 2014
 
 	Fixes all over the tree and new features.
 
diff --git a/Makefile b/Makefile
index 72b11b8..9929e7e 100644
--- a/Makefile
+++ b/Makefile
@@ -24,7 +24,7 @@
 #--------------------------------------------------------------
 
 # Set and export the version string
-export BR2_VERSION:=2014.02-git
+export BR2_VERSION:=2014.02-rc1
 
 # Check for minimal make version (note: this check will break at make 10.x)
 MIN_MAKE_VERSION=3.81
diff --git a/docs/download.html b/docs/download.html
index 4cf44cc..1d2a8af 100644
--- a/docs/download.html
+++ b/docs/download.html
@@ -16,17 +16,17 @@ or
 (<a href="/downloads/buildroot-2013.11.tar.bz2.sign">PGP signature</a>).
 
 <p>
-<!--
-The latest release candidate is <b>2013.11-rc3</b>, which can be
+
+The latest release candidate is <b>2014.02-rc1</b>, which can be
 downloaded here:<p>
 
-<a href="/downloads/buildroot-2013.11-rc3.tar.gz">buildroot-2013.11-rc3.tar.gz</a>
-(<a href="/downloads/buildroot-2013.11-rc3.tar.gz.sign">PGP signature</a>)
+<a href="/downloads/buildroot-2014.02-rc1.tar.gz">buildroot-2014.02-rc1.tar.gz</a>
+(<a href="/downloads/buildroot-2014.02-rc1.tar.gz.sign">PGP signature</a>)
 or
-<a href="/downloads/buildroot-2013.11-rc3.tar.bz2">buildroot-2013.11-rc3.tar.bz2</a>
-(<a href="/downloads/buildroot-2013.11-rc3.tar.bz2.sign">PGP signature</a>).
+<a href="/downloads/buildroot-2014.02-rc1.tar.bz2">buildroot-2014.02-rc1.tar.bz2</a>
+(<a href="/downloads/buildroot-2014.02-rc1.tar.bz2.sign">PGP signature</a>).
 <p>
--->
+
 This and earlier releases (and their PGP signatures) can always be downloaded from
 <a href="/downloads/">http://buildroot.net/downloads/</a>.
 
diff --git a/docs/news.html b/docs/news.html
index 200d770..e473ba0 100644
--- a/docs/news.html
+++ b/docs/news.html
@@ -5,6 +5,19 @@
 <p>
 
 <ul>
+  <li><b>11 February 2014 -- 2014.02-rc1 released</b>
+
+    <p>We have a new release candidate! Lots of changes all over the
+    tree, see the <a
+    href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2014.02-rc1">CHANGES</a>
+    file for details.</p>
+
+    <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
+    <a href="/downloads/buildroot-2014.02-rc1.tar.bz2">2014.02-rc1
+    release candidate</a>, and report any problems found to the
+    <a href="lists.html">mailing list</a> or
+    <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+
   <li><b>9 February 2014 -- Report from Buildroot Developers Meeting</b>
 
     <p>A report from the recent
