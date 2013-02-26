From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 26 Feb 2013 23:19:03 +0100
Subject: [Buildroot] [git commit] Update for 2013.02-rc3
Message-ID: <20130226222004.82AFE9AD76@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d65bb7e3154ed0f78c28fa3ec645b41ec6fca704
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES            |   13 +++++++++++++
 Makefile           |    2 +-
 docs/download.html |    6 +++---
 docs/news.html     |   13 +++++++++++++
 4 files changed, 30 insertions(+), 4 deletions(-)

diff --git a/CHANGES b/CHANGES
index 5fdd457..8d03703 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,16 @@
+2013.02-rc3, Released February 26th, 2013
+
+	Minor fixes.
+
+	Updated/fixed packages: conntrack-tools, dialog,
+	enlightenment, haserl, keyutils, libfif, libmad,
+	linux-firmware, linux-fusion, matchbox-desktop, matchbox-wm,
+	ruby, spawn-fcgi, vtun
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#5960: fusion.ko driver does not install to target rootfs
+
 2013.02-rc2, Released February 19th, 2013
 
 	Fixes all over the tree.
diff --git a/Makefile b/Makefile
index 3bab855..0a4c5f2 100644
--- a/Makefile
+++ b/Makefile
@@ -24,7 +24,7 @@
 #--------------------------------------------------------------
 
 # Set and export the version string
-export BR2_VERSION:=2013.02-rc2
+export BR2_VERSION:=2013.02-rc3
 
 # Check for minimal make version (note: this check will break at make 10.x)
 MIN_MAKE_VERSION=3.81
diff --git a/docs/download.html b/docs/download.html
index 36e3ddd..c06270a 100644
--- a/docs/download.html
+++ b/docs/download.html
@@ -14,12 +14,12 @@ or
 <a href="/downloads/buildroot-2012.11.1.tar.bz2">buildroot-2012.11.1.tar.bz2</a>.
 
 <p>
-The latest release candidate is <b>2013.02-rc2</b>, which can be
+The latest release candidate is <b>2013.02-rc3</b>, which can be
 downloaded here:<p>
 
-<a href="/downloads/buildroot-2013.02-rc2.tar.gz">buildroot-2013.02-rc2.tar.gz</a>
+<a href="/downloads/buildroot-2013.02-rc3.tar.gz">buildroot-2013.02-rc3.tar.gz</a>
 or
-<a href="/downloads/buildroot-2013.02-rc2.tar.bz2">buildroot-2013.02-rc2.tar.bz2</a>.
+<a href="/downloads/buildroot-2013.02-rc3.tar.bz2">buildroot-2013.02-rc3.tar.bz2</a>.
 <p>
 
 This and earlier releases can always be downloaded from
diff --git a/docs/news.html b/docs/news.html
index 127b6d1..d9b6b0d 100644
--- a/docs/news.html
+++ b/docs/news.html
@@ -5,6 +5,19 @@
 <p>
 
 <ul>
+  <li><b>26 February 2013 -- 2013.02-rc3 released</b>
+
+    <p>Another week, another release candidate with more cleanups and
+    build fixes. See the <a
+    href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2013.02_rc3">CHANGES</a>
+    file for details.</p>
+
+    <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
+    <a href="/downloads/buildroot-2013.02-rc3.tar.bz2">2013.02-rc3
+    release candidate</a>, and report any problems found to the <a
+    href="lists.html">mailing list</a> or <a
+    href="https://bugs.uclibc.org">bug tracker</a>.</p>
+
   <li><b>19 February 2013 -- 2013.02-rc2 released</b>
 
     <p>Another week, another release candidate with more cleanups and
