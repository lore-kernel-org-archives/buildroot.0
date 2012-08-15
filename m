From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 15 Aug 2012 12:11:48 +0200
Subject: [Buildroot] [git commit] Update for 2012.08-rc2
Message-ID: <20120815101214.D9D29971B3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b58c83ae999966975c278c860cb97aee0d2e8e08
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 CHANGES            |   18 ++++++++++++++++++
 Makefile           |    2 +-
 docs/download.html |    6 +++---
 docs/news.html     |   13 +++++++++++++
 4 files changed, 35 insertions(+), 4 deletions(-)

diff --git a/CHANGES b/CHANGES
index fb5160d..5bc79be 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,21 @@
+2012.08-rc2, Released August 15th, 2012
+
+	Updated/fixed packages: imagemagick, sudo, crosstool-ng.
+
+	Added license informations for: mxml, nanocom, empty, expat,
+	lua, lucjson, xinetd, cjson, luaexpat, lmbench, bwm-ng,
+	input-event-daemon, luajit, cgilua, copas, coxpcall,
+	luafilesystem, luasocket, rings, wsapi, xavante, libtpl,
+	avahi, busybox, libfcgi, ifplugd, libcgicc, libcurl,
+	libdaemon, libdnet, libgpg-error, libpcap, libpng, lighttpd,
+	mtd, openssl, psmisc, socat, spawn-fcgi.
+
+	Fixes to Microblaze external toolchains
+	configuration. Improvements of the pkg-stats
+	script. Out-of-tree fix for the graph-depends script.
+
+	Kernel headers version bump.
+
 2012.08-rc1, Released August 1st, 2012
 
 	Fixes all over the tree and new features.
diff --git a/Makefile b/Makefile
index 079af65..9ab7d99 100644
--- a/Makefile
+++ b/Makefile
@@ -24,7 +24,7 @@
 #--------------------------------------------------------------
 
 # Set and export the version string
-export BR2_VERSION:=2012.08-rc1
+export BR2_VERSION:=2012.08-rc2
 
 # Check for minimal make version (note: this check will break at make 10.x)
 MIN_MAKE_VERSION=3.81
diff --git a/docs/download.html b/docs/download.html
index c00a356..7379863 100644
--- a/docs/download.html
+++ b/docs/download.html
@@ -13,12 +13,12 @@ here:<p>
 or
 <a href="/downloads/buildroot-2012.05.tar.bz2">buildroot-2012.05.tar.bz2</a>.
 <p>
-The latest release candidate is <b>2012.08-rc1</b>, which can be
+The latest release candidate is <b>2012.08-rc2</b>, which can be
 downloaded here:<p>
 
-<a href="/downloads/buildroot-2012.08-rc1.tar.gz">buildroot-2012.08-rc1.tar.gz</a>
+<a href="/downloads/buildroot-2012.08-rc2.tar.gz">buildroot-2012.08-rc2.tar.gz</a>
 or
-<a href="/downloads/buildroot-2012.08-rc1.tar.bz2">buildroot-2012.08-rc1.tar.bz2</a>.
+<a href="/downloads/buildroot-2012.08-rc2.tar.bz2">buildroot-2012.08-rc2.tar.bz2</a>.
 <p>
 -->
 This and earlier releases can always be downloaded from
diff --git a/docs/news.html b/docs/news.html
index 4114b03..e519c31 100644
--- a/docs/news.html
+++ b/docs/news.html
@@ -5,6 +5,19 @@
 <p>
 
 <ul>
+   <li><b>15 August 2012 -- 2012.08-rc2 released</b>
+
+     <p>We have a new release candidate! Various fixes, and addition
+     of licensing informations on many
+     packages. See <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2012.08_rc2">CHANGES</a>
+     file for details</p>
+
+     <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
+     <a href="/downloads/buildroot-2012.08-rc2.tar.bz2">2012.08-rc2
+     release candidate</a>, and report any problems found to the <a
+     href="lists.html">mailing list</a> or <a
+     href="https://bugs.uclibc.org">bug tracker</a>.</p>
+
    <li><b>1 August 2012 -- 2012.08-rc1 released</b>
 
      <p>We have a new release candidate! Lots of changes all over the
