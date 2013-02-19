From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 19 Feb 2013 22:05:42 +0100
Subject: [Buildroot] [git commit] Update for 2013.02-rc2
Message-ID: <20130219212520.AEC399ABAB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8290a6261aaa4af8e8a4b3cbd6c8bedd83622572
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES            |   15 +++++++++++++++
 Makefile           |    2 +-
 docs/download.html |    6 +++---
 docs/news.html     |   13 +++++++++++++
 4 files changed, 32 insertions(+), 4 deletions(-)

diff --git a/CHANGES b/CHANGES
index 02dbc27..5fdd457 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,18 @@
+2013.02-rc2, Released February 19th, 2013
+
+	Fixes all over the tree.
+
+	Various manual updates and fixes.
+
+	Updated/fixed packages: busybox, collectd, gesftpserver,
+	glib-networking, gnutls, inotify-tools, libcurl, libffi,
+	libglib2, libtorrent, libvorbis, neard, network-manager,
+	ntfs-3g, openssl, qt, rpi-userland, rtorrent, thttpd, vim.
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#5906: collectd client headers not exported
+
 2013.02-rc1, Released February 10th, 2013
 
 	Toolchain: Crosstool-ng 1.17.0, default to GCC 4.6.3, target
diff --git a/Makefile b/Makefile
index 3f967b2..3bab855 100644
--- a/Makefile
+++ b/Makefile
@@ -24,7 +24,7 @@
 #--------------------------------------------------------------
 
 # Set and export the version string
-export BR2_VERSION:=2013.02-rc1
+export BR2_VERSION:=2013.02-rc2
 
 # Check for minimal make version (note: this check will break at make 10.x)
 MIN_MAKE_VERSION=3.81
diff --git a/docs/download.html b/docs/download.html
index f7369d6..36e3ddd 100644
--- a/docs/download.html
+++ b/docs/download.html
@@ -14,12 +14,12 @@ or
 <a href="/downloads/buildroot-2012.11.1.tar.bz2">buildroot-2012.11.1.tar.bz2</a>.
 
 <p>
-The latest release candidate is <b>2013.02-rc1</b>, which can be
+The latest release candidate is <b>2013.02-rc2</b>, which can be
 downloaded here:<p>
 
-<a href="/downloads/buildroot-2013.02-rc1.tar.gz">buildroot-2013.02-rc1.tar.gz</a>
+<a href="/downloads/buildroot-2013.02-rc2.tar.gz">buildroot-2013.02-rc2.tar.gz</a>
 or
-<a href="/downloads/buildroot-2013.02-rc1.tar.bz2">buildroot-2013.02-rc1.tar.bz2</a>.
+<a href="/downloads/buildroot-2013.02-rc2.tar.bz2">buildroot-2013.02-rc2.tar.bz2</a>.
 <p>
 
 This and earlier releases can always be downloaded from
diff --git a/docs/news.html b/docs/news.html
index 2ebbe02..127b6d1 100644
--- a/docs/news.html
+++ b/docs/news.html
@@ -5,6 +5,19 @@
 <p>
 
 <ul>
+  <li><b>19 February 2013 -- 2013.02-rc2 released</b>
+
+    <p>Another week, another release candidate with more cleanups and
+    build fixes. See the <a
+    href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2013.02_rc2">CHANGES</a>
+    file for details.</p>
+
+    <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
+    <a href="/downloads/buildroot-2013.02-rc2.tar.bz2">2013.02-rc2
+    release candidate</a>, and report any problems found to the <a
+    href="lists.html">mailing list</a> or <a
+    href="https://bugs.uclibc.org">bug tracker</a>.</p>
+
   <li><b>10 February 2013 -- 2013.02-rc1 released</b>
 
     <p>We have a new release candidate! Lots of changes all over the
