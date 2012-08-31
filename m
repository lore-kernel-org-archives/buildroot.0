From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 31 Aug 2012 10:49:41 +0200
Subject: [Buildroot] [git commit] Prepare for 2012.08
Message-ID: <20120831085103.83B468E7F7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=288b73995a0e31233f83184a406a68fe78ba5462
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 CHANGES            |   12 ++++++++++++
 Makefile           |    2 +-
 docs/download.html |    8 +++++---
 docs/news.html     |    8 ++++++++
 4 files changed, 26 insertions(+), 4 deletions(-)

diff --git a/CHANGES b/CHANGES
index 024ee75..fd94346 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,15 @@
+2012.08, Release August 31th, 2012
+
+	Updated/fixed packages: microperl, cups, luajit, rrdtool,
+	prboom, oprofile.
+
+	Added license information for: sqlite.
+
+	Changed the source URLs of all packages located on Sourceforge
+	in order to use the automatic mirror selection URL
+	downloads.sourceforge.net, and get rid of the
+	BR2_SOURCEFORGE_MIRROR option.
+
 2012.08-rc3, Released August 25th, 2012
 
 	Updated/fixed packages: libglib2, netsnmp, freetype, libfuse,
diff --git a/Makefile b/Makefile
index d59a548..f4f7514 100644
--- a/Makefile
+++ b/Makefile
@@ -24,7 +24,7 @@
 #--------------------------------------------------------------
 
 # Set and export the version string
-export BR2_VERSION:=2012.08-rc3
+export BR2_VERSION:=2012.08
 
 # Check for minimal make version (note: this check will break at make 10.x)
 MIN_MAKE_VERSION=3.81
diff --git a/docs/download.html b/docs/download.html
index e53bfb6..51b7a82 100644
--- a/docs/download.html
+++ b/docs/download.html
@@ -6,12 +6,14 @@
 
 <p>
 
-The latest stable release is <b>2012.05</b>, which can be downloaded
+The latest stable release is <b>2012.08</b>, which can be downloaded
 here:<p>
 
-<a href="/downloads/buildroot-2012.05.tar.gz">buildroot-2012.05.tar.gz</a>
+<a href="/downloads/buildroot-2012.08.tar.gz">buildroot-2012.08.tar.gz</a>
 or
-<a href="/downloads/buildroot-2012.05.tar.bz2">buildroot-2012.05.tar.bz2</a>.
+<a href="/downloads/buildroot-2012.08.tar.bz2">buildroot-2012.08.tar.bz2</a>.
+
+<!--
 <p>
 The latest release candidate is <b>2012.08-rc3</b>, which can be
 downloaded here:<p>
diff --git a/docs/news.html b/docs/news.html
index abe4085..2f54567 100644
--- a/docs/news.html
+++ b/docs/news.html
@@ -5,6 +5,14 @@
 <p>
 
 <ul>
+   <li><b>31 August 2012 -- 2012.08 released</b>
+
+    <p>The stable 2012.08 release is out - Thanks to everyone
+    contributing and testing the release candidates. See the
+    <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2012.08">CHANGES</a>
+    file for more details and go to the <a href="/downloads/">downloads page</a> to pick up the
+    <a href="/downloads/buildroot-2012.08.tar.bz2">2012.08 release</a>.</p>
+
    <li><b>25 August 2012 -- 2012.08-rc3 released</b>
 
      <p>We have a new release candidate! Various fixes, and addition
