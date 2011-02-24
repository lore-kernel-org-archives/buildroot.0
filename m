From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 24 Feb 2011 10:10:16 +0100
Subject: [Buildroot] [git commit master 1/1] Update for 2011.02-rc2
Message-ID: <20110224091312.291628F699@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=2d3d618b6afdf5c9199deed4b58f02c7ba75e25e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES            |    2 +-
 Makefile           |    2 +-
 docs/download.html |    6 +++---
 docs/news.html     |   12 ++++++++++++
 4 files changed, 17 insertions(+), 5 deletions(-)

diff --git a/CHANGES b/CHANGES
index 28e9941..c2fc5fd 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,4 +1,4 @@
-2011.02, Not yet released:
+2011.02-rc2, Released February 24th, 2011:
 
 	Fixes all over the tree.
 
diff --git a/Makefile b/Makefile
index d954178..2749b14 100644
--- a/Makefile
+++ b/Makefile
@@ -24,7 +24,7 @@
 #--------------------------------------------------------------
 
 # Set and export the version string
-export BR2_VERSION:=2011.02-rc1
+export BR2_VERSION:=2011.02-rc2
 
 # This top-level Makefile can *not* be executed in parallel
 .NOTPARALLEL:
diff --git a/docs/download.html b/docs/download.html
index 9f731ba..6d5075b 100644
--- a/docs/download.html
+++ b/docs/download.html
@@ -14,12 +14,12 @@ or
 <a href="/downloads/buildroot-2010.11.tar.bz2">buildroot-2010.11.tar.bz2</a>.
 <p>
 
-The latest release candidate is <b>2011.02-rc1</b>, which can be
+The latest release candidate is <b>2011.02-rc2</b>, which can be
 downloaded here:<p>
 
-<a href="/downloads/buildroot-2011.02-rc1.tar.gz">buildroot-2011.02-rc1.tar.gz</a>
+<a href="/downloads/buildroot-2011.02-rc2.tar.gz">buildroot-2011.02-rc2.tar.gz</a>
 or
-<a href="/downloads/buildroot-2011.02-rc1.tar.bz2">buildroot-2011.02-rc1.tar.bz2</a>.
+<a href="/downloads/buildroot-2011.02-rc2.tar.bz2">buildroot-2011.02-rc2.tar.bz2</a>.
 <p>
 
 This and earlier releases can always be downloaded from
diff --git a/docs/news.html b/docs/news.html
index dbc37a3..a588142 100644
--- a/docs/news.html
+++ b/docs/news.html
@@ -5,6 +5,18 @@
 <p>
 
 <ul>
+  <li><b>24 February 2011 -- 2011.02-rc2 released</b>
+
+    <p>RC2 is out with more cleanups and bugfixes, see the <a
+    href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2011.02_rc2">CHANGES</a>
+    file for details.</p>
+
+    <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
+    <a href="/downloads/buildroot-2011.02-rc2.tar.bz2">2011.02-rc2
+    release candidate</a>, and report any problems found to the <a
+    href="lists.html">mailing list</a> or <a
+    href="https://bugs.uclibc.org">bug tracker</a>.</p>
+
   <li><b>14 February 2011 -- 2011.02-rc1 released</b>
 
     <p>We have a new release candidate! Lots of changes all over the
-- 
1.7.3.4
