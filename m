From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 28 Feb 2013 22:48:28 +0100
Subject: [Buildroot] [git commit] Update for 2013.02
Message-ID: <20130228215336.258C79ADF3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=15ace1a845c9e7fc65b648bbaf4dd14e03d938fd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES            |    7 +++++++
 Makefile           |    2 +-
 docs/download.html |   10 +++++-----
 docs/news.html     |    9 +++++++++
 4 files changed, 22 insertions(+), 6 deletions(-)

diff --git a/CHANGES b/CHANGES
index 8d03703..4e327a8 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,10 @@
+2013.02, Released February 28th, 2013:
+
+	Misc manual updates.
+
+	Updated/fixed packages: busybox, collectd, flashbench,
+	libgtk2, libupnp, mii-diag, quota
+
 2013.02-rc3, Released February 26th, 2013
 
 	Minor fixes.
diff --git a/Makefile b/Makefile
index 0a4c5f2..7f0822f 100644
--- a/Makefile
+++ b/Makefile
@@ -24,7 +24,7 @@
 #--------------------------------------------------------------
 
 # Set and export the version string
-export BR2_VERSION:=2013.02-rc3
+export BR2_VERSION:=2013.02
 
 # Check for minimal make version (note: this check will break at make 10.x)
 MIN_MAKE_VERSION=3.81
diff --git a/docs/download.html b/docs/download.html
index c06270a..10bf5d8 100644
--- a/docs/download.html
+++ b/docs/download.html
@@ -6,13 +6,13 @@
 
 <p>
 
-The latest stable release is <b>2012.11.1</b>, which can be downloaded
+The latest stable release is <b>2013.02</b>, which can be downloaded
 here:<p>
 
-<a href="/downloads/buildroot-2012.11.1.tar.gz">buildroot-2012.11.1.tar.gz</a>
+<a href="/downloads/buildroot-2013.02.tar.gz">buildroot-2013.02.tar.gz</a>
 or
-<a href="/downloads/buildroot-2012.11.1.tar.bz2">buildroot-2012.11.1.tar.bz2</a>.
-
+<a href="/downloads/buildroot-2013.02.tar.bz2">buildroot-2013.02.tar.bz2</a>.
+<!--
 <p>
 The latest release candidate is <b>2013.02-rc3</b>, which can be
 downloaded here:<p>
@@ -21,7 +21,7 @@ downloaded here:<p>
 or
 <a href="/downloads/buildroot-2013.02-rc3.tar.bz2">buildroot-2013.02-rc3.tar.bz2</a>.
 <p>
-
+-->
 This and earlier releases can always be downloaded from
 <a href="/downloads/">http://buildroot.net/downloads/</a>.
 
diff --git a/docs/news.html b/docs/news.html
index d9b6b0d..db203ac 100644
--- a/docs/news.html
+++ b/docs/news.html
@@ -5,6 +5,15 @@
 <p>
 
 <ul>
+  <li><b>28 February 2013 -- 2013.02 released</b>
+
+    <p>The stable 2013.02 release is out - Thanks to everyone
+    contributing and testing the release candidates. See the
+    <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2013.02">CHANGES</a>
+    file for more details
+    and go to the <a href="/downloads/">downloads page</a> to pick up the
+    <a href="/downloads/buildroot-2013.02.tar.bz2">2013.02 release</a>.</p>
+
   <li><b>26 February 2013 -- 2013.02-rc3 released</b>
 
     <p>Another week, another release candidate with more cleanups and
