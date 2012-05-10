From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 10 May 2012 19:07:20 +0200
Subject: [Buildroot] [git commit] Update for 2012.05-rc1
Message-ID: <20120510172117.449F096CA0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9f7bf3b63d820616fe8ce2f3fa485c22542f2acb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES            |    2 +-
 Makefile           |    2 +-
 docs/download.html |   10 +++++-----
 docs/news.html     |   13 +++++++++++++
 4 files changed, 20 insertions(+), 7 deletions(-)

diff --git a/CHANGES b/CHANGES
index 1a2b6ed..6b01c04 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,4 +1,4 @@
-2012.05, Not released yet:
+2012.05-rc1, Released May 10th, 2012
 
 	Fixes all over the tree and new features.
 
diff --git a/Makefile b/Makefile
index 1d7973e..96f9412 100644
--- a/Makefile
+++ b/Makefile
@@ -24,7 +24,7 @@
 #--------------------------------------------------------------
 
 # Set and export the version string
-export BR2_VERSION:=2012.05-git
+export BR2_VERSION:=2012.05-rc1
 
 # Check for minimal make version (note: this check will break at make 10.x)
 MIN_MAKE_VERSION=3.81
diff --git a/docs/download.html b/docs/download.html
index 2802609..7b22569 100644
--- a/docs/download.html
+++ b/docs/download.html
@@ -13,15 +13,15 @@ here:<p>
 or
 <a href="/downloads/buildroot-2012.02.tar.bz2">buildroot-2012.02.tar.bz2</a>.
 <p>
-<!--
-The latest release candidate is <b>2012.02-rc3</b>, which can be
+
+The latest release candidate is <b>2012.05-rc1</b>, which can be
 downloaded here:<p>
 
-<a href="/downloads/buildroot-2012.02-rc3.tar.gz">buildroot-2012.02-rc3.tar.gz</a>
+<a href="/downloads/buildroot-2012.05-rc1.tar.gz">buildroot-2012.05-rc1.tar.gz</a>
 or
-<a href="/downloads/buildroot-2012.02-rc3.tar.bz2">buildroot-2012.02-rc3.tar.bz2</a>.
+<a href="/downloads/buildroot-2012.05-rc1.tar.bz2">buildroot-2012.05-rc1.tar.bz2</a>.
 <p>
--->
+
 This and earlier releases can always be downloaded from
 <a href="/downloads/">http://buildroot.net/downloads/</a>.
 
diff --git a/docs/news.html b/docs/news.html
index e6d1b47..8c4871f 100644
--- a/docs/news.html
+++ b/docs/news.html
@@ -5,6 +5,19 @@
 <p>
 
 <ul>
+  <li><b>10 May 2012 -- 2012.05-rc1 released</b>
+
+    <p>We have a new release candidate! Lots of changes all over the
+    tree, see the <a
+    href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2012.05_rc1">CHANGES</a>
+    file for details</p>
+
+    <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
+    <a href="/downloads/buildroot-2012.05-rc1.tar.bz2">2012.05-rc1
+    release candidate</a>, and report any problems found to the <a
+    href="lists.html">mailing list</a> or <a
+    href="https://bugs.uclibc.org">bug tracker</a>.</p>
+
   <li><b>20 April 2012 -- Autobuilder Results Online</b>
 
     <p>The status of the autobuilders, which do repeated
