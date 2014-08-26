From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 26 Aug 2014 10:26:38 +0200
Subject: [Buildroot] [git commit] Update for 2014.08-rc3
Message-ID: <20140826082711.6448C9D547@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fdff7150896163e2962eb5172c7606afe2ca1fd7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES            |   18 ++++++++++++++++++
 Makefile           |    2 +-
 docs/download.html |   10 +++++-----
 docs/news.html     |   12 ++++++++++++
 4 files changed, 36 insertions(+), 6 deletions(-)

diff --git a/CHANGES b/CHANGES
index 11f8636..277b6d0 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,21 @@
+2014.08-rc3, Released August 26th, 2014
+
+	Minor fixes.
+
+	User manual update / restructuring.
+
+	Updated/fixed packages: cairo, ecryptfs-utils, gettext,
+	gstreamer, gstreamer1, gutenprint, icu, imagemagick, jack2,
+	lbreakout2, libevas-generic-loaders, libftdi, libinput,
+	libtorrent, ltris, msgpack, ntp, php, procps-ng, pulseaudio,
+	thrift, tvheadend, usb_modeswitch, xmlstarlet,
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#7136: ecryptfs-utils needs gettext to run when glibc/eglibc...
+	#7322: libgomp dependency issue with imagemagick
+	#7328: Git dl of versions in x/y broken
+
 2014.08-rc2, Released August 18th, 2014
 
 	Fixes all over the tree.
diff --git a/Makefile b/Makefile
index e6b46fb..f2ff6e8 100644
--- a/Makefile
+++ b/Makefile
@@ -25,7 +25,7 @@
 #--------------------------------------------------------------
 
 # Set and export the version string
-export BR2_VERSION := 2014.08-rc2
+export BR2_VERSION := 2014.08-rc3
 
 # Check for minimal make version (note: this check will break at make 10.x)
 MIN_MAKE_VERSION = 3.81
diff --git a/docs/download.html b/docs/download.html
index d46182d..659ee24 100644
--- a/docs/download.html
+++ b/docs/download.html
@@ -15,14 +15,14 @@ or
 
 <p>
 
-The latest release candidate is <b>2014.08-rc2</b>, which can be
+The latest release candidate is <b>2014.08-rc3</b>, which can be
 downloaded here:<p>
 
-<a href="/downloads/buildroot-2014.08-rc2.tar.gz">buildroot-2014.08-rc2.tar.gz</a>
-(<a href="/downloads/buildroot-2014.08-rc2.tar.gz.sign">PGP signature</a>)
+<a href="/downloads/buildroot-2014.08-rc3.tar.gz">buildroot-2014.08-rc3.tar.gz</a>
+(<a href="/downloads/buildroot-2014.08-rc3.tar.gz.sign">PGP signature</a>)
 or
-<a href="/downloads/buildroot-2014.08-rc2.tar.bz2">buildroot-2014.08-rc2.tar.bz2</a>
-(<a href="/downloads/buildroot-2014.08-rc2.tar.bz2.sign">PGP signature</a>).
+<a href="/downloads/buildroot-2014.08-rc3.tar.bz2">buildroot-2014.08-rc3.tar.bz2</a>
+(<a href="/downloads/buildroot-2014.08-rc3.tar.bz2.sign">PGP signature</a>).
 <p>
 
 This and earlier releases (and their PGP signatures) can always be downloaded from
diff --git a/docs/news.html b/docs/news.html
index 44c5ace..c06a0cc 100644
--- a/docs/news.html
+++ b/docs/news.html
@@ -6,6 +6,18 @@
 
 <ul>
 
+  <li><b>26 August 2014 -- 2014.08-rc3 released</b>
+
+    <p>Release candidate 3 is out with more cleanups and build fixes. See the <a
+    href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2014.08-rc3">CHANGES</a>
+    file for details.</p>
+
+    <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
+    <a href="/downloads/buildroot-2014.08-rc3.tar.bz2">2014.08-rc3
+    release candidate</a>, and report any problems found to the <a
+    href="lists.html">mailing list</a> or <a
+    href="https://bugs.uclibc.org">bug tracker</a>.</p>
+
   <li><b>18 August 2014 -- 2014.08-rc2 released</b>
 
     <p>Another week, another release candidate with more cleanups and
