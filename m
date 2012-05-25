From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 25 May 2012 21:09:50 +0200
Subject: [Buildroot] [git commit] Update for 2012.05-rc3
Message-ID: <20120525191024.C6C5D96CBA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0b0d7badb0338f7c33c86e2ab60c413a973ca348
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES            |   13 +++++++++++++
 Makefile           |    2 +-
 docs/download.html |    6 +++---
 docs/news.html     |   12 ++++++++++++
 4 files changed, 29 insertions(+), 4 deletions(-)

diff --git a/CHANGES b/CHANGES
index 7d17c26..4a8bed0 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,16 @@
+2012.05-rc3, Released May 25th, 2012:
+
+	Minor fixes around the tree.
+
+	Infra: Fix for DOWNLOAD macro when using primary mirrors with
+	scp targets.
+
+	Toolchain: Kernel headers 3.2.18 / 3.3.7.
+
+	Updated/fixed packages: binutils, bison, busybox, cifs-utils,
+	gnuchess, gpsd, iperf, libmpeg2, mtd, ntfs-3g, oprofile,
+	xserver-xorg
+
 2012.05-rc2, Released May 18th, 2012:
 
 	Fixes all over the tree.
diff --git a/Makefile b/Makefile
index c0fc8c2..4945c16 100644
--- a/Makefile
+++ b/Makefile
@@ -24,7 +24,7 @@
 #--------------------------------------------------------------
 
 # Set and export the version string
-export BR2_VERSION:=2012.05-rc2
+export BR2_VERSION:=2012.05-rc3
 
 # Check for minimal make version (note: this check will break at make 10.x)
 MIN_MAKE_VERSION=3.81
diff --git a/docs/download.html b/docs/download.html
index 52d3c18..57c8be5 100644
--- a/docs/download.html
+++ b/docs/download.html
@@ -14,12 +14,12 @@ or
 <a href="/downloads/buildroot-2012.02.tar.bz2">buildroot-2012.02.tar.bz2</a>.
 <p>
 
-The latest release candidate is <b>2012.05-rc2</b>, which can be
+The latest release candidate is <b>2012.05-rc3</b>, which can be
 downloaded here:<p>
 
-<a href="/downloads/buildroot-2012.05-rc2.tar.gz">buildroot-2012.05-rc2.tar.gz</a>
+<a href="/downloads/buildroot-2012.05-rc3.tar.gz">buildroot-2012.05-rc3.tar.gz</a>
 or
-<a href="/downloads/buildroot-2012.05-rc2.tar.bz2">buildroot-2012.05-rc2.tar.bz2</a>.
+<a href="/downloads/buildroot-2012.05-rc3.tar.bz2">buildroot-2012.05-rc3.tar.bz2</a>.
 <p>
 
 This and earlier releases can always be downloaded from
diff --git a/docs/news.html b/docs/news.html
index c7d276e..94d1d94 100644
--- a/docs/news.html
+++ b/docs/news.html
@@ -5,6 +5,18 @@
 <p>
 
 <ul>
+  <li><b>25 May 2012 -- 2012.05-rc3 released</b>
+
+    <p>RC3 is out with more bugfixes - See the <a
+    href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2012.05_rc3">CHANGES</a>
+    file for details.
+
+    <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
+    <a href="/downloads/buildroot-2012.05-rc3.tar.bz2">2012.05-rc3
+    release candidate</a>, and report any problems found to the <a
+    href="lists.html">mailing list</a> or <a
+    href="https://bugs.uclibc.org">bug tracker</a>.</p>
+
   <li><b>18 May 2012 -- 2012.05-rc2 released</b>
 
     <p>Another week, another release candidate with more cleanups and
