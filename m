From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 1 Dec 2011 00:08:44 +0100
Subject: [Buildroot] [git commit] Update for 2011.11
Message-ID: <20111130232436.ED5448F71A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c29253ef2e2a473e597637b7ada9fb268dfa8767
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES            |    8 ++++++++
 Makefile           |    2 +-
 docs/download.html |   10 +++++-----
 docs/news.html     |    8 ++++++++
 4 files changed, 22 insertions(+), 6 deletions(-)

diff --git a/CHANGES b/CHANGES
index 744b6f3..e5311f0 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,11 @@
+2011.11, Released November 30th, 2011:
+
+	Fixes all over the tree.
+
+	Bump kernel headers / default Linux version to 3.1.4.
+
+	Updated/fixed packages: ruby
+
 2011.11-rc3, Released November 26th, 2011:
 
 	Fixes all over the tree.
diff --git a/Makefile b/Makefile
index e70813f..0d67143 100644
--- a/Makefile
+++ b/Makefile
@@ -24,7 +24,7 @@
 #--------------------------------------------------------------
 
 # Set and export the version string
-export BR2_VERSION:=2011.11-rc3
+export BR2_VERSION:=2011.11
 
 # This top-level Makefile can *not* be executed in parallel
 .NOTPARALLEL:
diff --git a/docs/download.html b/docs/download.html
index d227667..4a52fb7 100644
--- a/docs/download.html
+++ b/docs/download.html
@@ -6,14 +6,14 @@
 
 <p>
 
-The latest stable release is <b>2011.08</b>, which can be downloaded
+The latest stable release is <b>2011.11</b>, which can be downloaded
 here:<p>
 
-<a href="/downloads/buildroot-2011.08.tar.gz">buildroot-2011.08.tar.gz</a>
+<a href="/downloads/buildroot-2011.11.tar.gz">buildroot-2011.11.tar.gz</a>
 or
-<a href="/downloads/buildroot-2011.08.tar.bz2">buildroot-2011.08.tar.bz2</a>.
+<a href="/downloads/buildroot-2011.11.tar.bz2">buildroot-2011.11.tar.bz2</a>.
 <p>
-
+<!--
 The latest release candidate is <b>2011.11-rc3</b>, which can be
 downloaded here:<p>
 
@@ -21,7 +21,7 @@ downloaded here:<p>
 or
 <a href="/downloads/buildroot-2011.11-rc3.tar.bz2">buildroot-2011.11-rc3.tar.bz2</a>.
 <p>
-
+-->
 This and earlier releases can always be downloaded from
 <a href="/downloads/">http://buildroot.net/downloads/</a>.
 
diff --git a/docs/news.html b/docs/news.html
index e02029a..2e54a9e 100644
--- a/docs/news.html
+++ b/docs/news.html
@@ -5,6 +5,14 @@
 <p>
 
 <ul>
+  <li><b>30 November 2011 -- 2011.11 released</b>
+
+    <p>The stable 2011.11 release is out - Thanks to everyone
+    contributing and testing the release candidates. See the
+    <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2011.11">CHANGES</a>
+    file for more details, and go to the <a href="/downloads/">downloads page</a> to pick up the
+    <a href="/downloads/buildroot-2011.11.tar.bz2">2011.11 release</a>.</p>
+
   <li><b>26 November 2011 -- 2011.11-rc3 released</b>
 
     <p>RC3 is out with more bugfixes - See the <a
