From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 8 May 2013 15:51:45 +0200
Subject: [Buildroot] [git commit] Update for 2013.05-rc1
Message-ID: <20130508135431.0A30F99A80@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=92651931e72afad0f829d651ad3d0286b5a14e06
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES            |    2 +-
 Makefile           |    2 +-
 docs/download.html |   10 +++++-----
 docs/news.html     |   13 +++++++++++++
 4 files changed, 20 insertions(+), 7 deletions(-)

diff --git a/CHANGES b/CHANGES
index 1b35017..1686aa6 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,4 +1,4 @@
-2013.05, Not released yet:
+2013.05-rc1, Released May 8th, 2013:
 
 	Architectures: ARC support, Blackfin support, FLAT binary
 	format, ARM: Drop old CPU variants, add fa526/626, Marvell PJ4
diff --git a/Makefile b/Makefile
index 9128c75..a57975e 100644
--- a/Makefile
+++ b/Makefile
@@ -24,7 +24,7 @@
 #--------------------------------------------------------------
 
 # Set and export the version string
-export BR2_VERSION:=2013.05-git
+export BR2_VERSION:=2013.05-rc1
 
 # Check for minimal make version (note: this check will break at make 10.x)
 MIN_MAKE_VERSION=3.81
diff --git a/docs/download.html b/docs/download.html
index 10bf5d8..d199fdf 100644
--- a/docs/download.html
+++ b/docs/download.html
@@ -12,16 +12,16 @@ here:<p>
 <a href="/downloads/buildroot-2013.02.tar.gz">buildroot-2013.02.tar.gz</a>
 or
 <a href="/downloads/buildroot-2013.02.tar.bz2">buildroot-2013.02.tar.bz2</a>.
-<!--
+
 <p>
-The latest release candidate is <b>2013.02-rc3</b>, which can be
+The latest release candidate is <b>2013.05-rc1</b>, which can be
 downloaded here:<p>
 
-<a href="/downloads/buildroot-2013.02-rc3.tar.gz">buildroot-2013.02-rc3.tar.gz</a>
+<a href="/downloads/buildroot-2013.05-rc1.tar.gz">buildroot-2013.05-rc1.tar.gz</a>
 or
-<a href="/downloads/buildroot-2013.02-rc3.tar.bz2">buildroot-2013.02-rc3.tar.bz2</a>.
+<a href="/downloads/buildroot-2013.05-rc1.tar.bz2">buildroot-2013.05-rc1.tar.bz2</a>.
 <p>
--->
+
 This and earlier releases can always be downloaded from
 <a href="/downloads/">http://buildroot.net/downloads/</a>.
 
diff --git a/docs/news.html b/docs/news.html
index db203ac..665b3bf 100644
--- a/docs/news.html
+++ b/docs/news.html
@@ -5,6 +5,19 @@
 <p>
 
 <ul>
+  <li><b>8 May 2013 -- 2013.05-rc1 released</b>
+
+    <p>We have a new release candidate! Lots of changes all over the
+    tree, see the <a
+    href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2013.05_rc1">CHANGES</a>
+    file for details.</p>
+
+    <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
+    <a href="/downloads/buildroot-2013.05-rc1.tar.bz2">2013.05-rc1
+    release candidate</a>, and report any problems found to the <a
+    href="lists.html">mailing list</a> or <a
+    href="https://bugs.uclibc.org">bug tracker</a>.</p>
+
   <li><b>28 February 2013 -- 2013.02 released</b>
 
     <p>The stable 2013.02 release is out - Thanks to everyone
