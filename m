From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 18 May 2011 22:03:57 +0200
Subject: [Buildroot] [git commit] Update for 2011.05-rc1
Message-ID: <20110518205907.C27128354C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=137a4d7e92baf57e46e35280feb5c0fddfb49af1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES            |    2 +-
 Makefile           |    2 +-
 docs/download.html |   10 +++++-----
 docs/news.html     |   13 +++++++++++++
 4 files changed, 20 insertions(+), 7 deletions(-)

diff --git a/CHANGES b/CHANGES
index a15689b..b0ac653 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,4 +1,4 @@
-2011.05, Not released yet:
+2011.05-rc1, Released May 18th, 2011:
 
 	Fixes all over the tree and new features.
 
diff --git a/Makefile b/Makefile
index 5f61b93..d803a5c 100644
--- a/Makefile
+++ b/Makefile
@@ -24,7 +24,7 @@
 #--------------------------------------------------------------
 
 # Set and export the version string
-export BR2_VERSION:=2011.05-git
+export BR2_VERSION:=2011.05-rc1
 
 # This top-level Makefile can *not* be executed in parallel
 .NOTPARALLEL:
diff --git a/docs/download.html b/docs/download.html
index de7b980..6d0a2ec 100644
--- a/docs/download.html
+++ b/docs/download.html
@@ -13,15 +13,15 @@ here:<p>
 or
 <a href="/downloads/buildroot-2011.02.tar.bz2">buildroot-2011.02.tar.bz2</a>.
 <p>
-<!--
-The latest release candidate is <b>2011.02-rc2</b>, which can be
+
+The latest release candidate is <b>2011.05-rc1</b>, which can be
 downloaded here:<p>
 
-<a href="/downloads/buildroot-2011.02-rc2.tar.gz">buildroot-2011.02-rc2.tar.gz</a>
+<a href="/downloads/buildroot-2011.05-rc1.tar.gz">buildroot-2011.05-rc1.tar.gz</a>
 or
-<a href="/downloads/buildroot-2011.02-rc2.tar.bz2">buildroot-2011.02-rc2.tar.bz2</a>.
+<a href="/downloads/buildroot-2011.05-rc1.tar.bz2">buildroot-2011.05-rc1.tar.bz2</a>.
 <p>
--->
+
 This and earlier releases can always be downloaded from
 <a href="/downloads/">http://buildroot.net/downloads/</a>.
 
diff --git a/docs/news.html b/docs/news.html
index 45e28f5..2270340 100644
--- a/docs/news.html
+++ b/docs/news.html
@@ -5,6 +5,19 @@
 <p>
 
 <ul>
+  <li><b>18 May 2011 -- 2011.05-rc1 released</b>
+
+    <p>We have a new release candidate! Lots of changes all over the
+    tree, see the <a
+    href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2011.05_rc1">CHANGES</a>
+    file for details.
+
+    <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
+    <a href="/downloads/buildroot-2011.05-rc1.tar.bz2">2011.05-rc1
+    release candidate</a>, and report any problems found to the <a
+    href="lists.html">mailing list</a> or <a
+    href="https://bugs.uclibc.org">bug tracker</a>.</p>
+
   <li><b>28 February 2011 -- 2011.02 released</b>
 
     <p>The stable 2011.02 release is out - Thanks to everyone
-- 
1.7.3.4
