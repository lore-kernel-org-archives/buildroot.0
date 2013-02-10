From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 10 Feb 2013 11:07:12 +0100
Subject: [Buildroot] [git commit] Update for 2013.02-rc1
Message-ID: <20130210124352.4D07C9A9B4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e68acefb3bad6c61a214c9919c8f76fdf4739b03
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES            |    2 +-
 Makefile           |    2 +-
 docs/download.html |   10 +++++-----
 docs/news.html     |   13 +++++++++++++
 4 files changed, 20 insertions(+), 7 deletions(-)

diff --git a/CHANGES b/CHANGES
index 63a16fd..02dbc27 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,4 +1,4 @@
-2013.02, Not released yet:
+2013.02-rc1, Released February 10th, 2013
 
 	Toolchain: Crosstool-ng 1.17.0, default to GCC 4.6.3, target
 	libraries install fixed. Add Linaro ARM
diff --git a/Makefile b/Makefile
index 7f0822f..3f967b2 100644
--- a/Makefile
+++ b/Makefile
@@ -24,7 +24,7 @@
 #--------------------------------------------------------------
 
 # Set and export the version string
-export BR2_VERSION:=2013.02
+export BR2_VERSION:=2013.02-rc1
 
 # Check for minimal make version (note: this check will break at make 10.x)
 MIN_MAKE_VERSION=3.81
diff --git a/docs/download.html b/docs/download.html
index 2b1bb80..f7369d6 100644
--- a/docs/download.html
+++ b/docs/download.html
@@ -12,16 +12,16 @@ here:<p>
 <a href="/downloads/buildroot-2012.11.1.tar.gz">buildroot-2012.11.1.tar.gz</a>
 or
 <a href="/downloads/buildroot-2012.11.1.tar.bz2">buildroot-2012.11.1.tar.bz2</a>.
-<!--
+
 <p>
-The latest release candidate is <b>2012.11-rc2</b>, which can be
+The latest release candidate is <b>2013.02-rc1</b>, which can be
 downloaded here:<p>
 
-<a href="/downloads/buildroot-2012.11-rc2.tar.gz">buildroot-2012.11-rc2.tar.gz</a>
+<a href="/downloads/buildroot-2013.02-rc1.tar.gz">buildroot-2013.02-rc1.tar.gz</a>
 or
-<a href="/downloads/buildroot-2012.11-rc2.tar.bz2">buildroot-2012.11-rc2.tar.bz2</a>.
+<a href="/downloads/buildroot-2013.02-rc1.tar.bz2">buildroot-2013.02-rc1.tar.bz2</a>.
 <p>
--->
+
 This and earlier releases can always be downloaded from
 <a href="/downloads/">http://buildroot.net/downloads/</a>.
 
diff --git a/docs/news.html b/docs/news.html
index ceb3c69..bc8a16a 100644
--- a/docs/news.html
+++ b/docs/news.html
@@ -5,6 +5,19 @@
 <p>
 
 <ul>
+  <li><b>10 February 2013 -- 2013.02-rc1 released</b>
+
+    <p>We have a new release candidate! Lots of changes all over the
+    tree, see the <a
+    href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2013.02_rc1">CHANGES</a>
+    file for details.</p>
+
+    <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
+    <a href="/downloads/buildroot-2013.02-rc1.tar.bz2">2013.02-rc1
+    release candidate</a>, and report any problems found to the <a
+    href="lists.html">mailing list</a> or <a
+    href="https://bugs.uclibc.org">bug tracker</a>.</p>
+
   <li><b>10 February 2013 -- Report from Buildroot Developers Meeting</b>
 
     <p>A report from the recent Buildroot Developers Meeting is now
