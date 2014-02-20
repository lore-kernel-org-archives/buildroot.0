From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 20 Feb 2014 09:24:32 +0100
Subject: [Buildroot] [git commit] Update for 2014.02-rc2
Message-ID: <20140220082606.E8F229CAD4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=085d4f02706de9dcf7e76c3967a060bc6eddc292
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES            |   23 +++++++++++++++++++++++
 Makefile           |    2 +-
 docs/download.html |   10 +++++-----
 docs/news.html     |   13 +++++++++++++
 4 files changed, 42 insertions(+), 6 deletions(-)

diff --git a/CHANGES b/CHANGES
index 8a73cc1..df9abd3 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,26 @@
+2014.02-rc2, Released February 20th, 2014
+
+	Fixes all over the tree. Static linking / nommu fixes and
+	annotations for several packages.
+
+	Updated/fixed packages: boost, busybox, collectd, coreutils,
+	dropbear, elfutils, feh, gcc, gst1-libav, imagemagick, iozone,
+	jimtcl, kexec, libvncserver, lvm2, lxc, mplayer, netsnmp, nut,
+	opencv, python, python3, qtuio, systemd, thrift, transmission,
+	uclibc, vlc, webkit
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#5450: AT91SAM9260 Bootstrap compilation problem
+	#5582: libiconv 1.14 failed to build
+	#5624: When building directfb, BR2_TARGET_LDFLAGS not used by..
+	#5852: [2012.11] usb_modeswitch should depends of "BR2_PACK..
+	#6218: binutils-2.23.2/gas fails with undefined reference to..
+	#6236: binutils-2.23.2/bfd fails with undefined reference to..
+	#6470: If the build directory is a child of /usr, the build..
+	#6776: systemd error: static declaration of 'execvpe' follows..
+	#6818: toolchainfile.cmake has absolut path references
+
 2014.02-rc1, Released February 11th, 2014
 
 	Fixes all over the tree and new features.
diff --git a/Makefile b/Makefile
index 8226111..98d32c0 100644
--- a/Makefile
+++ b/Makefile
@@ -25,7 +25,7 @@
 #--------------------------------------------------------------
 
 # Set and export the version string
-export BR2_VERSION:=2014.02-rc1
+export BR2_VERSION:=2014.02-rc2
 
 # Check for minimal make version (note: this check will break at make 10.x)
 MIN_MAKE_VERSION=3.81
diff --git a/docs/download.html b/docs/download.html
index 1d2a8af..2c08fcb 100644
--- a/docs/download.html
+++ b/docs/download.html
@@ -17,14 +17,14 @@ or
 
 <p>
 
-The latest release candidate is <b>2014.02-rc1</b>, which can be
+The latest release candidate is <b>2014.02-rc2</b>, which can be
 downloaded here:<p>
 
-<a href="/downloads/buildroot-2014.02-rc1.tar.gz">buildroot-2014.02-rc1.tar.gz</a>
-(<a href="/downloads/buildroot-2014.02-rc1.tar.gz.sign">PGP signature</a>)
+<a href="/downloads/buildroot-2014.02-rc2.tar.gz">buildroot-2014.02-rc2.tar.gz</a>
+(<a href="/downloads/buildroot-2014.02-rc2.tar.gz.sign">PGP signature</a>)
 or
-<a href="/downloads/buildroot-2014.02-rc1.tar.bz2">buildroot-2014.02-rc1.tar.bz2</a>
-(<a href="/downloads/buildroot-2014.02-rc1.tar.bz2.sign">PGP signature</a>).
+<a href="/downloads/buildroot-2014.02-rc2.tar.bz2">buildroot-2014.02-rc2.tar.bz2</a>
+(<a href="/downloads/buildroot-2014.02-rc2.tar.bz2.sign">PGP signature</a>).
 <p>
 
 This and earlier releases (and their PGP signatures) can always be downloaded from
diff --git a/docs/news.html b/docs/news.html
index 03a2a8c..e3d8423 100644
--- a/docs/news.html
+++ b/docs/news.html
@@ -5,6 +5,19 @@
 <p>
 
 <ul>
+  <li><b>20 February 2014 -- 2014.02-rc2 released</b>
+
+    <p>Another week, another release candidate with more cleanups and
+    build fixes. See the <a
+    href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2014.02-rc2">CHANGES</a>
+    file for details.</p>
+
+    <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
+    <a href="/downloads/buildroot-2014.02-rc2.tar.bz2">2014.02-rc2
+    release candidate</a>, and report any problems found to the <a
+    href="lists.html">mailing list</a> or <a
+    href="https://bugs.uclibc.org">bug tracker</a>.</p>
+
   <li><b>11 February 2014 -- 2014.02-rc1 released</b>
 
     <p>We have a new release candidate! Lots of changes all over the
