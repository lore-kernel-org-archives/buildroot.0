From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 26 Nov 2013 16:49:11 +0100
Subject: [Buildroot] [git commit] Update for 2013.11-rc3
Message-ID: <20131126155544.22CFD9BE05@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1bf9afeb1b8fb45199636f4fd21fa0db376547c2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES            |   12 ++++++++++++
 Makefile           |    2 +-
 docs/download.html |    6 +++---
 docs/news.html     |   12 ++++++++++++
 4 files changed, 28 insertions(+), 4 deletions(-)

diff --git a/CHANGES b/CHANGES
index 93673c3..e5d0f37 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,15 @@
+2013.11-rc3, Released November 26th, 2013
+
+	Fixes all over the tree.
+
+	Architecture: Mark MIPS I, II, III and IV as deprecated.
+
+	Updated/fixed packages: beecrypt, dbus, e2fsprogs, libcap-ng,
+	libglib2, libroxml, libsigsegv, libvncserver, lxc, mdadm,
+	mongoose, nut, ola, omniorb, openssl, pcre, php, poco,
+	protobuf-c, pv, qt5base, ruby, schifra, squid, sunxi-mail,
+	swig, ti-gfx, tinymembench, uclibc, udisks, vim
+
 2013.11-rc2, Released November 18th, 2013
 
 	Fixes all over the tree.
diff --git a/Makefile b/Makefile
index 685e0ee..b5368a3 100644
--- a/Makefile
+++ b/Makefile
@@ -24,7 +24,7 @@
 #--------------------------------------------------------------
 
 # Set and export the version string
-export BR2_VERSION:=2013.11-rc2
+export BR2_VERSION:=2013.11-rc3
 
 # Check for minimal make version (note: this check will break at make 10.x)
 MIN_MAKE_VERSION=3.81
diff --git a/docs/download.html b/docs/download.html
index 55e3538..1cfd54d 100644
--- a/docs/download.html
+++ b/docs/download.html
@@ -15,12 +15,12 @@ or
 
 <p>
 
-The latest release candidate is <b>2013.11-rc2</b>, which can be
+The latest release candidate is <b>2013.11-rc3</b>, which can be
 downloaded here:<p>
 
-<a href="/downloads/buildroot-2013.11-rc2.tar.gz">buildroot-2013.11-rc2.tar.gz</a>
+<a href="/downloads/buildroot-2013.11-rc3.tar.gz">buildroot-2013.11-rc3.tar.gz</a>
 or
-<a href="/downloads/buildroot-2013.11-rc2.tar.bz2">buildroot-2013.11-rc2.tar.bz2</a>.
+<a href="/downloads/buildroot-2013.11-rc3.tar.bz2">buildroot-2013.11-rc3.tar.bz2</a>.
 <p>
 
 This and earlier releases can always be downloaded from
diff --git a/docs/news.html b/docs/news.html
index 432c634..db2c61e 100644
--- a/docs/news.html
+++ b/docs/news.html
@@ -5,6 +5,18 @@
 <p>
 
 <ul>
+  <li><b>18 November 2013 -- 2013.11-rc3 released</b>
+
+    <p>Another week, another release candidate with more fixes. See the <a
+    href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2013.11-rc3">CHANGES</a>
+    file for details.</p>
+
+    <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
+    <a href="/downloads/buildroot-2013.11-rc3.tar.bz2">2013.11-rc3
+    release candidate</a>, and report any problems found to the <a
+    href="lists.html">mailing list</a> or <a
+    href="https://bugs.uclibc.org">bug tracker</a>.</p>
+
   <li><b>18 November 2013 -- 2013.11-rc2 released</b>
 
     <p>Another week, another release candidate with more cleanups and
