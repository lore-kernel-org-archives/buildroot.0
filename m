From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 13 May 2014 10:49:03 +0200
Subject: [Buildroot] [git commit] Update for 2014.05-rc1
Message-ID: <20140513084927.425BD9CACE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=921a9efa40f8ec2574700fcff5074a60f409cf72
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES            |    2 +-
 Makefile           |    2 +-
 docs/download.html |   14 +++++++-------
 docs/news.html     |   13 +++++++++++++
 4 files changed, 22 insertions(+), 9 deletions(-)

diff --git a/CHANGES b/CHANGES
index d4fe2aa..e9cdd56 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,4 +1,4 @@
-2014.05, Not yet released:
+2014.05-rc1, Released May 13th, 2014
 
 	Fixes all over the tree and new features.
 
diff --git a/Makefile b/Makefile
index 4b06ab5..6d97262 100644
--- a/Makefile
+++ b/Makefile
@@ -25,7 +25,7 @@
 #--------------------------------------------------------------
 
 # Set and export the version string
-export BR2_VERSION := 2014.05-git
+export BR2_VERSION := 2014.05-rc1
 
 # Check for minimal make version (note: this check will break at make 10.x)
 MIN_MAKE_VERSION = 3.81
diff --git a/docs/download.html b/docs/download.html
index 828b49c..2d18c65 100644
--- a/docs/download.html
+++ b/docs/download.html
@@ -14,17 +14,17 @@ or
 (<a href="/downloads/buildroot-2014.02.tar.bz2.sign">PGP signature</a>).
 
 <p>
-<!--
-The latest release candidate is <b>2014.02-rc3</b>, which can be
+
+The latest release candidate is <b>2014.05-rc1</b>, which can be
 downloaded here:<p>
 
-<a href="/downloads/buildroot-2014.02-rc3.tar.gz">buildroot-2014.02-rc3.tar.gz</a>
-(<a href="/downloads/buildroot-2014.02-rc3.tar.gz.sign">PGP signature</a>)
+<a href="/downloads/buildroot-2014.05-rc1.tar.gz">buildroot-2014.05-rc1.tar.gz</a>
+(<a href="/downloads/buildroot-2014.05-rc1.tar.gz.sign">PGP signature</a>)
 or
-<a href="/downloads/buildroot-2014.02-rc3.tar.bz2">buildroot-2014.02-rc3.tar.bz2</a>
-(<a href="/downloads/buildroot-2014.02-rc3.tar.bz2.sign">PGP signature</a>).
+<a href="/downloads/buildroot-2014.05-rc1.tar.bz2">buildroot-2014.05-rc1.tar.bz2</a>
+(<a href="/downloads/buildroot-2014.05-rc1.tar.bz2.sign">PGP signature</a>).
 <p>
--->
+
 This and earlier releases (and their PGP signatures) can always be downloaded from
 <a href="/downloads/">http://buildroot.net/downloads/</a>.
 
diff --git a/docs/news.html b/docs/news.html
index 56d7f1d..8a6f642 100644
--- a/docs/news.html
+++ b/docs/news.html
@@ -6,6 +6,19 @@
 
 <ul>
 
+  <li><b>13 May 2014 -- 2014.05-rc1 released</b>
+
+    <p>We have a new release candidate! Lots of changes all over the
+    tree, see the <a
+    href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2014.05-rc1">CHANGES</a>
+    file for details.</p>
+
+    <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
+    <a href="/downloads/buildroot-2014.05-rc1.tar.bz2">2014.05-rc1
+    release candidate</a>, and report any problems found to the
+    <a href="support.html">mailing list</a> or
+    <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+
   <li><b>27 February 2014 -- 2014.02 released</b>
 
     <p>The stable 2014.02 release is out - Thanks to everyone
