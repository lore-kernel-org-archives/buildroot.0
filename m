From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 25 Feb 2014 08:49:04 +0100
Subject: [Buildroot] [git commit] Update for 2014.02-rc3
Message-ID: <20140225075435.32FEB9BA89@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=98f7e12c50e0e042af49f34f832055edabb93ac6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES            |   23 +++++++++++++++++++++++
 Makefile           |    2 +-
 docs/download.html |   10 +++++-----
 docs/news.html     |   12 ++++++++++++
 4 files changed, 41 insertions(+), 6 deletions(-)

diff --git a/CHANGES b/CHANGES
index df9abd3..363a0bb 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,26 @@
+2014.02-rc3, Released February 25th, 2014
+
+	Minor fixes.
+
+	Updated/fixed packages: aiccu, ala-lib, alsa-utils, binutils,
+	cairo, coreutils, dhcpcd, distcc, efl, evas, iputils, gdb,
+	gpsd, gst-fsl-plugins, icu, libcec, libcgi, libplayer,
+	libsecret, libsepol, libsigsegv, libtool, libv4l,
+	linux-headers, matchbox-lib, mpg123, ncftp, opencv, pcmanfm,
+	pixman, pv, qt, rt-tests, sawman, sconeserver, sdl, thrift,
+	tvheadend, util-linux, webkit, xscreensaver
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#4706: Removing .stamp_target_installed does not trigger...
+	#5030: busybox built fails if we use an override src dir...
+	#5420: Dbus and /var/run management
+	#5768: Not able to build ALSA-Lib for static build
+	#5774: Not able to build ALSA-Utils for static build
+	#6542: external python modules fail to compile to pyc if...
+	#6764: Support for kernel signed modules
+	#6794: Busybox compiled from buildroot hangs on pass from...
+
 2014.02-rc2, Released February 20th, 2014
 
 	Fixes all over the tree. Static linking / nommu fixes and
diff --git a/Makefile b/Makefile
index 312babd..63baafb 100644
--- a/Makefile
+++ b/Makefile
@@ -25,7 +25,7 @@
 #--------------------------------------------------------------
 
 # Set and export the version string
-export BR2_VERSION:=2014.02-rc2
+export BR2_VERSION:=2014.02-rc3
 
 # Check for minimal make version (note: this check will break at make 10.x)
 MIN_MAKE_VERSION=3.81
diff --git a/docs/download.html b/docs/download.html
index 2c08fcb..66c7da7 100644
--- a/docs/download.html
+++ b/docs/download.html
@@ -17,14 +17,14 @@ or
 
 <p>
 
-The latest release candidate is <b>2014.02-rc2</b>, which can be
+The latest release candidate is <b>2014.02-rc3</b>, which can be
 downloaded here:<p>
 
-<a href="/downloads/buildroot-2014.02-rc2.tar.gz">buildroot-2014.02-rc2.tar.gz</a>
-(<a href="/downloads/buildroot-2014.02-rc2.tar.gz.sign">PGP signature</a>)
+<a href="/downloads/buildroot-2014.02-rc3.tar.gz">buildroot-2014.02-rc3.tar.gz</a>
+(<a href="/downloads/buildroot-2014.02-rc3.tar.gz.sign">PGP signature</a>)
 or
-<a href="/downloads/buildroot-2014.02-rc2.tar.bz2">buildroot-2014.02-rc2.tar.bz2</a>
-(<a href="/downloads/buildroot-2014.02-rc2.tar.bz2.sign">PGP signature</a>).
+<a href="/downloads/buildroot-2014.02-rc3.tar.bz2">buildroot-2014.02-rc3.tar.bz2</a>
+(<a href="/downloads/buildroot-2014.02-rc3.tar.bz2.sign">PGP signature</a>).
 <p>
 
 This and earlier releases (and their PGP signatures) can always be downloaded from
diff --git a/docs/news.html b/docs/news.html
index e3d8423..92ff34d 100644
--- a/docs/news.html
+++ b/docs/news.html
@@ -5,6 +5,18 @@
 <p>
 
 <ul>
+  <li><b>25 February 2014 -- 2014.02-rc3 released</b>
+
+    <p>Release candidate 3 is out with more cleanups and build fixes. See the <a
+    href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2014.02-rc3">CHANGES</a>
+    file for details.</p>
+
+    <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
+    <a href="/downloads/buildroot-2014.02-rc3.tar.bz2">2014.02-rc3
+    release candidate</a>, and report any problems found to the <a
+    href="lists.html">mailing list</a> or <a
+    href="https://bugs.uclibc.org">bug tracker</a>.</p>
+
   <li><b>20 February 2014 -- 2014.02-rc2 released</b>
 
     <p>Another week, another release candidate with more cleanups and
