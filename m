From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 24 Feb 2015 00:24:19 +0100
Subject: [Buildroot] [git commit] Update for 2015.02-rc3
Message-ID: <20150223232717.B9FCE8178B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=345f32e67d44368c031777d694c4c75823b41bfd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                    |   11 +++++++++++
 Makefile                   |    2 +-
 docs/website/download.html |   10 +++++-----
 docs/website/news.html     |   12 ++++++++++++
 4 files changed, 29 insertions(+), 6 deletions(-)

diff --git a/CHANGES b/CHANGES
index b3cfee7..401b2e4 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,14 @@
+2015.02-rc3, Released February 24th, 2015
+
+	Minor fixes.
+
+	Cmake and rebar (erlang) infrastructure fixes.
+
+	Updated/fixed packages: bind, btrfs-progs, busybox, e2fsprogs,
+	evtest, ffmpeg, fltk, gnutls, i2c-tools, imagemagick, libxcb,
+	make, mjpg-streamer, netsnmp, opentyrian, php, polarssl,
+	qt5base, samba, samba4, sudo, util-linux, xserver_xorg-server
+
 2015.02-rc2, Released February 15th, 2015
 
 	Minor fixes.
diff --git a/Makefile b/Makefile
index 19c3997..8a01f42 100644
--- a/Makefile
+++ b/Makefile
@@ -28,7 +28,7 @@
 all:
 
 # Set and export the version string
-export BR2_VERSION := 2015.02-rc2
+export BR2_VERSION := 2015.02-rc3
 
 # Check for minimal make version (note: this check will break at make 10.x)
 MIN_MAKE_VERSION = 3.81
diff --git a/docs/website/download.html b/docs/website/download.html
index 1f13fcd..a9b5586 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -18,14 +18,14 @@ or
 
 <p>
 
-The latest release candidate is <b>2015.02-rc2</b>, which can be
+The latest release candidate is <b>2015.02-rc3</b>, which can be
 downloaded here:<p>
 
-<a href="/downloads/buildroot-2015.02-rc2.tar.gz">buildroot-2015.02-rc2.tar.gz</a>
-(<a href="/downloads/buildroot-2015.02-rc2.tar.gz.sign">PGP signature</a>)
+<a href="/downloads/buildroot-2015.02-rc3.tar.gz">buildroot-2015.02-rc3.tar.gz</a>
+(<a href="/downloads/buildroot-2015.02-rc3.tar.gz.sign">PGP signature</a>)
 or
-<a href="/downloads/buildroot-2015.02-rc2.tar.bz2">buildroot-2015.02-rc2.tar.bz2</a>
-(<a href="/downloads/buildroot-2015.02-rc2.tar.bz2.sign">PGP signature</a>).
+<a href="/downloads/buildroot-2015.02-rc3.tar.bz2">buildroot-2015.02-rc3.tar.bz2</a>
+(<a href="/downloads/buildroot-2015.02-rc3.tar.bz2.sign">PGP signature</a>).
 <p>
 
 This and earlier releases (and their PGP signatures) can always be downloaded from
diff --git a/docs/website/news.html b/docs/website/news.html
index 5d8e1b1..cc970d7 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -8,6 +8,18 @@
 <p>
 
 <ul>
+  <li><b>24 February 2015 -- 2015.02-rc3 released</b>
+
+    <p>Release candidate 3 is out with more cleanups and security / build fixes. See the <a
+    href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2015.02-rc3">CHANGES</a>
+    file for details.</p>
+
+    <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
+    <a href="/downloads/buildroot-2015.02-rc3.tar.bz2">2015.02-rc3
+    release candidate</a>, and report any problems found to the <a
+    href="lists.html">mailing list</a> or <a
+    href="https://bugs.uclibc.org">bug tracker</a>.</p>
+
   <li><b>15 February 2015 -- 2015.02-rc2 released</b>
 
     <p>Another week, another release candidate with more cleanups and
