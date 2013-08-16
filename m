From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 16 Aug 2013 13:10:30 +0200
Subject: [Buildroot] [git commit] Prepare for 2013.08-rc2
Message-ID: <20130816111506.CBA859A60E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7120319a51c004793ff924b55c478867560b86fd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile           |    2 +-
 docs/download.html |    6 +++---
 docs/news.html     |   13 +++++++++++++
 3 files changed, 17 insertions(+), 4 deletions(-)

diff --git a/Makefile b/Makefile
index fcfc0be..794d217 100644
--- a/Makefile
+++ b/Makefile
@@ -24,7 +24,7 @@
 #--------------------------------------------------------------
 
 # Set and export the version string
-export BR2_VERSION:=2013.08-rc1
+export BR2_VERSION:=2013.08-rc2
 
 # Check for minimal make version (note: this check will break at make 10.x)
 MIN_MAKE_VERSION=3.81
diff --git a/docs/download.html b/docs/download.html
index 6c9060b..66a9c72 100644
--- a/docs/download.html
+++ b/docs/download.html
@@ -15,12 +15,12 @@ or
 
 <p>
 
-The latest release candidate is <b>2013.08-rc1</b>, which can be
+The latest release candidate is <b>2013.08-rc2</b>, which can be
 downloaded here:<p>
 
-<a href="/downloads/buildroot-2013.08-rc1.tar.gz">buildroot-2013.08-rc1.tar.gz</a>
+<a href="/downloads/buildroot-2013.08-rc2.tar.gz">buildroot-2013.08-rc2.tar.gz</a>
 or
-<a href="/downloads/buildroot-2013.08-rc1.tar.bz2">buildroot-2013.08-rc1.tar.bz2</a>.
+<a href="/downloads/buildroot-2013.08-rc2.tar.bz2">buildroot-2013.08-rc2.tar.bz2</a>.
 <p>
 
 This and earlier releases can always be downloaded from
diff --git a/docs/news.html b/docs/news.html
index beb2a40..f233a35 100644
--- a/docs/news.html
+++ b/docs/news.html
@@ -5,6 +5,19 @@
 <p>
 
 <ul>
+  <li><b>16 August 2013 -- 2013.08-rc2 released</b>
+
+    <p>We have a new release candidate! Lots of changes all over the
+    tree, see
+    the <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2013.08_rc2">CHANGES</a>
+    file for details.</p>
+
+    <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
+    <a href="/downloads/buildroot-2013.08-rc2.tar.bz2">2013.08-rc2
+    release candidate</a>, and report any problems found to the <a
+    href="lists.html">mailing list</a> or <a
+    href="https://bugs.uclibc.org">bug tracker</a>.</p>
+
   <li><b>5 August 2013 -- 2013.08-rc1 released</b>
 
     <p>We have a new release candidate! Lots of changes all over the
