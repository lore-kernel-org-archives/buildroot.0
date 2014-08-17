From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 18 Aug 2014 01:04:16 +0200
Subject: [Buildroot] [git commit] Update for 2014.08-rc2
Message-ID: <20140817230452.593369D481@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7dc7c7904b98baf38deae71b8fae61c87679e80b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES            |   14 ++++++++++----
 Makefile           |    2 +-
 docs/download.html |   10 +++++-----
 docs/news.html     |   13 +++++++++++++
 4 files changed, 29 insertions(+), 10 deletions(-)

diff --git a/CHANGES b/CHANGES
index bc95da5..11f8636 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,13 +1,19 @@
-2014.08, Not yet released:
+2014.08-rc2, Released August 18th, 2014
 
 	Fixes all over the tree.
 
+	User manual restructured / reworked.
+
+	Toolchain: Fix for C++ exceptions / pthread_exit() on
+	uClibc/glibc, C++-11 features with uClibc.
+
 	Updated/fixed packages: bandwidthd, bluez5_utils, empty,
 	espeak, fbv, ffmpeg, gd, gnupg2, gst1-plugin-good, iftop,
 	infozip, libcuefile, libeml, libnftl, localedef, ltrace,
-	matchbox, network-manager, nftables, ngrep, openssl, perl,
-	perl-net-ssleay, postgresql, pppd, procps-ng, qt, subversion,
-	synergy, systemd, tar, tftpd, webkit, xapp_rstart, xbmc
+	matchbox, mpd, network-manager, nftables, ngrep, nut, openssl,
+	oprofile, perl, perl-net-ssleay, postgresql, pppd, procps-ng,
+	qt, subversion, synergy, systemd, tar, tftpd, webkit,
+	xapp_rstart, xbmc, xbmc-pvr-addons
 
 	Issues resolved (http://bugs.uclibc.org):
 
diff --git a/Makefile b/Makefile
index 0b6e597..e6b46fb 100644
--- a/Makefile
+++ b/Makefile
@@ -25,7 +25,7 @@
 #--------------------------------------------------------------
 
 # Set and export the version string
-export BR2_VERSION := 2014.08-rc1
+export BR2_VERSION := 2014.08-rc2
 
 # Check for minimal make version (note: this check will break at make 10.x)
 MIN_MAKE_VERSION = 3.81
diff --git a/docs/download.html b/docs/download.html
index f8cb7e2..d46182d 100644
--- a/docs/download.html
+++ b/docs/download.html
@@ -15,14 +15,14 @@ or
 
 <p>
 
-The latest release candidate is <b>2014.08-rc1</b>, which can be
+The latest release candidate is <b>2014.08-rc2</b>, which can be
 downloaded here:<p>
 
-<a href="/downloads/buildroot-2014.08-rc1.tar.gz">buildroot-2014.08-rc1.tar.gz</a>
-(<a href="/downloads/buildroot-2014.08-rc1.tar.gz.sign">PGP signature</a>)
+<a href="/downloads/buildroot-2014.08-rc2.tar.gz">buildroot-2014.08-rc2.tar.gz</a>
+(<a href="/downloads/buildroot-2014.08-rc2.tar.gz.sign">PGP signature</a>)
 or
-<a href="/downloads/buildroot-2014.08-rc1.tar.bz2">buildroot-2014.08-rc1.tar.bz2</a>
-(<a href="/downloads/buildroot-2014.08-rc1.tar.bz2.sign">PGP signature</a>).
+<a href="/downloads/buildroot-2014.08-rc2.tar.bz2">buildroot-2014.08-rc2.tar.bz2</a>
+(<a href="/downloads/buildroot-2014.08-rc2.tar.bz2.sign">PGP signature</a>).
 <p>
 
 This and earlier releases (and their PGP signatures) can always be downloaded from
diff --git a/docs/news.html b/docs/news.html
index 2b9e042..44c5ace 100644
--- a/docs/news.html
+++ b/docs/news.html
@@ -6,6 +6,19 @@
 
 <ul>
 
+  <li><b>18 August 2014 -- 2014.08-rc2 released</b>
+
+    <p>Another week, another release candidate with more cleanups and
+    build fixes. See the <a
+    href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2014.08-rc2">CHANGES</a>
+    file for details.</p>
+
+    <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
+    <a href="/downloads/buildroot-2014.08-rc2.tar.bz2">2014.08-rc2
+    release candidate</a>, and report any problems found to the <a
+    href="support.html">mailing list</a> or <a
+    href="https://bugs.uclibc.org">bug tracker</a>.</p>
+
   <li><b>8 August 2014 -- 2014.08-rc1 released</b>
 
     <p>We have a new release candidate! Lots of changes all over the
