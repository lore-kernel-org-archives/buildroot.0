From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 5 Aug 2013 11:37:42 +0200
Subject: [Buildroot] [git commit] Prepare for 2013.08-rc1
Message-ID: <20130805101439.5B12C9AB4F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a7d58609acb76d420b38e62e810094617a7a60eb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile           |    2 +-
 docs/download.html |   10 +++++-----
 docs/news.html     |   13 +++++++++++++
 3 files changed, 19 insertions(+), 6 deletions(-)

diff --git a/Makefile b/Makefile
index 5a0c64a..fcfc0be 100644
--- a/Makefile
+++ b/Makefile
@@ -24,7 +24,7 @@
 #--------------------------------------------------------------
 
 # Set and export the version string
-export BR2_VERSION:=2013.08-git
+export BR2_VERSION:=2013.08-rc1
 
 # Check for minimal make version (note: this check will break at make 10.x)
 MIN_MAKE_VERSION=3.81
diff --git a/docs/download.html b/docs/download.html
index 85aaa62..6c9060b 100644
--- a/docs/download.html
+++ b/docs/download.html
@@ -14,15 +14,15 @@ or
 <a href="/downloads/buildroot-2013.05.tar.bz2">buildroot-2013.05.tar.bz2</a>.
 
 <p>
-<!--
-The latest release candidate is <b>2013.05-rc3</b>, which can be
+
+The latest release candidate is <b>2013.08-rc1</b>, which can be
 downloaded here:<p>
 
-<a href="/downloads/buildroot-2013.05-rc3.tar.gz">buildroot-2013.05-rc3.tar.gz</a>
+<a href="/downloads/buildroot-2013.08-rc1.tar.gz">buildroot-2013.08-rc1.tar.gz</a>
 or
-<a href="/downloads/buildroot-2013.05-rc3.tar.bz2">buildroot-2013.05-rc3.tar.bz2</a>.
+<a href="/downloads/buildroot-2013.08-rc1.tar.bz2">buildroot-2013.08-rc1.tar.bz2</a>.
 <p>
--->
+
 This and earlier releases can always be downloaded from
 <a href="/downloads/">http://buildroot.net/downloads/</a>.
 
diff --git a/docs/news.html b/docs/news.html
index f893807..beb2a40 100644
--- a/docs/news.html
+++ b/docs/news.html
@@ -5,6 +5,19 @@
 <p>
 
 <ul>
+  <li><b>5 August 2013 -- 2013.08-rc1 released</b>
+
+    <p>We have a new release candidate! Lots of changes all over the
+    tree, see
+    the <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2013.08_rc1">CHANGES</a>
+    file for details.</p>
+
+    <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
+    <a href="/downloads/buildroot-2013.08-rc1.tar.bz2">2013.08-rc1
+    release candidate</a>, and report any problems found to the <a
+    href="lists.html">mailing list</a> or <a
+    href="https://bugs.uclibc.org">bug tracker</a>.</p>
+
   <li><b>31 May 2013 -- 2013.05 released</b>
 
     <p>The stable 2013.05 release is out - Thanks to everyone
