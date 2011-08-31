From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 31 Aug 2011 13:44:55 +0200
Subject: [Buildroot] [git commit] Update for 2011.08
Message-ID: <20110831114543.E35268D343@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=facd602dcad54df769ac759886f48f248b61e692
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES            |    9 +++++++++
 Makefile           |    2 +-
 docs/download.html |   10 +++++-----
 docs/news.html     |    8 ++++++++
 4 files changed, 23 insertions(+), 6 deletions(-)

diff --git a/CHANGES b/CHANGES
index 2225e76..99cd79b 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,12 @@
+2011.08, Released August 31th, 2011:
+
+	Fixes all over the tree.
+
+	Toolchain: Fix codesourcery 2009q3 ARM download, Linux 3.0.4
+	kernel headers.
+
+	Updated/fixed packages: ipset, python
+
 2011.08-rc2, Released August 29th, 2011:
 
 	Fixes all over the tree.
diff --git a/Makefile b/Makefile
index e975320..9ed46fc 100644
--- a/Makefile
+++ b/Makefile
@@ -24,7 +24,7 @@
 #--------------------------------------------------------------
 
 # Set and export the version string
-export BR2_VERSION:=2011.08-rc2
+export BR2_VERSION:=2011.08
 
 # This top-level Makefile can *not* be executed in parallel
 .NOTPARALLEL:
diff --git a/docs/download.html b/docs/download.html
index e8b8c48..a397fe0 100644
--- a/docs/download.html
+++ b/docs/download.html
@@ -6,14 +6,14 @@
 
 <p>
 
-The latest stable release is <b>2011.05</b>, which can be downloaded
+The latest stable release is <b>2011.08</b>, which can be downloaded
 here:<p>
 
-<a href="/downloads/buildroot-2011.05.tar.gz">buildroot-2011.05.tar.gz</a>
+<a href="/downloads/buildroot-2011.08.tar.gz">buildroot-2011.08.tar.gz</a>
 or
-<a href="/downloads/buildroot-2011.05.tar.bz2">buildroot-2011.05.tar.bz2</a>.
+<a href="/downloads/buildroot-2011.08.tar.bz2">buildroot-2011.08.tar.bz2</a>.
 <p>
-
+<!--
 The latest release candidate is <b>2011.08-rc2</b>, which can be
 downloaded here:<p>
 
@@ -21,7 +21,7 @@ downloaded here:<p>
 or
 <a href="/downloads/buildroot-2011.08-rc2.tar.bz2">buildroot-2011.08-rc2.tar.bz2</a>.
 <p>
-
+-->
 This and earlier releases can always be downloaded from
 <a href="/downloads/">http://buildroot.net/downloads/</a>.
 
diff --git a/docs/news.html b/docs/news.html
index 582a72a..dbcc7c9 100644
--- a/docs/news.html
+++ b/docs/news.html
@@ -5,6 +5,14 @@
 <p>
 
 <ul>
+  <li><b>32 August 2011 -- 2011.08 released</b>
+
+    <p>The stable 2011.08 release is out - Thanks to everyone
+    contributing and testing the release candidates. See the
+    <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2011.08">CHANGES</a>
+    file for more details, and go to the <a href="/downloads/">downloads page</a> to pick up the
+    <a href="/downloads/buildroot-2011.08.tar.bz2">2011.08 release</a>.</p>
+
   <li><b>29 August 2011 -- 2011.08-rc2 released</b>
 
     <p>RC2 is out with more bugfixes. See the <a
-- 
1.7.3.4
