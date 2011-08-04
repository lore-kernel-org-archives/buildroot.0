From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 4 Aug 2011 22:31:30 +0200
Subject: [Buildroot] [git commit] Update for 2011.08-rc1
Message-ID: <20110804203152.0AF498B770@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=7ff457cdb5949a7e8d9409495d1342f71b7d3adf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES            |    4 ++--
 Makefile           |    2 +-
 docs/download.html |   10 +++++-----
 docs/news.html     |   13 +++++++++++++
 4 files changed, 21 insertions(+), 8 deletions(-)

diff --git a/CHANGES b/CHANGES
index 09ef71e..a6f368b 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,4 +1,4 @@
-2011.08, Not released yet:
+2011.08-rc1, Released August 4th, 2011:
 
 	Fixes all over the tree and new features.
 
@@ -9,7 +9,7 @@
 	GENTARGETS infrastructure extended to cover bootloaders and
 	Linux kernel as well. Options to retrive Linux/U-Boot from a
 	custom git repo instead of upstream tarballs.
-	Support for Linux 3.x and release candiate tarballs.
+	Support for Linux 3.x and release candidate tarballs.
 	X-Loader bootloader for omap added.
 
 	Make source/external-deps now also works for external
diff --git a/Makefile b/Makefile
index df6ce8f..24f0cb2 100644
--- a/Makefile
+++ b/Makefile
@@ -24,7 +24,7 @@
 #--------------------------------------------------------------
 
 # Set and export the version string
-export BR2_VERSION:=2011.08-git
+export BR2_VERSION:=2011.08-rc1
 
 # This top-level Makefile can *not* be executed in parallel
 .NOTPARALLEL:
diff --git a/docs/download.html b/docs/download.html
index a70bfb3..3977d68 100644
--- a/docs/download.html
+++ b/docs/download.html
@@ -13,15 +13,15 @@ here:<p>
 or
 <a href="/downloads/buildroot-2011.05.tar.bz2">buildroot-2011.05.tar.bz2</a>.
 <p>
-<!--
-The latest release candidate is <b>2011.05-rc2</b>, which can be
+
+The latest release candidate is <b>2011.08-rc1</b>, which can be
 downloaded here:<p>
 
-<a href="/downloads/buildroot-2011.05-rc2.tar.gz">buildroot-2011.05-rc2.tar.gz</a>
+<a href="/downloads/buildroot-2011.08-rc1.tar.gz">buildroot-2011.08-rc1.tar.gz</a>
 or
-<a href="/downloads/buildroot-2011.05-rc2.tar.bz2">buildroot-2011.05-rc2.tar.bz2</a>.
+<a href="/downloads/buildroot-2011.08-rc1.tar.bz2">buildroot-2011.08-rc1.tar.bz2</a>.
 <p>
--->
+
 This and earlier releases can always be downloaded from
 <a href="/downloads/">http://buildroot.net/downloads/</a>.
 
diff --git a/docs/news.html b/docs/news.html
index 4d79bf2..42ebdd2 100644
--- a/docs/news.html
+++ b/docs/news.html
@@ -5,6 +5,19 @@
 <p>
 
 <ul>
+  <li><b>4 August 2011 -- 2011.08-rc1 released</b>
+
+    <p>We have a new release candidate! Lots of changes all over the
+    tree, see the <a
+    href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2011.08_rc1">CHANGES</a>
+    file for details.
+
+    <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
+    <a href="/downloads/buildroot-2011.08-rc1.tar.bz2">2011.08-rc1
+    release candidate</a>, and report any problems found to the <a
+    href="lists.html">mailing list</a> or <a
+    href="https://bugs.uclibc.org">bug tracker</a>.</p>
+
   <li><b>27 May 2011 -- 2011.05 released</b>
 
     <p>The stable 2011.05 release is out - Thanks to everyone
-- 
1.7.3.4
