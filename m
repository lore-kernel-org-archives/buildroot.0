From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 31 Aug 2013 00:33:13 +0200
Subject: [Buildroot] [git commit] Update for 2013.08
Message-ID: <20130830223322.29F6C9B639@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=53d8d9c14a379ea15a84504e941b6b7ca78074f8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES            |    8 ++++++++
 Makefile           |    2 +-
 docs/download.html |   10 +++++-----
 docs/news.html     |    9 +++++++++
 4 files changed, 23 insertions(+), 6 deletions(-)

diff --git a/CHANGES b/CHANGES
index 80cd357..f1b01a3 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,11 @@
+2013.08, Released August 31th, 2013:
+
+	Minor fixes.
+
+	Documentation build fixed.
+
+	Updated/fixed packages: ltrace, strongswan
+
 2013.08-rc3, Released August 29th, 2013:
 
 	Fixes all over the tree.
diff --git a/Makefile b/Makefile
index e7f822a..e2454a7 100644
--- a/Makefile
+++ b/Makefile
@@ -24,7 +24,7 @@
 #--------------------------------------------------------------
 
 # Set and export the version string
-export BR2_VERSION:=2013.08-rc3
+export BR2_VERSION:=2013.08
 
 # Check for minimal make version (note: this check will break at make 10.x)
 MIN_MAKE_VERSION=3.81
diff --git a/docs/download.html b/docs/download.html
index 79a9889..e2adcfc 100644
--- a/docs/download.html
+++ b/docs/download.html
@@ -6,15 +6,15 @@
 
 <p>
 
-The latest stable release is <b>2013.05</b>, which can be downloaded
+The latest stable release is <b>2013.08</b>, which can be downloaded
 here:<p>
 
-<a href="/downloads/buildroot-2013.05.tar.gz">buildroot-2013.05.tar.gz</a>
+<a href="/downloads/buildroot-2013.08.tar.gz">buildroot-2013.08.tar.gz</a>
 or
-<a href="/downloads/buildroot-2013.05.tar.bz2">buildroot-2013.05.tar.bz2</a>.
+<a href="/downloads/buildroot-2013.08.tar.bz2">buildroot-2013.08.tar.bz2</a>.
 
 <p>
-
+<!--
 The latest release candidate is <b>2013.08-rc3</b>, which can be
 downloaded here:<p>
 
@@ -22,7 +22,7 @@ downloaded here:<p>
 or
 <a href="/downloads/buildroot-2013.08-rc3.tar.bz2">buildroot-2013.08-rc3.tar.bz2</a>.
 <p>
-
+-->
 This and earlier releases can always be downloaded from
 <a href="/downloads/">http://buildroot.net/downloads/</a>.
 
diff --git a/docs/news.html b/docs/news.html
index 4888eff..25a70f0 100644
--- a/docs/news.html
+++ b/docs/news.html
@@ -5,6 +5,15 @@
 <p>
 
 <ul>
+  <li><b>31 August 2013 -- 2013.08 released</b>
+
+    <p>The stable 2013.08 release is out - Thanks to everyone
+    contributing and testing the release candidates. See the
+    <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2013.08">CHANGES</a>
+    file for more details
+    and go to the <a href="/downloads/">downloads page</a> to pick up the
+    <a href="/downloads/buildroot-2013.08.tar.bz2">2013.08 release</a>.</p>
+
   <li><b>29 August 2013 -- 2013.08-rc3 released</b>
 
     <p>Another week, another release candidate with more cleanups and
