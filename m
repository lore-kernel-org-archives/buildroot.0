From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 2 Dec 2012 16:33:09 -0800
Subject: [Buildroot] [git commit] Update for 2012.11
Message-ID: <20121203010304.C4982996F6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d201b95d8c6aa4d21f8655361e12e98630be8c93
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES            |   10 ++++++++++
 Makefile           |    2 +-
 docs/download.html |   10 +++++-----
 docs/news.html     |    9 +++++++++
 4 files changed, 25 insertions(+), 6 deletions(-)

diff --git a/CHANGES b/CHANGES
index 98fa5c2..2c357eb 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,13 @@
+2012.11, Released December 2nd, 2012:
+
+	Git shallow clone fix for older git version.
+
+	Updated/fixed packages: ctuio, libtool
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#5726: List all the available hook points
+
 2012.11-rc2, Released November 30th, 2012:
 
 	Minor fixes around the tree.
diff --git a/Makefile b/Makefile
index 87943b8..9d9985f 100644
--- a/Makefile
+++ b/Makefile
@@ -24,7 +24,7 @@
 #--------------------------------------------------------------
 
 # Set and export the version string
-export BR2_VERSION:=2012.11-rc2
+export BR2_VERSION:=2012.11
 
 # Check for minimal make version (note: this check will break at make 10.x)
 MIN_MAKE_VERSION=3.81
diff --git a/docs/download.html b/docs/download.html
index cdf5950..4cb01c9 100644
--- a/docs/download.html
+++ b/docs/download.html
@@ -6,13 +6,13 @@
 
 <p>
 
-The latest stable release is <b>2012.08</b>, which can be downloaded
+The latest stable release is <b>2012.11</b>, which can be downloaded
 here:<p>
 
-<a href="/downloads/buildroot-2012.08.tar.gz">buildroot-2012.08.tar.gz</a>
+<a href="/downloads/buildroot-2012.11.tar.gz">buildroot-2012.11.tar.gz</a>
 or
-<a href="/downloads/buildroot-2012.08.tar.bz2">buildroot-2012.08.tar.bz2</a>.
-
+<a href="/downloads/buildroot-2012.11.tar.bz2">buildroot-2012.11.tar.bz2</a>.
+<!--
 <p>
 The latest release candidate is <b>2012.11-rc2</b>, which can be
 downloaded here:<p>
@@ -21,7 +21,7 @@ downloaded here:<p>
 or
 <a href="/downloads/buildroot-2012.11-rc2.tar.bz2">buildroot-2012.11-rc2.tar.bz2</a>.
 <p>
-
+-->
 This and earlier releases can always be downloaded from
 <a href="/downloads/">http://buildroot.net/downloads/</a>.
 
diff --git a/docs/news.html b/docs/news.html
index 84f4cc3..7e791be 100644
--- a/docs/news.html
+++ b/docs/news.html
@@ -5,6 +5,15 @@
 <p>
 
 <ul>
+  <li><b>2 December 2012 -- 2012.11 released</b>
+
+    <p>The stable 2012.11 release is out - Thanks to everyone
+    contributing and testing the release candidates. See the
+    <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2012.11">CHANGES</a>
+    file for more details
+    and go to the <a href="/downloads/">downloads page</a> to pick up the
+    <a href="/downloads/buildroot-2012.11.tar.bz2">2012.11 release</a>.</p>
+
   <li><b>30 November 2012 -- 2012.11-rc2 released</b>
 
     <p>RC2 is out with more bugfixes - See the <a
