From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 8 Aug 2014 23:34:24 +0200
Subject: [Buildroot] [git commit] Update for 2014.08-rc1
Message-ID: <20140808213640.93BD89D3E6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7e725e1333a16630f74bd28f7adeb0f145022e7d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES            |    2 +-
 Makefile           |    2 +-
 docs/download.html |   14 +++++++-------
 docs/news.html     |   13 +++++++++++++
 4 files changed, 22 insertions(+), 9 deletions(-)

diff --git a/CHANGES b/CHANGES
index 009108d..5888842 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,4 +1,4 @@
-2014.08, Not yet released
+2014.08-rc1, Released August 8th, 2014
 
 	Fixes all over the tree and new features.
 
diff --git a/Makefile b/Makefile
index 022beea..5d84c4b 100644
--- a/Makefile
+++ b/Makefile
@@ -25,7 +25,7 @@
 #--------------------------------------------------------------
 
 # Set and export the version string
-export BR2_VERSION := 2014.08-git
+export BR2_VERSION := 2014.08-rc1
 
 # Check for minimal make version (note: this check will break at make 10.x)
 MIN_MAKE_VERSION = 3.81
diff --git a/docs/download.html b/docs/download.html
index da58068..74f1325 100644
--- a/docs/download.html
+++ b/docs/download.html
@@ -14,22 +14,22 @@ or
 (<a href="/downloads/buildroot-2014.05.tar.bz2.sign">PGP signature</a>).
 
 <p>
-<!--
-The latest release candidate is <b>2014.05-rc3</b>, which can be
+
+The latest release candidate is <b>2014.08-rc1</b>, which can be
 downloaded here:<p>
 
-<a href="/downloads/buildroot-2014.05-rc3.tar.gz">buildroot-2014.05-rc3.tar.gz</a>
-(<a href="/downloads/buildroot-2014.05-rc3.tar.gz.sign">PGP signature</a>)
+<a href="/downloads/buildroot-2014.08-rc1.tar.gz">buildroot-2014.08-rc1.tar.gz</a>
+(<a href="/downloads/buildroot-2014.08-rc1.tar.gz.sign">PGP signature</a>)
 or
-<a href="/downloads/buildroot-2014.05-rc3.tar.bz2">buildroot-2014.05-rc3.tar.bz2</a>
-(<a href="/downloads/buildroot-2014.05-rc3.tar.bz2.sign">PGP signature</a>).
+<a href="/downloads/buildroot-2014.08-rc1.tar.bz2">buildroot-2014.08-rc1.tar.bz2</a>
+(<a href="/downloads/buildroot-2014.08-rc1.tar.bz2.sign">PGP signature</a>).
 <p>
 
 This and earlier releases (and their PGP signatures) can always be downloaded from
 <a href="/downloads/">http://buildroot.net/downloads/</a>.
 
 <p>
--->
+
 You can also obtain <a href="/downloads/snapshots/">Daily
 Snapshots</a> of the latest Buildroot source tree if you want to to
 follow development, but cannot or do not wish to use Git.
diff --git a/docs/news.html b/docs/news.html
index 19f2b13..b308cd6 100644
--- a/docs/news.html
+++ b/docs/news.html
@@ -6,6 +6,19 @@
 
 <ul>
 
+  <li><b>8 August 2014 -- 2014.08-rc1 released</b>
+
+    <p>We have a new release candidate! Lots of changes all over the
+    tree, see the <a
+    href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2014.08-rc1">CHANGES</a>
+    file for details.</p>
+
+    <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
+    <a href="/downloads/buildroot-2014.08-rc1.tar.bz2">2014.08-rc1
+    release candidate</a>, and report any problems found to the
+    <a href="support.html">mailing list</a> or
+    <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+
   <li><b>31 May 2014 -- 2014.05 released</b>
 
     <p>The stable 2014.05 release is out - Thanks to everyone
