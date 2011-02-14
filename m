From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 14 Feb 2011 22:38:01 +0100
Subject: [Buildroot] [git commit master 1/1] Update for 2011.02-rc1
Message-ID: <20110214213831.B095E8F4E5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=51f8802d87b3cf15f1c799354781e1415ba0b8b5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES            |    4 +++-
 Makefile           |    2 +-
 docs/download.html |   10 +++++-----
 docs/news.html     |   13 +++++++++++++
 4 files changed, 22 insertions(+), 7 deletions(-)

diff --git a/CHANGES b/CHANGES
index 2db2158..5c866e8 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,4 +1,6 @@
-2011.02, Not yet released:
+2011.02-rc1, Released February 14th, 2011:
+
+	Fixes all over the tree and new features.
 
 	External toolchain improvements: clarification of the options,
 	and introduction of the toolchain profile concept, for
diff --git a/Makefile b/Makefile
index 111fbd6..d954178 100644
--- a/Makefile
+++ b/Makefile
@@ -24,7 +24,7 @@
 #--------------------------------------------------------------
 
 # Set and export the version string
-export BR2_VERSION:=2011.02-git
+export BR2_VERSION:=2011.02-rc1
 
 # This top-level Makefile can *not* be executed in parallel
 .NOTPARALLEL:
diff --git a/docs/download.html b/docs/download.html
index 1db5386..9f731ba 100644
--- a/docs/download.html
+++ b/docs/download.html
@@ -13,15 +13,15 @@ here:<p>
 or
 <a href="/downloads/buildroot-2010.11.tar.bz2">buildroot-2010.11.tar.bz2</a>.
 <p>
-<!--
-The latest release candidate is <b>2010.11-rc2</b>, which can be
+
+The latest release candidate is <b>2011.02-rc1</b>, which can be
 downloaded here:<p>
 
-<a href="/downloads/buildroot-2010.11-rc2.tar.gz">buildroot-2010.11-rc2.tar.gz</a>
+<a href="/downloads/buildroot-2011.02-rc1.tar.gz">buildroot-2011.02-rc1.tar.gz</a>
 or
-<a href="/downloads/buildroot-2010.11-rc2.tar.bz2">buildroot-2010.11-rc2.tar.bz2</a>.
+<a href="/downloads/buildroot-2011.02-rc1.tar.bz2">buildroot-2011.02-rc1.tar.bz2</a>.
 <p>
--->
+
 This and earlier releases can always be downloaded from
 <a href="/downloads/">http://buildroot.net/downloads/</a>.
 
diff --git a/docs/news.html b/docs/news.html
index 38fbca3..9f66825 100644
--- a/docs/news.html
+++ b/docs/news.html
@@ -5,6 +5,19 @@
 <p>
 
 <ul>
+  <li><b>14 February 2011 -- 2011.02-rc1 released</b>
+
+    <p>We have a new release candidate! Lots of changes all over the
+    tree, see the <a
+    href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2011.02_rc1">CHANGES</a>
+    file for details.
+
+    <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
+    <a href="/downloads/buildroot-2011.02-rc1.tar.bz2">2011.02-rc1
+    release candidate</a>, and report any problems found to the <a
+    href="lists.html">mailing list</a> or <a
+    href="https://bugs.uclibc.org">bug tracker</a>.</p>
+
   <li><b>30 November 2010 -- 2010.11 released</b>
 
     <p>The stable 2010.11 release is out - Thanks to everyone
-- 
1.7.3.4
