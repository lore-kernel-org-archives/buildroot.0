From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 31 May 2013 22:29:04 +0200
Subject: [Buildroot] [git commit] Update for 2013.05
Message-ID: <20130531203942.DA41A9A6EB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=615fd9b0f37ee5479dd45ed8358cebdc8546cfab
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES            |    2 +-
 Makefile           |    2 +-
 docs/download.html |    9 +++++----
 docs/news.html     |    9 +++++++++
 4 files changed, 16 insertions(+), 6 deletions(-)

diff --git a/CHANGES b/CHANGES
index 4884a59..910b942 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,4 +1,4 @@
-2013.05, Not yet released:
+2013.05, Released May 31th, 2013:
 
 	Minor fixes.
 
diff --git a/Makefile b/Makefile
index d172bb4..1d6b574 100644
--- a/Makefile
+++ b/Makefile
@@ -24,7 +24,7 @@
 #--------------------------------------------------------------
 
 # Set and export the version string
-export BR2_VERSION:=2013.05-rc3
+export BR2_VERSION:=2013.05
 
 # Check for minimal make version (note: this check will break at make 10.x)
 MIN_MAKE_VERSION=3.81
diff --git a/docs/download.html b/docs/download.html
index 7d881f7..85aaa62 100644
--- a/docs/download.html
+++ b/docs/download.html
@@ -6,14 +6,15 @@
 
 <p>
 
-The latest stable release is <b>2013.02</b>, which can be downloaded
+The latest stable release is <b>2013.05</b>, which can be downloaded
 here:<p>
 
-<a href="/downloads/buildroot-2013.02.tar.gz">buildroot-2013.02.tar.gz</a>
+<a href="/downloads/buildroot-2013.05.tar.gz">buildroot-2013.05.tar.gz</a>
 or
-<a href="/downloads/buildroot-2013.02.tar.bz2">buildroot-2013.02.tar.bz2</a>.
+<a href="/downloads/buildroot-2013.05.tar.bz2">buildroot-2013.05.tar.bz2</a>.
 
 <p>
+<!--
 The latest release candidate is <b>2013.05-rc3</b>, which can be
 downloaded here:<p>
 
@@ -21,7 +22,7 @@ downloaded here:<p>
 or
 <a href="/downloads/buildroot-2013.05-rc3.tar.bz2">buildroot-2013.05-rc3.tar.bz2</a>.
 <p>
-
+-->
 This and earlier releases can always be downloaded from
 <a href="/downloads/">http://buildroot.net/downloads/</a>.
 
diff --git a/docs/news.html b/docs/news.html
index 93554f0..e537ed1 100644
--- a/docs/news.html
+++ b/docs/news.html
@@ -5,6 +5,15 @@
 <p>
 
 <ul>
+  <li><b>31 May 2013 -- 2013.05 released</b>
+
+    <p>The stable 2013.05 release is out - Thanks to everyone
+    contributing and testing the release candidates. See the
+    <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2013.05">CHANGES</a>
+    file for more details
+    and go to the <a href="/downloads/">downloads page</a> to pick up the
+    <a href="/downloads/buildroot-2013.05.tar.bz2">2013.05 release</a>.</p>
+
   <li><b>25 May 2013 -- 2013.05-rc3 released</b>
 
     <p>Another week, another release candidate with more cleanups and
