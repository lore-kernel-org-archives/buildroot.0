From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 26 Nov 2011 22:05:20 +0100
Subject: [Buildroot] [git commit] Update for 2011.11-rc3
Message-ID: <20111126211041.1D7D68F5D2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4dc18dc51495079c15c81877ec862ab54992b691
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES            |    2 +-
 Makefile           |    2 +-
 docs/download.html |    6 +++---
 docs/news.html     |   12 ++++++++++++
 4 files changed, 17 insertions(+), 5 deletions(-)

diff --git a/CHANGES b/CHANGES
index 3173fe6..744b6f3 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,4 +1,4 @@
-2011.11, Not released yet:
+2011.11-rc3, Released November 26th, 2011:
 
 	Fixes all over the tree.
 
diff --git a/Makefile b/Makefile
index 052fc3d..e70813f 100644
--- a/Makefile
+++ b/Makefile
@@ -24,7 +24,7 @@
 #--------------------------------------------------------------
 
 # Set and export the version string
-export BR2_VERSION:=2011.11-rc2
+export BR2_VERSION:=2011.11-rc3
 
 # This top-level Makefile can *not* be executed in parallel
 .NOTPARALLEL:
diff --git a/docs/download.html b/docs/download.html
index 0ef382a..d227667 100644
--- a/docs/download.html
+++ b/docs/download.html
@@ -14,12 +14,12 @@ or
 <a href="/downloads/buildroot-2011.08.tar.bz2">buildroot-2011.08.tar.bz2</a>.
 <p>
 
-The latest release candidate is <b>2011.11-rc2</b>, which can be
+The latest release candidate is <b>2011.11-rc3</b>, which can be
 downloaded here:<p>
 
-<a href="/downloads/buildroot-2011.11-rc2.tar.gz">buildroot-2011.11-rc2.tar.gz</a>
+<a href="/downloads/buildroot-2011.11-rc3.tar.gz">buildroot-2011.11-rc3.tar.gz</a>
 or
-<a href="/downloads/buildroot-2011.11-rc2.tar.bz2">buildroot-2011.11-rc2.tar.bz2</a>.
+<a href="/downloads/buildroot-2011.11-rc3.tar.bz2">buildroot-2011.11-rc3.tar.bz2</a>.
 <p>
 
 This and earlier releases can always be downloaded from
diff --git a/docs/news.html b/docs/news.html
index cde1c84..e02029a 100644
--- a/docs/news.html
+++ b/docs/news.html
@@ -5,6 +5,18 @@
 <p>
 
 <ul>
+  <li><b>26 November 2011 -- 2011.11-rc3 released</b>
+
+    <p>RC3 is out with more bugfixes - See the <a
+    href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2011.11_rc3">CHANGES</a>
+    file for details.
+
+    <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
+    <a href="/downloads/buildroot-2011.11-rc3.tar.bz2">2011.11-rc3
+    release candidate</a>, and report any problems found to the <a
+    href="lists.html">mailing list</a> or <a
+    href="https://bugs.uclibc.org">bug tracker</a>.</p>
+
   <li><b>18 November 2011 -- 2011.11-rc2 released</b>
 
     <p>Another week, another release candidate with a bunch of
