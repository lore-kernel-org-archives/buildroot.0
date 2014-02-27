From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 27 Feb 2014 21:51:23 +0100
Subject: [Buildroot] [git commit] Update for 2014.02
Message-ID: <20140227205641.E28DB9BAF0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a6cfaea44e5105cb66e4e797042f64335f5e7c01
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES            |   13 +++++++++++++
 Makefile           |    2 +-
 docs/download.html |   14 +++++++-------
 docs/news.html     |    9 +++++++++
 4 files changed, 30 insertions(+), 8 deletions(-)

diff --git a/CHANGES b/CHANGES
index 363a0bb..45a31c4 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,16 @@
+2014.02, Released February 27th, 2014
+
+	Minor fixes.
+
+	Updated/fixed packages: cegui06, cppdb, e2fsprogs, gcc, gdb,
+	gst1-plugins-bad, gstreamer, gstreamer1, haserl, imagemagick,
+	libpng, libxml2, lua, luajit, luarock, ncftp, openswan,
+	pcsc-lite, qt5connectivity, ramsmp, strongswan, vlc
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#6938: mkuser script generates wrong password for new user in..
+
 2014.02-rc3, Released February 25th, 2014
 
 	Minor fixes.
diff --git a/Makefile b/Makefile
index 63baafb..18b631d 100644
--- a/Makefile
+++ b/Makefile
@@ -25,7 +25,7 @@
 #--------------------------------------------------------------
 
 # Set and export the version string
-export BR2_VERSION:=2014.02-rc3
+export BR2_VERSION:=2014.02
 
 # Check for minimal make version (note: this check will break at make 10.x)
 MIN_MAKE_VERSION=3.81
diff --git a/docs/download.html b/docs/download.html
index 66c7da7..bae86df 100644
--- a/docs/download.html
+++ b/docs/download.html
@@ -6,17 +6,17 @@
 
 <p>
 
-The latest stable release is <b>2013.11</b>, which can be downloaded
+The latest stable release is <b>2014.02</b>, which can be downloaded
 here:<p>
 
-<a href="/downloads/buildroot-2013.11.tar.gz">buildroot-2013.11.tar.gz</a>
-(<a href="/downloads/buildroot-2013.11.tar.gz.sign">PGP signature</a>)
+<a href="/downloads/buildroot-2014.02.tar.gz">buildroot-2014.02.tar.gz</a>
+(<a href="/downloads/buildroot-2014.02.tar.gz.sign">PGP signature</a>)
 or
-<a href="/downloads/buildroot-2013.11.tar.bz2">buildroot-2013.11.tar.bz2</a>
-(<a href="/downloads/buildroot-2013.11.tar.bz2.sign">PGP signature</a>).
+<a href="/downloads/buildroot-2014.02.tar.bz2">buildroot-2014.02.tar.bz2</a>
+(<a href="/downloads/buildroot-2014.02.tar.bz2.sign">PGP signature</a>).
 
 <p>
-
+<!--
 The latest release candidate is <b>2014.02-rc3</b>, which can be
 downloaded here:<p>
 
@@ -26,7 +26,7 @@ or
 <a href="/downloads/buildroot-2014.02-rc3.tar.bz2">buildroot-2014.02-rc3.tar.bz2</a>
 (<a href="/downloads/buildroot-2014.02-rc3.tar.bz2.sign">PGP signature</a>).
 <p>
-
+-->
 This and earlier releases (and their PGP signatures) can always be downloaded from
 <a href="/downloads/">http://buildroot.net/downloads/</a>.
 
diff --git a/docs/news.html b/docs/news.html
index 92ff34d..9efca65 100644
--- a/docs/news.html
+++ b/docs/news.html
@@ -5,6 +5,15 @@
 <p>
 
 <ul>
+  <li><b>27 February 2014 -- 2014.02 released</b>
+
+    <p>The stable 2014.02 release is out - Thanks to everyone
+    contributing and testing the release candidates. See the
+    <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2014.02">CHANGES</a>
+    file for more details,
+    and go to the <a href="/downloads/">downloads page</a> to pick up the
+    <a href="/downloads/buildroot-2014.02.tar.bz2">2014.02 release</a>.</p>
+
   <li><b>25 February 2014 -- 2014.02-rc3 released</b>
 
     <p>Release candidate 3 is out with more cleanups and build fixes. See the <a
