From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 17 Nov 2012 23:55:55 +0100
Subject: [Buildroot] [git commit] Update for 2012.11-rc1
Message-ID: <20121117225902.149D79A081@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=47ee3051fc49d928d3ba6f83a8dea4102d8536f4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES            |    2 +-
 Makefile           |    2 +-
 docs/download.html |    9 ++++-----
 docs/news.html     |   13 +++++++++++++
 4 files changed, 19 insertions(+), 7 deletions(-)

diff --git a/CHANGES b/CHANGES
index 9c3be6b..f8ac04b 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,4 +1,4 @@
-2012.11, Not released yet:
+2012.11-rc1, Released November 17th, 2012
 
 	Fixes all over the tree and new features.
 
diff --git a/Makefile b/Makefile
index 7602499..21aa054 100644
--- a/Makefile
+++ b/Makefile
@@ -24,7 +24,7 @@
 #--------------------------------------------------------------
 
 # Set and export the version string
-export BR2_VERSION:=2012.11-git
+export BR2_VERSION:=2012.11-rc1
 
 # Check for minimal make version (note: this check will break at make 10.x)
 MIN_MAKE_VERSION=3.81
diff --git a/docs/download.html b/docs/download.html
index 51b7a82..c34a311 100644
--- a/docs/download.html
+++ b/docs/download.html
@@ -13,16 +13,15 @@ here:<p>
 or
 <a href="/downloads/buildroot-2012.08.tar.bz2">buildroot-2012.08.tar.bz2</a>.
 
-<!--
 <p>
-The latest release candidate is <b>2012.08-rc3</b>, which can be
+The latest release candidate is <b>2012.11-rc1</b>, which can be
 downloaded here:<p>
 
-<a href="/downloads/buildroot-2012.08-rc3.tar.gz">buildroot-2012.08-rc3.tar.gz</a>
+<a href="/downloads/buildroot-2012.11-rc1.tar.gz">buildroot-2012.11-rc1.tar.gz</a>
 or
-<a href="/downloads/buildroot-2012.08-rc3.tar.bz2">buildroot-2012.08-rc3.tar.bz2</a>.
+<a href="/downloads/buildroot-2012.11-rc1.tar.bz2">buildroot-2012.11-rc1.tar.bz2</a>.
 <p>
--->
+
 This and earlier releases can always be downloaded from
 <a href="/downloads/">http://buildroot.net/downloads/</a>.
 
diff --git a/docs/news.html b/docs/news.html
index 416857c..e1e641d 100644
--- a/docs/news.html
+++ b/docs/news.html
@@ -5,6 +5,19 @@
 <p>
 
 <ul>
+  <li><b>17 November 2012 -- 2012.11-rc1 released</b>
+
+    <p>We have a new release candidate! Lots of changes all over the
+    tree, see the <a
+    href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2012.11_rc1">CHANGES</a>
+    file for details.</p>
+
+    <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
+    <a href="/downloads/buildroot-2012.11-rc1.tar.bz2">2012.11-rc1
+    release candidate</a>, and report any problems found to the <a
+    href="lists.html">mailing list</a> or <a
+    href="https://bugs.uclibc.org">bug tracker</a>.</p>
+
   <li><b>17 November 2012 -- Buildroot Developer Day</b>
 
     <p>A report from the recent <i>Buildroot Developer Days</i> meeting
