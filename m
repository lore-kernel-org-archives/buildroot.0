From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 1 Sep 2014 13:20:56 +0200
Subject: [Buildroot] [git commit] Update for 2014.08
Message-ID: <20140901113155.7C2509D33A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fcd720dfcf702d796fbc625b9abc4c06cb848d84
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES            |   16 ++++++++++++++++
 Makefile           |    2 +-
 docs/download.html |   14 +++++++-------
 docs/news.html     |    9 +++++++++
 4 files changed, 33 insertions(+), 8 deletions(-)

diff --git a/CHANGES b/CHANGES
index 277b6d0..e239fcd 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,19 @@
+2014.08, Released September 1st, 2014
+
+	Minor manual fixes/additions.
+
+	Updated/fixed packages: btrfs-progs, cmake, cppcms, exim,
+	lftp, libdaemon, libev, libgpgme, libiqrf, libnl, libplist,
+	libroxml, libwebsockets, mesa3d, mpd, mtdev2tuio, musepack,
+	perl-gd, php-geoip, php-gnupg, php-imagick, php-memcached,
+	php-ssh2, php-yaml, php-zmq, polarssl, ruby, systemd, taglib,
+	uboot-tools, upmpdcli, webkit, xapp_xfs, xapp_luit,
+	xscreensaver, yajl
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#7346: vim-8ae50e3ef8bf.tar.gz can not be downloaded, 404 not found
+
 2014.08-rc3, Released August 26th, 2014
 
 	Minor fixes.
diff --git a/Makefile b/Makefile
index f2ff6e8..3ebfd55 100644
--- a/Makefile
+++ b/Makefile
@@ -25,7 +25,7 @@
 #--------------------------------------------------------------
 
 # Set and export the version string
-export BR2_VERSION := 2014.08-rc3
+export BR2_VERSION := 2014.08
 
 # Check for minimal make version (note: this check will break at make 10.x)
 MIN_MAKE_VERSION = 3.81
diff --git a/docs/download.html b/docs/download.html
index 659ee24..88efbe7 100644
--- a/docs/download.html
+++ b/docs/download.html
@@ -4,17 +4,17 @@
 
 <p>
 
-The latest stable release is <b>2014.05</b>, which can be downloaded
+The latest stable release is <b>2014.08</b>, which can be downloaded
 here:<p>
 
-<a href="/downloads/buildroot-2014.05.tar.gz">buildroot-2014.05.tar.gz</a>
-(<a href="/downloads/buildroot-2014.05.tar.gz.sign">PGP signature</a>)
+<a href="/downloads/buildroot-2014.08.tar.gz">buildroot-2014.08.tar.gz</a>
+(<a href="/downloads/buildroot-2014.08.tar.gz.sign">PGP signature</a>)
 or
-<a href="/downloads/buildroot-2014.05.tar.bz2">buildroot-2014.05.tar.bz2</a>
-(<a href="/downloads/buildroot-2014.05.tar.bz2.sign">PGP signature</a>).
+<a href="/downloads/buildroot-2014.08.tar.bz2">buildroot-2014.08.tar.bz2</a>
+(<a href="/downloads/buildroot-2014.08.tar.bz2.sign">PGP signature</a>).
 
 <p>
-
+<!--
 The latest release candidate is <b>2014.08-rc3</b>, which can be
 downloaded here:<p>
 
@@ -29,7 +29,7 @@ This and earlier releases (and their PGP signatures) can always be downloaded fr
 <a href="/downloads/">http://buildroot.net/downloads/</a>.
 
 <p>
-
+-->
 You can also obtain daily snapshots of the latest Buildroot source tree if you
 want to follow development, but cannot or do not wish to use Git.
 
diff --git a/docs/news.html b/docs/news.html
index c06a0cc..ba3ee84 100644
--- a/docs/news.html
+++ b/docs/news.html
@@ -6,6 +6,15 @@
 
 <ul>
 
+  <li><b>1 September 2014 -- 2014.08 released</b>
+
+    <p>The stable 2014.08 release is out - Thanks to everyone
+    contributing and testing the release candidates. See the
+    <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2014.08">CHANGES</a>
+    file for more details,
+    and go to the <a href="/downloads/">downloads page</a> to pick up the
+    <a href="/downloads/buildroot-2014.08.tar.bz2">2014.08 release</a>.</p>
+
   <li><b>26 August 2014 -- 2014.08-rc3 released</b>
 
     <p>Release candidate 3 is out with more cleanups and build fixes. See the <a
