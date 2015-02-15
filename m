From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 15 Feb 2015 23:44:43 +0100
Subject: [Buildroot] [git commit] Update for 2015.02-rc2
Message-ID: <20150215225108.62E4D80406@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bc11392de77e1cc2d3f516d76f87f1b6de8d5d3f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                    |   10 ++++++++++
 Makefile                   |    2 +-
 docs/website/download.html |   10 +++++-----
 docs/website/news.html     |   13 +++++++++++++
 4 files changed, 29 insertions(+), 6 deletions(-)

diff --git a/CHANGES b/CHANGES
index e8ba141..b3cfee7 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,13 @@
+2015.02-rc2, Released February 15th, 2015
+
+	Minor fixes.
+
+	raspberrypi: fix kernel sha1 for DT variant.
+
+	Updated/fixed packages: dbus, dvdauthor, git, libsemanage,
+	libsepol, libssh2, mplayer, ntp, openvmtools, python3,
+	qt5base, qt5connectivity, xserver_xorg-server
+
 2015.02-rc1, Released February 8th, 2015
 
 	Fixes all over the tree and new features.
diff --git a/Makefile b/Makefile
index f21f924..19c3997 100644
--- a/Makefile
+++ b/Makefile
@@ -28,7 +28,7 @@
 all:
 
 # Set and export the version string
-export BR2_VERSION := 2015.02-rc1
+export BR2_VERSION := 2015.02-rc2
 
 # Check for minimal make version (note: this check will break at make 10.x)
 MIN_MAKE_VERSION = 3.81
diff --git a/docs/website/download.html b/docs/website/download.html
index 7d4e243..1f13fcd 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -18,14 +18,14 @@ or
 
 <p>
 
-The latest release candidate is <b>2015.02-rc1</b>, which can be
+The latest release candidate is <b>2015.02-rc2</b>, which can be
 downloaded here:<p>
 
-<a href="/downloads/buildroot-2015.02-rc1.tar.gz">buildroot-2015.02-rc1.tar.gz</a>
-(<a href="/downloads/buildroot-2015.02-rc1.tar.gz.sign">PGP signature</a>)
+<a href="/downloads/buildroot-2015.02-rc2.tar.gz">buildroot-2015.02-rc2.tar.gz</a>
+(<a href="/downloads/buildroot-2015.02-rc2.tar.gz.sign">PGP signature</a>)
 or
-<a href="/downloads/buildroot-2015.02-rc1.tar.bz2">buildroot-2015.02-rc1.tar.bz2</a>
-(<a href="/downloads/buildroot-2015.02-rc1.tar.bz2.sign">PGP signature</a>).
+<a href="/downloads/buildroot-2015.02-rc2.tar.bz2">buildroot-2015.02-rc2.tar.bz2</a>
+(<a href="/downloads/buildroot-2015.02-rc2.tar.bz2.sign">PGP signature</a>).
 <p>
 
 This and earlier releases (and their PGP signatures) can always be downloaded from
diff --git a/docs/website/news.html b/docs/website/news.html
index 31ddd57..5d8e1b1 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -8,6 +8,19 @@
 <p>
 
 <ul>
+  <li><b>15 February 2015 -- 2015.02-rc2 released</b>
+
+    <p>Another week, another release candidate with more cleanups and
+    build fixes. See the <a
+    href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2015.02-rc2">CHANGES</a>
+    file for details.</p>
+
+    <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
+    <a href="/downloads/buildroot-2015.02-rc2.tar.bz2">2015.02-rc2
+    release candidate</a>, and report any problems found to the <a
+    href="support.html">mailing list</a> or <a
+    href="https://bugs.uclibc.org">bug tracker</a>.</p>
+
   <li><b>8 February 2015 -- 2015.02-rc1 released</b>
 
     <p>We have a new release candidate! Lots of changes all over the
