From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 1 Dec 2014 10:19:00 +0100
Subject: [Buildroot] [git commit] Update for 2014.11
Message-ID: <20141201092641.D35807F918@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9a5434fbfc98a0c427c880b167b8ca3499b44e87
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES            |   11 +++++++++++
 Makefile           |    2 +-
 docs/download.html |   14 +++++++-------
 docs/news.html     |    9 +++++++++
 4 files changed, 28 insertions(+), 8 deletions(-)

diff --git a/CHANGES b/CHANGES
index 5c8ce1b..22668dc 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,14 @@
+2014.11, Released December 1st, 2014
+
+	Minor fixes.
+
+	Infrastructure: LD_LIBRARY_PATH handling tweak to ensure
+	current working directory isn't searched.
+
+	Updated/fixed packages: gd, gdb, libwebsockets, luajit, mono,
+	parted, shairport-sync, util-linux, xapp_bdftopcf,
+	xserver_xorg-server
+
 2014.11-rc3, Released November 28th, 2014
 
 	Fixes all over the tree.
diff --git a/Makefile b/Makefile
index e219d33..e554a30 100644
--- a/Makefile
+++ b/Makefile
@@ -28,7 +28,7 @@
 all:
 
 # Set and export the version string
-export BR2_VERSION := 2014.11-rc3
+export BR2_VERSION := 2014.11
 
 # Check for minimal make version (note: this check will break at make 10.x)
 MIN_MAKE_VERSION = 3.81
diff --git a/docs/download.html b/docs/download.html
index 7c06bc7..7721615 100644
--- a/docs/download.html
+++ b/docs/download.html
@@ -7,17 +7,17 @@
 
 <p>
 
-The latest stable release is <b>2014.08</b>, which can be downloaded
+The latest stable release is <b>2014.11</b>, which can be downloaded
 here:<p>
 
-<a href="/downloads/buildroot-2014.08.tar.gz">buildroot-2014.08.tar.gz</a>
-(<a href="/downloads/buildroot-2014.08.tar.gz.sign">PGP signature</a>)
+<a href="/downloads/buildroot-2014.11.tar.gz">buildroot-2014.11.tar.gz</a>
+(<a href="/downloads/buildroot-2014.11.tar.gz.sign">PGP signature</a>)
 or
-<a href="/downloads/buildroot-2014.08.tar.bz2">buildroot-2014.08.tar.bz2</a>
-(<a href="/downloads/buildroot-2014.08.tar.bz2.sign">PGP signature</a>).
+<a href="/downloads/buildroot-2014.11.tar.bz2">buildroot-2014.11.tar.bz2</a>
+(<a href="/downloads/buildroot-2014.11.tar.bz2.sign">PGP signature</a>).
 
 <p>
-
+<!--
 The latest release candidate is <b>2014.11-rc3</b>, which can be
 downloaded here:<p>
 
@@ -32,7 +32,7 @@ This and earlier releases (and their PGP signatures) can always be downloaded fr
 <a href="/downloads/">http://buildroot.net/downloads/</a>.
 
 <p>
-
+-->
 You can also obtain daily snapshots of the latest Buildroot source tree if you
 want to follow development, but cannot or do not wish to use Git.
 
diff --git a/docs/news.html b/docs/news.html
index 3d0e1d6..0596e4c 100644
--- a/docs/news.html
+++ b/docs/news.html
@@ -9,6 +9,15 @@
 
 <ul>
 
+  <li><b>1 December 2014 -- 2014.11 released</b>
+
+    <p>The stable 2014.11 release is out - Thanks to everyone
+    contributing and testing the release candidates. See the
+    <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2014.11">CHANGES</a>
+    file for more details,
+    and go to the <a href="/downloads/">downloads page</a> to pick up the
+    <a href="/downloads/buildroot-2014.11.tar.bz2">2014.11 release</a>.</p>
+
   <li><b>28 November 2014 -- 2014.11-rc3 released</b>
 
     <p>Release candidate 3 is out with more cleanups and build fixes. See the <a
