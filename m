From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Aug 2012 20:46:31 +0200
Subject: [Buildroot] [git commit] Update for 2012.08-rc1
Message-ID: <20120801200014.99AB696FBB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4009cbbbf9832abfb4e3047d536ce2bd775d2587
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 CHANGES            |    2 +-
 Makefile           |    2 +-
 docs/download.html |    7 +++----
 docs/news.html     |   13 +++++++++++++
 4 files changed, 18 insertions(+), 6 deletions(-)

diff --git a/CHANGES b/CHANGES
index e314c84..fb5160d 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,4 +1,4 @@
-2012.08-rc1, Not released yet:
+2012.08-rc1, Released August 1st, 2012
 
 	Fixes all over the tree and new features.
 
diff --git a/Makefile b/Makefile
index 639fdaa..079af65 100644
--- a/Makefile
+++ b/Makefile
@@ -24,7 +24,7 @@
 #--------------------------------------------------------------
 
 # Set and export the version string
-export BR2_VERSION:=2012.08-git
+export BR2_VERSION:=2012.08-rc1
 
 # Check for minimal make version (note: this check will break at make 10.x)
 MIN_MAKE_VERSION=3.81
diff --git a/docs/download.html b/docs/download.html
index d23e7e9..c00a356 100644
--- a/docs/download.html
+++ b/docs/download.html
@@ -13,13 +13,12 @@ here:<p>
 or
 <a href="/downloads/buildroot-2012.05.tar.bz2">buildroot-2012.05.tar.bz2</a>.
 <p>
-<!--
-The latest release candidate is <b>2012.05-rc3</b>, which can be
+The latest release candidate is <b>2012.08-rc1</b>, which can be
 downloaded here:<p>
 
-<a href="/downloads/buildroot-2012.05-rc3.tar.gz">buildroot-2012.05-rc3.tar.gz</a>
+<a href="/downloads/buildroot-2012.08-rc1.tar.gz">buildroot-2012.08-rc1.tar.gz</a>
 or
-<a href="/downloads/buildroot-2012.05-rc3.tar.bz2">buildroot-2012.05-rc3.tar.bz2</a>.
+<a href="/downloads/buildroot-2012.08-rc1.tar.bz2">buildroot-2012.08-rc1.tar.bz2</a>.
 <p>
 -->
 This and earlier releases can always be downloaded from
diff --git a/docs/news.html b/docs/news.html
index 8060638..4114b03 100644
--- a/docs/news.html
+++ b/docs/news.html
@@ -5,6 +5,19 @@
 <p>
 
 <ul>
+   <li><b>1 August 2012 -- 2012.08-rc1 released</b>
+
+     <p>We have a new release candidate! Lots of changes all over the
+     tree, see the <a
+     href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2012.08_rc1">CHANGES</a>
+     file for details</p>
+
+     <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
+     <a href="/downloads/buildroot-2012.08-rc1.tar.bz2">2012.08-rc1
+     release candidate</a>, and report any problems found to the <a
+     href="lists.html">mailing list</a> or <a
+     href="https://bugs.uclibc.org">bug tracker</a>.</p>
+
   <li><b>22 July 2012 -- Buildroot Developer Day</b>
 
     <p>The next <i>Buildroot Developer Day</i> meeting will take place
