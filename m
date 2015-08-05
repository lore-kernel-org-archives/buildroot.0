From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Aug 2015 15:50:27 +0200
Subject: [Buildroot] [git commit] Update for 2015.08-rc1
Message-ID: <20150805210225.BD57B80770@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7b1e9d5244254d23ced7ab0772f60a48a2d80c32
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 CHANGES                    |    2 +-
 Makefile                   |    2 +-
 docs/website/download.html |   13 ++++++-------
 docs/website/news.html     |   12 ++++++++++++
 4 files changed, 20 insertions(+), 9 deletions(-)

diff --git a/CHANGES b/CHANGES
index ce16e2e..ee4aca1 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,4 +1,4 @@
-2015.08-rc1, not yet released
+2015.08-rc1, Released August, 5th 2015
 
 	Fixes all over the tree and new features.
 
diff --git a/Makefile b/Makefile
index 9059884..b4cef3f 100644
--- a/Makefile
+++ b/Makefile
@@ -41,7 +41,7 @@ else # umask
 all:
 
 # Set and export the version string
-export BR2_VERSION := 2015.08-git
+export BR2_VERSION := 2015.08-rc1
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/docs/website/download.html b/docs/website/download.html
index 715bec9..aa4d731 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -17,17 +17,16 @@ or
 (<a href="/downloads/buildroot-2015.05.tar.bz2.sign">PGP signature</a>).
 
 <p>
-<!--
-The latest release candidate is <b>2015.05-rc3</b>, which can be
+The latest release candidate is <b>2015.08-rc1</b>, which can be
 downloaded here:<p>
 
-<a href="/downloads/buildroot-2015.05-rc3.tar.gz">buildroot-2015.05-rc3.tar.gz</a>
-(<a href="/downloads/buildroot-2015.05-rc3.tar.gz.sign">PGP signature</a>)
+<a href="/downloads/buildroot-2015.08-rc1.tar.gz">buildroot-2015.08-rc1.tar.gz</a>
+(<a href="/downloads/buildroot-2015.08-rc1.tar.gz.sign">PGP signature</a>)
 or
-<a href="/downloads/buildroot-2015.05-rc3.tar.bz2">buildroot-2015.05-rc3.tar.bz2</a>
-(<a href="/downloads/buildroot-2015.05-rc3.tar.bz2.sign">PGP signature</a>).
+<a href="/downloads/buildroot-2015.08-rc1.tar.bz2">buildroot-2015.08-rc1.tar.bz2</a>
+(<a href="/downloads/buildroot-2015.08-rc1.tar.bz2.sign">PGP signature</a>).
 <p>
--->
+
 This and earlier releases (and their PGP signatures) can always be downloaded from
 <a href="/downloads/">http://buildroot.net/downloads/</a>.
 
diff --git a/docs/website/news.html b/docs/website/news.html
index 9a33b00..66edf07 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -8,6 +8,18 @@
 <p>
 
 <ul>
+  <li><b>5 August 2015 -- 2015.08-rc1 released</b>
+
+    <p>We have a new release candidate! Lots of changes all over the
+    tree, see the <a
+    href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2015.08-rc1">CHANGES</a>
+    file for details.</p>
+
+    <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
+    <a href="/downloads/buildroot-2015.08-rc1.tar.bz2">2015.08-rc1
+    release candidate</a>, and report any problems found to the
+    <a href="support.html">mailing list</a> or
+    <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
 
   <li><b>31 May 2015 -- 2015.05 released</b>
 
