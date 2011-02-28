From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 28 Feb 2011 21:54:22 +0100
Subject: [Buildroot] [git commit master 1/1] Update for 2011.02
Message-ID: <20110228205515.B6D1E8CA4D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=f3e79a7aae32ead34a5e71d608c487fda614e223
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES            |    2 +-
 Makefile           |    2 +-
 docs/download.html |   10 +++++-----
 docs/news.html     |    9 +++++++++
 4 files changed, 16 insertions(+), 7 deletions(-)

diff --git a/CHANGES b/CHANGES
index 5bc2918..9ee4cd6 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,4 +1,4 @@
-2011.02, Not yet released:
+2011.02, Released February 28th, 2011:
 
 	Fixes all over the tree.
 
diff --git a/Makefile b/Makefile
index 2749b14..8046763 100644
--- a/Makefile
+++ b/Makefile
@@ -24,7 +24,7 @@
 #--------------------------------------------------------------
 
 # Set and export the version string
-export BR2_VERSION:=2011.02-rc2
+export BR2_VERSION:=2011.02
 
 # This top-level Makefile can *not* be executed in parallel
 .NOTPARALLEL:
diff --git a/docs/download.html b/docs/download.html
index 6d5075b..de7b980 100644
--- a/docs/download.html
+++ b/docs/download.html
@@ -6,14 +6,14 @@
 
 <p>
 
-The latest stable release is <b>2010.11</b>, which can be downloaded
+The latest stable release is <b>2011.02</b>, which can be downloaded
 here:<p>
 
-<a href="/downloads/buildroot-2010.11.tar.gz">buildroot-2010.11.tar.gz</a>
+<a href="/downloads/buildroot-2011.02.tar.gz">buildroot-2011.02.tar.gz</a>
 or
-<a href="/downloads/buildroot-2010.11.tar.bz2">buildroot-2010.11.tar.bz2</a>.
+<a href="/downloads/buildroot-2011.02.tar.bz2">buildroot-2011.02.tar.bz2</a>.
 <p>
-
+<!--
 The latest release candidate is <b>2011.02-rc2</b>, which can be
 downloaded here:<p>
 
@@ -21,7 +21,7 @@ downloaded here:<p>
 or
 <a href="/downloads/buildroot-2011.02-rc2.tar.bz2">buildroot-2011.02-rc2.tar.bz2</a>.
 <p>
-
+-->
 This and earlier releases can always be downloaded from
 <a href="/downloads/">http://buildroot.net/downloads/</a>.
 
diff --git a/docs/news.html b/docs/news.html
index a588142..f642024 100644
--- a/docs/news.html
+++ b/docs/news.html
@@ -5,6 +5,15 @@
 <p>
 
 <ul>
+  <li><b>28 February 2011 -- 2011.02 released</b>
+
+    <p>The stable 2011.02 release is out - Thanks to everyone
+    contributing and testing the release candidates. See the
+    <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2011.02">CHANGES</a>
+    file for more details,
+    and go to the <a href="/downloads/">downloads page</a> to pick up the
+    <a href="/downloads/buildroot-2011.02.tar.bz2">2011.02 release</a>.</p>
+
   <li><b>24 February 2011 -- 2011.02-rc2 released</b>
 
     <p>RC2 is out with more cleanups and bugfixes, see the <a
-- 
1.7.3.4
