From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 30 Nov 2013 14:16:03 +0100
Subject: [Buildroot] [git commit] Update for 2013.11
Message-ID: <20131130131636.972109BE7F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9b3904543ca04c5d5fe5f6974539eed376de2290
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES            |    2 +-
 Makefile           |    2 +-
 docs/download.html |   10 +++++-----
 docs/news.html     |    9 +++++++++
 4 files changed, 16 insertions(+), 7 deletions(-)

diff --git a/CHANGES b/CHANGES
index 8604337..d75d8b1 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,4 +1,4 @@
-2013.11, Not yet released:
+2013.11, Released November 30th, 2013:
 
 	Minor fixes.
 
diff --git a/Makefile b/Makefile
index b5368a3..0480a42 100644
--- a/Makefile
+++ b/Makefile
@@ -24,7 +24,7 @@
 #--------------------------------------------------------------
 
 # Set and export the version string
-export BR2_VERSION:=2013.11-rc3
+export BR2_VERSION:=2013.11
 
 # Check for minimal make version (note: this check will break at make 10.x)
 MIN_MAKE_VERSION=3.81
diff --git a/docs/download.html b/docs/download.html
index 1cfd54d..b9a9fcf 100644
--- a/docs/download.html
+++ b/docs/download.html
@@ -6,15 +6,15 @@
 
 <p>
 
-The latest stable release is <b>2013.08.1</b>, which can be downloaded
+The latest stable release is <b>2013.11</b>, which can be downloaded
 here:<p>
 
-<a href="/downloads/buildroot-2013.08.1.tar.gz">buildroot-2013.08.1.tar.gz</a>
+<a href="/downloads/buildroot-2013.11.tar.gz">buildroot-2013.11.tar.gz</a>
 or
-<a href="/downloads/buildroot-2013.08.1.tar.bz2">buildroot-2013.08.1.tar.bz2</a>.
+<a href="/downloads/buildroot-2013.11.tar.bz2">buildroot-2013.11.tar.bz2</a>.
 
 <p>
-
+<!--
 The latest release candidate is <b>2013.11-rc3</b>, which can be
 downloaded here:<p>
 
@@ -22,7 +22,7 @@ downloaded here:<p>
 or
 <a href="/downloads/buildroot-2013.11-rc3.tar.bz2">buildroot-2013.11-rc3.tar.bz2</a>.
 <p>
-
+-->
 This and earlier releases can always be downloaded from
 <a href="/downloads/">http://buildroot.net/downloads/</a>.
 
diff --git a/docs/news.html b/docs/news.html
index a8ab9db..efa8fd1 100644
--- a/docs/news.html
+++ b/docs/news.html
@@ -5,6 +5,15 @@
 <p>
 
 <ul>
+  <li><b>30 November 2013 -- 2013.11 released</b>
+
+    <p>The stable 2013.11 release is out - Thanks to everyone
+    contributing and testing the release candidates. See the
+    <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2013.11">CHANGES</a>
+    file for more details
+    and go to the <a href="/downloads/">downloads page</a> to pick up the
+    <a href="/downloads/buildroot-2013.11.tar.bz2">2013.11 release</a>.</p>
+
   <li><b>30 November 2013 -- Slides from Embedded Linux Conference Europe</b>
 
     <p>The slides from the Buildroot presentation at the recent
