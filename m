From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 30 May 2012 23:23:07 +0200
Subject: [Buildroot] [git commit] Update for 2012.05
Message-ID: <20120530212405.C293696E14@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bce34ab199dea7e8430971ae31d743e246049785
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES            |    4 ++++
 Makefile           |    2 +-
 docs/download.html |   10 +++++-----
 docs/news.html     |    9 +++++++++
 4 files changed, 19 insertions(+), 6 deletions(-)

diff --git a/CHANGES b/CHANGES
index 4a8bed0..5043bc9 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,7 @@
+2012.05, Released May 30th, 2012:
+
+	Updated/fixed packages: busybox, netsnmp, pptp-linux
+
 2012.05-rc3, Released May 25th, 2012:
 
 	Minor fixes around the tree.
diff --git a/Makefile b/Makefile
index 4945c16..98e1a51 100644
--- a/Makefile
+++ b/Makefile
@@ -24,7 +24,7 @@
 #--------------------------------------------------------------
 
 # Set and export the version string
-export BR2_VERSION:=2012.05-rc3
+export BR2_VERSION:=2012.05
 
 # Check for minimal make version (note: this check will break at make 10.x)
 MIN_MAKE_VERSION=3.81
diff --git a/docs/download.html b/docs/download.html
index 57c8be5..d23e7e9 100644
--- a/docs/download.html
+++ b/docs/download.html
@@ -6,14 +6,14 @@
 
 <p>
 
-The latest stable release is <b>2012.02</b>, which can be downloaded
+The latest stable release is <b>2012.05</b>, which can be downloaded
 here:<p>
 
-<a href="/downloads/buildroot-2012.02.tar.gz">buildroot-2012.02.tar.gz</a>
+<a href="/downloads/buildroot-2012.05.tar.gz">buildroot-2012.05.tar.gz</a>
 or
-<a href="/downloads/buildroot-2012.02.tar.bz2">buildroot-2012.02.tar.bz2</a>.
+<a href="/downloads/buildroot-2012.05.tar.bz2">buildroot-2012.05.tar.bz2</a>.
 <p>
-
+<!--
 The latest release candidate is <b>2012.05-rc3</b>, which can be
 downloaded here:<p>
 
@@ -21,7 +21,7 @@ downloaded here:<p>
 or
 <a href="/downloads/buildroot-2012.05-rc3.tar.bz2">buildroot-2012.05-rc3.tar.bz2</a>.
 <p>
-
+-->
 This and earlier releases can always be downloaded from
 <a href="/downloads/">http://buildroot.net/downloads/</a>.
 
diff --git a/docs/news.html b/docs/news.html
index 94d1d94..8b52650 100644
--- a/docs/news.html
+++ b/docs/news.html
@@ -5,6 +5,15 @@
 <p>
 
 <ul>
+  <li><b>30 May 2012 -- 2012.05 released</b>
+
+    <p>The stable 2012.05 release is out - Thanks to everyone
+    contributing and testing the release candidates. See the
+    <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2012.05">CHANGES</a>
+    file for more details
+    and go to the <a href="/downloads/">downloads page</a> to pick up the
+    <a href="/downloads/buildroot-2012.05.tar.bz2">2012.05 release</a>.</p>
+
   <li><b>25 May 2012 -- 2012.05-rc3 released</b>
 
     <p>RC3 is out with more bugfixes - See the <a
