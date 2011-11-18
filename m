From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 18 Nov 2011 14:00:24 +0100
Subject: [Buildroot] [git commit] Update for 2011.11-rc2
Message-ID: <20111118130051.D5B748F587@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6088ac0140b1b4f89f4049d72e62b2821089a29e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES            |    2 +-
 Makefile           |    2 +-
 docs/download.html |    6 +++---
 docs/news.html     |   13 +++++++++++++
 4 files changed, 18 insertions(+), 5 deletions(-)

diff --git a/CHANGES b/CHANGES
index 1b5a488..bb6bae9 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,4 +1,4 @@
-2011.11, Not released yet:
+2011.11-rc2, Released November 18th, 2011:
 
 	Fixes all over the tree and new features.
 
diff --git a/Makefile b/Makefile
index df2f859..052fc3d 100644
--- a/Makefile
+++ b/Makefile
@@ -24,7 +24,7 @@
 #--------------------------------------------------------------
 
 # Set and export the version string
-export BR2_VERSION:=2011.11-rc1
+export BR2_VERSION:=2011.11-rc2
 
 # This top-level Makefile can *not* be executed in parallel
 .NOTPARALLEL:
diff --git a/docs/download.html b/docs/download.html
index 81ad2a7..0ef382a 100644
--- a/docs/download.html
+++ b/docs/download.html
@@ -14,12 +14,12 @@ or
 <a href="/downloads/buildroot-2011.08.tar.bz2">buildroot-2011.08.tar.bz2</a>.
 <p>
 
-The latest release candidate is <b>2011.11-rc1</b>, which can be
+The latest release candidate is <b>2011.11-rc2</b>, which can be
 downloaded here:<p>
 
-<a href="/downloads/buildroot-2011.11-rc1.tar.gz">buildroot-2011.11-rc1.tar.gz</a>
+<a href="/downloads/buildroot-2011.11-rc2.tar.gz">buildroot-2011.11-rc2.tar.gz</a>
 or
-<a href="/downloads/buildroot-2011.11-rc1.tar.bz2">buildroot-2011.11-rc1.tar.bz2</a>.
+<a href="/downloads/buildroot-2011.11-rc2.tar.bz2">buildroot-2011.11-rc2.tar.bz2</a>.
 <p>
 
 This and earlier releases can always be downloaded from
diff --git a/docs/news.html b/docs/news.html
index 1e4e5ea..cde1c84 100644
--- a/docs/news.html
+++ b/docs/news.html
@@ -5,6 +5,19 @@
 <p>
 
 <ul>
+  <li><b>18 November 2011 -- 2011.11-rc2 released</b>
+
+    <p>Another week, another release candidate with a bunch of
+    cleanups and build fixes. See the <a
+    href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2011.11_rc2">CHANGES</a>
+    file for details.</p>
+
+    <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
+    <a href="/downloads/buildroot-2011.11-rc2.tar.bz2">2011.11-rc2
+    release candidate</a>, and report any problems found to the <a
+    href="lists.html">mailing list</a> or <a
+    href="https://bugs.uclibc.org">bug tracker</a>.</p>
+
   <li><b>11 November 2011 -- 2011.11-rc1 released</b>
 
     <p>We have a new release candidate! Lots of changes all over the
