From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 7 Nov 2015 22:43:57 +0100
Subject: [Buildroot] [git commit] Update for 2015.11-rc1
Message-ID: <20151107215131.A438981648@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e1da0eff54912b712fbeb05979bd6606d716c665
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 CHANGES                    |    2 +-
 Makefile                   |    2 +-
 docs/website/download.html |   14 +++++++-------
 docs/website/news.html     |   13 +++++++++++++
 4 files changed, 22 insertions(+), 9 deletions(-)

diff --git a/CHANGES b/CHANGES
index 904dcf7..d801ac3 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,4 +1,4 @@
-2015.11-rc1, not yet released
+2015.11-rc1, Released November, 7th 2015
 
 	Fixes all over the tree and new features.
 
diff --git a/Makefile b/Makefile
index fbc6115..80c264f 100644
--- a/Makefile
+++ b/Makefile
@@ -41,7 +41,7 @@ else # umask
 all:
 
 # Set and export the version string
-export BR2_VERSION := 2015.11-git
+export BR2_VERSION := 2015.11-rc1
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/docs/website/download.html b/docs/website/download.html
index 534fc7e..a6c2ac0 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -15,18 +15,18 @@ here:<p>
 or
 <a href="/downloads/buildroot-2015.08.1.tar.bz2">buildroot-2015.08.1.tar.bz2</a>
 (<a href="/downloads/buildroot-2015.08.1.tar.bz2.sign">PGP signature</a>).
-<!--
+
 <p>
-The latest release candidate is <b>2015.08-rc2</b>, which can be
+The latest release candidate is <b>2015.11-rc1</b>, which can be
 downloaded here:<p>
 
-<a href="/downloads/buildroot-2015.08-rc2.tar.gz">buildroot-2015.08-rc1.tar.gz</a>
-(<a href="/downloads/buildroot-2015.08-rc2.tar.gz.sign">PGP signature</a>)
+<a href="/downloads/buildroot-2015.11-rc1.tar.gz">buildroot-2015.11-rc1.tar.gz</a>
+(<a href="/downloads/buildroot-2015.11-rc1.tar.gz.sign">PGP signature</a>)
 or
-<a href="/downloads/buildroot-2015.08-rc2.tar.bz2">buildroot-2015.08-rc1.tar.bz2</a>
-(<a href="/downloads/buildroot-2015.08-rc2.tar.bz2.sign">PGP signature</a>).
+<a href="/downloads/buildroot-2015.11-rc1.tar.bz2">buildroot-2015.11-rc1.tar.bz2</a>
+(<a href="/downloads/buildroot-2015.11-rc1.tar.bz2.sign">PGP signature</a>).
 <p>
--->
+
 This and earlier releases (and their PGP signatures) can always be downloaded from
 <a href="/downloads/">http://buildroot.net/downloads/</a>.
 
diff --git a/docs/website/news.html b/docs/website/news.html
index 2a10a07..23b5f7e 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -8,6 +8,19 @@
 <p>
 
 <ul>
+  <li><b>xxx November 2015 -- 2015.11-rc1 released</b>
+
+    <p>We have a new release candidate! Lots of changes all over the
+    tree, see
+    the <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2015.11-rc1">CHANGES</a>
+    file for details.</p>
+
+    <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
+    <a href="/downloads/buildroot-2015.11-rc1.tar.bz2">2015.11-rc1
+    release candidate</a>, and report any problems found to the
+    <a href="support.html">mailing list</a> or
+    <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+
   <li><b>6 September 2015 -- 2015.08.1 released</b>
 
     <p>The 2015.08.1 bugfix release is out - Thanks to everyone
