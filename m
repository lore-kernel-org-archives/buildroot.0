From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 21 Nov 2014 13:19:45 +0100
Subject: [Buildroot] [git commit] Update for 2014.11-rc2
Message-ID: <20141121122108.D5E437FDFB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=641e00ef23634af43abcdbbc8f2c1f42ec36328b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES            |    2 +-
 Makefile           |    2 +-
 docs/download.html |   10 +++++-----
 docs/news.html     |   13 +++++++++++++
 4 files changed, 20 insertions(+), 7 deletions(-)

diff --git a/CHANGES b/CHANGES
index a13707b..85c1439 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,4 +1,4 @@
-2014.11, Not yet released:
+2014.11-rc2, Released November 21st, 2014
 
 	Fixes all over the tree.
 
diff --git a/Makefile b/Makefile
index 471edf9..3d8283b 100644
--- a/Makefile
+++ b/Makefile
@@ -28,7 +28,7 @@
 all:
 
 # Set and export the version string
-export BR2_VERSION := 2014.11-rc1
+export BR2_VERSION := 2014.11-rc2
 
 # Check for minimal make version (note: this check will break at make 10.x)
 MIN_MAKE_VERSION = 3.81
diff --git a/docs/download.html b/docs/download.html
index 0d0949c..4614749 100644
--- a/docs/download.html
+++ b/docs/download.html
@@ -18,14 +18,14 @@ or
 
 <p>
 
-The latest release candidate is <b>2014.11-rc1</b>, which can be
+The latest release candidate is <b>2014.11-rc2</b>, which can be
 downloaded here:<p>
 
-<a href="/downloads/buildroot-2014.11-rc1.tar.gz">buildroot-2014.11-rc1.tar.gz</a>
-(<a href="/downloads/buildroot-2014.11-rc1.tar.gz.sign">PGP signature</a>)
+<a href="/downloads/buildroot-2014.11-rc2.tar.gz">buildroot-2014.11-rc2.tar.gz</a>
+(<a href="/downloads/buildroot-2014.11-rc2.tar.gz.sign">PGP signature</a>)
 or
-<a href="/downloads/buildroot-2014.11-rc1.tar.bz2">buildroot-2014.11-rc1.tar.bz2</a>
-(<a href="/downloads/buildroot-2014.11-rc1.tar.bz2.sign">PGP signature</a>).
+<a href="/downloads/buildroot-2014.11-rc2.tar.bz2">buildroot-2014.11-rc2.tar.bz2</a>
+(<a href="/downloads/buildroot-2014.11-rc2.tar.bz2.sign">PGP signature</a>).
 <p>
 
 This and earlier releases (and their PGP signatures) can always be downloaded from
diff --git a/docs/news.html b/docs/news.html
index 798fb02..9a8aab5 100644
--- a/docs/news.html
+++ b/docs/news.html
@@ -9,6 +9,19 @@
 
 <ul>
 
+  <li><b>21 November 2014 -- 2014.11-rc2 released</b>
+
+    <p>Another week, another release candidate with more cleanups and
+    build fixes. See the <a
+    href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2014.11-rc2">CHANGES</a>
+    file for details.</p>
+
+    <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
+    <a href="/downloads/buildroot-2014.11-rc2.tar.bz2">2014.11-rc2
+    release candidate</a>, and report any problems found to the <a
+    href="support.html">mailing list</a> or <a
+    href="https://bugs.uclibc.org">bug tracker</a>.</p>
+
   <li><b>13 November 2014 -- Report from Buildroot Developers Meeting</b>
 
     <p>A report from the recent
