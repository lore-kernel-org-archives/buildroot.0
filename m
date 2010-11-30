From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 30 Nov 2010 16:52:43 +0100
Subject: [Buildroot] [git commit master 1/1] Update for 2010.11
Message-ID: <20101130183711.97C6181825@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=dbc45b0369605643c272b69c69c5253e1d3cad3e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES            |    2 +-
 Makefile           |    2 +-
 docs/download.html |   10 +++++-----
 docs/news.html     |    9 +++++++++
 4 files changed, 16 insertions(+), 7 deletions(-)

diff --git a/CHANGES b/CHANGES
index ea4bfce..da4520f 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,4 +1,4 @@
-2010.11, Not yet released:
+2010.11, Released November 30th, 2010:
 
 	Fixes all over the tree.
 
diff --git a/Makefile b/Makefile
index 008bdf3..596470f 100644
--- a/Makefile
+++ b/Makefile
@@ -24,7 +24,7 @@
 #--------------------------------------------------------------
 
 # Set and export the version string
-export BR2_VERSION:=2010.11-rc2
+export BR2_VERSION:=2010.11
 
 # This top-level Makefile can *not* be executed in parallel
 .NOTPARALLEL:
diff --git a/docs/download.html b/docs/download.html
index fb74390..1db5386 100644
--- a/docs/download.html
+++ b/docs/download.html
@@ -6,14 +6,14 @@
 
 <p>
 
-The latest stable release is <b>2010.08</b>, which can be downloaded
+The latest stable release is <b>2010.11</b>, which can be downloaded
 here:<p>
 
-<a href="/downloads/buildroot-2010.08.tar.gz">buildroot-2010.08.tar.gz</a>
+<a href="/downloads/buildroot-2010.11.tar.gz">buildroot-2010.11.tar.gz</a>
 or
-<a href="/downloads/buildroot-2010.08.tar.bz2">buildroot-2010.08.tar.bz2</a>.
+<a href="/downloads/buildroot-2010.11.tar.bz2">buildroot-2010.11.tar.bz2</a>.
 <p>
-
+<!--
 The latest release candidate is <b>2010.11-rc2</b>, which can be
 downloaded here:<p>
 
@@ -21,7 +21,7 @@ downloaded here:<p>
 or
 <a href="/downloads/buildroot-2010.11-rc2.tar.bz2">buildroot-2010.11-rc2.tar.bz2</a>.
 <p>
-
+-->
 This and earlier releases can always be downloaded from
 <a href="/downloads/">http://buildroot.net/downloads/</a>.
 
diff --git a/docs/news.html b/docs/news.html
index 1e82e27..c0d9b50 100644
--- a/docs/news.html
+++ b/docs/news.html
@@ -5,6 +5,15 @@
 <p>
 
 <ul>
+  <li><b>30 November 2010 -- 2010.11 released</b>
+
+    <p>The stable 2010.11 release is out - Thanks to everyone
+    contributing and testing the release candidates. See the
+    <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2010.11">CHANGES</a>
+    file for more details,
+    and go to the <a href="/downloads/">downloads page</a> to pick up the
+    <a href="/downloads/buildroot-2010.11.tar.bz2">2010.11 release</a>.</p>
+
   <li><b>25 November 2010 -- 2010.11-rc2 released</b>
 
     <p>RC2 is out with more cleanups and bugfixes, see the <a
-- 
1.7.2.2
