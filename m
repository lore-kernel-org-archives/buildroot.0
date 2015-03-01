From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 1 Mar 2015 22:26:12 +0100
Subject: [Buildroot] [git commit] Update for 2015.02
Message-ID: <20150301214633.1CF997FDF3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6bf057b0f2ba188397a691f74877a4a30aaea3f9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                    |   14 ++++++++++++++
 Makefile                   |    2 +-
 docs/website/download.html |   14 +++++++-------
 docs/website/news.html     |   11 ++++++++++-
 4 files changed, 32 insertions(+), 9 deletions(-)

diff --git a/CHANGES b/CHANGES
index 401b2e4..dbd922a 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,17 @@
+2015.02, Released March 1st, 2015
+
+	Minor fixes.
+
+	Updated/fixed packages: civetweb, ding-libs,
+	directfb-examples, glibc, gnupg, gnupg2, gpm,
+	gst-plugins-good, gst1-plugins-good, freetype, libao, libevas,
+	libevent, libfribidi, libgcrypt, libgtk2, libshout, libsrtp,
+	libtheora, libupnpp, libxmlrpc, linux, make, opus, pinentry,
+	rpi-firmware, shared-mime-info, vlc, vorbis-tools,
+	xcb-util-keysyms
+
+	Removed packages: libgc
+
 2015.02-rc3, Released February 24th, 2015
 
 	Minor fixes.
diff --git a/Makefile b/Makefile
index 8a01f42..a05a4fa 100644
--- a/Makefile
+++ b/Makefile
@@ -28,7 +28,7 @@
 all:
 
 # Set and export the version string
-export BR2_VERSION := 2015.02-rc3
+export BR2_VERSION := 2015.02
 
 # Check for minimal make version (note: this check will break at make 10.x)
 MIN_MAKE_VERSION = 3.81
diff --git a/docs/website/download.html b/docs/website/download.html
index a9b5586..bfacd82 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -7,17 +7,17 @@
 
 <p>
 
-The latest stable release is <b>2014.11</b>, which can be downloaded
+The latest stable release is <b>2015.02</b>, which can be downloaded
 here:<p>
 
-<a href="/downloads/buildroot-2014.11.tar.gz">buildroot-2014.11.tar.gz</a>
-(<a href="/downloads/buildroot-2014.11.tar.gz.sign">PGP signature</a>)
+<a href="/downloads/buildroot-2015.02.tar.gz">buildroot-2015.02.tar.gz</a>
+(<a href="/downloads/buildroot-2015.02.tar.gz.sign">PGP signature</a>)
 or
-<a href="/downloads/buildroot-2014.11.tar.bz2">buildroot-2014.11.tar.bz2</a>
-(<a href="/downloads/buildroot-2014.11.tar.bz2.sign">PGP signature</a>).
+<a href="/downloads/buildroot-2015.02.tar.bz2">buildroot-2015.02.tar.bz2</a>
+(<a href="/downloads/buildroot-2015.02.tar.bz2.sign">PGP signature</a>).
 
 <p>
-
+<!--
 The latest release candidate is <b>2015.02-rc3</b>, which can be
 downloaded here:<p>
 
@@ -32,7 +32,7 @@ This and earlier releases (and their PGP signatures) can always be downloaded fr
 <a href="/downloads/">http://buildroot.net/downloads/</a>.
 
 <p>
-
+-->
 You can also obtain daily snapshots of the latest Buildroot source tree if you
 want to follow development, but cannot or do not wish to use Git.
 
diff --git a/docs/website/news.html b/docs/website/news.html
index cc970d7..99c9855 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -8,7 +8,16 @@
 <p>
 
 <ul>
-  <li><b>24 February 2015 -- 2015.02-rc3 released</b>
+  <li><b>1 March 2015 -- 2015.02 released</b>
+
+    <p>The stable 2015.02 release is out - Thanks to everyone
+    contributing and testing the release candidates. See the
+    <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2015.02">CHANGES</a>
+    file for more details,
+    and go to the <a href="/downloads/">downloads page</a> to pick up the
+    <a href="/downloads/buildroot-2015.02.tar.bz2">2015.02 release</a>.</p>
+
+ <li><b>24 February 2015 -- 2015.02-rc3 released</b>
 
     <p>Release candidate 3 is out with more cleanups and security / build fixes. See the <a
     href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2015.02-rc3">CHANGES</a>
