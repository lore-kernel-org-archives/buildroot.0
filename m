From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Aug 2012 22:47:23 +0200
Subject: [Buildroot] [git commit] Prepare for 2012.08-rc3
Message-ID: <20120825204803.5DBDA99345@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8437b56258b7ae2e6ab763160a56d8e2a10f824a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 CHANGES            |   10 ++++++++++
 Makefile           |    2 +-
 docs/download.html |    6 +++---
 docs/news.html     |   13 +++++++++++++
 4 files changed, 27 insertions(+), 4 deletions(-)

diff --git a/CHANGES b/CHANGES
index 5bc79be..7049c38 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,13 @@
+2012.08-rc3, Released August 25th, 2012
+
+	Updated/fixed packages: libglib2, netsnmp, freetype, libfuse,
+	libpng, x11vnc, zlib, gpsd, ifplugd, bash, distcc.
+
+	Added license informations for: barebox, grub, syslinux,
+	uboot, xloader, yajl, zlib, zxing, alsa-lib, alsa-utils,
+	faad2, nano, fbdump, rsync, librsync, fontconfig,
+	inotify-tools,
+
 2012.08-rc2, Released August 15th, 2012
 
 	Updated/fixed packages: imagemagick, sudo, crosstool-ng.
diff --git a/Makefile b/Makefile
index 77ca4a0..d59a548 100644
--- a/Makefile
+++ b/Makefile
@@ -24,7 +24,7 @@
 #--------------------------------------------------------------
 
 # Set and export the version string
-export BR2_VERSION:=2012.08-rc2
+export BR2_VERSION:=2012.08-rc3
 
 # Check for minimal make version (note: this check will break at make 10.x)
 MIN_MAKE_VERSION=3.81
diff --git a/docs/download.html b/docs/download.html
index 7379863..e53bfb6 100644
--- a/docs/download.html
+++ b/docs/download.html
@@ -13,12 +13,12 @@ here:<p>
 or
 <a href="/downloads/buildroot-2012.05.tar.bz2">buildroot-2012.05.tar.bz2</a>.
 <p>
-The latest release candidate is <b>2012.08-rc2</b>, which can be
+The latest release candidate is <b>2012.08-rc3</b>, which can be
 downloaded here:<p>
 
-<a href="/downloads/buildroot-2012.08-rc2.tar.gz">buildroot-2012.08-rc2.tar.gz</a>
+<a href="/downloads/buildroot-2012.08-rc3.tar.gz">buildroot-2012.08-rc3.tar.gz</a>
 or
-<a href="/downloads/buildroot-2012.08-rc2.tar.bz2">buildroot-2012.08-rc2.tar.bz2</a>.
+<a href="/downloads/buildroot-2012.08-rc3.tar.bz2">buildroot-2012.08-rc3.tar.bz2</a>.
 <p>
 -->
 This and earlier releases can always be downloaded from
diff --git a/docs/news.html b/docs/news.html
index e519c31..abe4085 100644
--- a/docs/news.html
+++ b/docs/news.html
@@ -5,6 +5,19 @@
 <p>
 
 <ul>
+   <li><b>25 August 2012 -- 2012.08-rc3 released</b>
+
+     <p>We have a new release candidate! Various fixes, and addition
+     of licensing informations on many
+     packages. See <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2012.08_rc3">CHANGES</a>
+     file for details</p>
+
+     <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
+     <a href="/downloads/buildroot-2012.08-rc3.tar.bz2">2012.08-rc3
+     release candidate</a>, and report any problems found to the <a
+     href="lists.html">mailing list</a> or <a
+     href="https://bugs.uclibc.org">bug tracker</a>.</p>
+
    <li><b>15 August 2012 -- 2012.08-rc2 released</b>
 
      <p>We have a new release candidate! Various fixes, and addition
