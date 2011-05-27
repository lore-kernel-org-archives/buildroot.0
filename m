From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 27 May 2011 16:18:21 +0200
Subject: [Buildroot] [git commit] Update for 2011.05
Message-ID: <20110527143003.1B71E83619@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=9ab73b51e8f0f30e1720639d40732fa20aab9d1a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES            |    4 ++++
 Makefile           |    2 +-
 docs/download.html |   10 +++++-----
 docs/news.html     |    8 ++++++++
 4 files changed, 18 insertions(+), 6 deletions(-)

diff --git a/CHANGES b/CHANGES
index eb41128..5607317 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,7 @@
+2011.05, Released May 27th, 2011:
+
+	Updated/fixed packages: makedevs
+
 2011.05-rc2, Released May 24th, 2011:
 
 	Fixes all over the tree.
diff --git a/Makefile b/Makefile
index 9be7f1c..893921b 100644
--- a/Makefile
+++ b/Makefile
@@ -24,7 +24,7 @@
 #--------------------------------------------------------------
 
 # Set and export the version string
-export BR2_VERSION:=2011.05-rc2
+export BR2_VERSION:=2011.05
 
 # This top-level Makefile can *not* be executed in parallel
 .NOTPARALLEL:
diff --git a/docs/download.html b/docs/download.html
index ec0685b..a70bfb3 100644
--- a/docs/download.html
+++ b/docs/download.html
@@ -6,14 +6,14 @@
 
 <p>
 
-The latest stable release is <b>2011.02</b>, which can be downloaded
+The latest stable release is <b>2011.05</b>, which can be downloaded
 here:<p>
 
-<a href="/downloads/buildroot-2011.02.tar.gz">buildroot-2011.02.tar.gz</a>
+<a href="/downloads/buildroot-2011.05.tar.gz">buildroot-2011.05.tar.gz</a>
 or
-<a href="/downloads/buildroot-2011.02.tar.bz2">buildroot-2011.02.tar.bz2</a>.
+<a href="/downloads/buildroot-2011.05.tar.bz2">buildroot-2011.05.tar.bz2</a>.
 <p>
-
+<!--
 The latest release candidate is <b>2011.05-rc2</b>, which can be
 downloaded here:<p>
 
@@ -21,7 +21,7 @@ downloaded here:<p>
 or
 <a href="/downloads/buildroot-2011.05-rc2.tar.bz2">buildroot-2011.05-rc2.tar.bz2</a>.
 <p>
-
+-->
 This and earlier releases can always be downloaded from
 <a href="/downloads/">http://buildroot.net/downloads/</a>.
 
diff --git a/docs/news.html b/docs/news.html
index 99e9aa3..4d79bf2 100644
--- a/docs/news.html
+++ b/docs/news.html
@@ -5,6 +5,14 @@
 <p>
 
 <ul>
+  <li><b>27 May 2011 -- 2011.05 released</b>
+
+    <p>The stable 2011.05 release is out - Thanks to everyone
+    contributing and testing the release candidates. See the
+    <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2011.05">CHANGES</a>
+    file for more details, and go to the <a href="/downloads/">downloads page</a> to pick up the
+    <a href="/downloads/buildroot-2011.05.tar.bz2">2011.05 release</a>.</p>
+
   <li><b>24 May 2011 -- 2011.05-rc2 released</b>
 
     <p>RC2 is out with more bugfixes. See the <a
-- 
1.7.3.4
