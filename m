From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 12 Nov 2014 23:11:07 +0100
Subject: [Buildroot] [git commit] Update for 2014.11-rc1
Message-ID: <20141112222957.D6E66B441C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=74128856f4f4f1e2fba5f8c7de19ba2243c893b5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES            |    2 +-
 Makefile           |    2 +-
 docs/download.html |   14 +++++++-------
 docs/news.html     |   13 +++++++++++++
 4 files changed, 22 insertions(+), 9 deletions(-)

diff --git a/CHANGES b/CHANGES
index 79e0f58..9e8c4d8 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,4 +1,4 @@
-2014.11, Not yet released:
+2014.11-rc1, Released November 12th, 2014
 
 	Fixes all over the tree and new features.
 
diff --git a/Makefile b/Makefile
index 907a0fc..471edf9 100644
--- a/Makefile
+++ b/Makefile
@@ -28,7 +28,7 @@
 all:
 
 # Set and export the version string
-export BR2_VERSION := 2014.11-git
+export BR2_VERSION := 2014.11-rc1
 
 # Check for minimal make version (note: this check will break at make 10.x)
 MIN_MAKE_VERSION = 3.81
diff --git a/docs/download.html b/docs/download.html
index 33da838..0d0949c 100644
--- a/docs/download.html
+++ b/docs/download.html
@@ -17,22 +17,22 @@ or
 (<a href="/downloads/buildroot-2014.08.tar.bz2.sign">PGP signature</a>).
 
 <p>
-<!--
-The latest release candidate is <b>2014.08-rc3</b>, which can be
+
+The latest release candidate is <b>2014.11-rc1</b>, which can be
 downloaded here:<p>
 
-<a href="/downloads/buildroot-2014.08-rc3.tar.gz">buildroot-2014.08-rc3.tar.gz</a>
-(<a href="/downloads/buildroot-2014.08-rc3.tar.gz.sign">PGP signature</a>)
+<a href="/downloads/buildroot-2014.11-rc1.tar.gz">buildroot-2014.11-rc1.tar.gz</a>
+(<a href="/downloads/buildroot-2014.11-rc1.tar.gz.sign">PGP signature</a>)
 or
-<a href="/downloads/buildroot-2014.08-rc3.tar.bz2">buildroot-2014.08-rc3.tar.bz2</a>
-(<a href="/downloads/buildroot-2014.08-rc3.tar.bz2.sign">PGP signature</a>).
+<a href="/downloads/buildroot-2014.11-rc1.tar.bz2">buildroot-2014.11-rc1.tar.bz2</a>
+(<a href="/downloads/buildroot-2014.11-rc1.tar.bz2.sign">PGP signature</a>).
 <p>
 
 This and earlier releases (and their PGP signatures) can always be downloaded from
 <a href="/downloads/">http://buildroot.net/downloads/</a>.
 
 <p>
--->
+
 You can also obtain daily snapshots of the latest Buildroot source tree if you
 want to follow development, but cannot or do not wish to use Git.
 
diff --git a/docs/news.html b/docs/news.html
index 2f1b168..9a2b4ba 100644
--- a/docs/news.html
+++ b/docs/news.html
@@ -9,6 +9,19 @@
 
 <ul>
 
+  <li><b>12 November 2014 -- 2014.11-rc1 released</b>
+
+    <p>We have a new release candidate! Lots of changes all over the
+    tree, see the <a
+    href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2014.11-rc1">CHANGES</a>
+    file for details.</p>
+
+    <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
+    <a href="/downloads/buildroot-2014.11-rc1.tar.bz2">2014.11-rc1
+    release candidate</a>, and report any problems found to the
+    <a href="support.html">mailing list</a> or
+    <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+
   <li><b>1 September 2014 -- 2014.08 released</b>
 
     <p>The stable 2014.08 release is out - Thanks to everyone
