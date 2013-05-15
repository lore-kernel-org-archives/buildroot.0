From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 15 May 2013 21:05:00 +0200
Subject: [Buildroot] [git commit] Update for 2013.05-rc2
Message-ID: <20130515191808.0F8AF9A1B8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cfcbfa2c60b7c7a0976632d3e6b8f54d61ba18f9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES            |    2 +-
 Makefile           |    2 +-
 docs/download.html |    6 +++---
 docs/news.html     |   13 +++++++++++++
 4 files changed, 18 insertions(+), 5 deletions(-)

diff --git a/CHANGES b/CHANGES
index e2f3f3b..fd2764a 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,4 +1,4 @@
-2013.05, Not released yet:
+2013.05-rc2, Released May 15th, 2013:
 
 	Fixes all over the tree.
 
diff --git a/Makefile b/Makefile
index a57975e..5d2a7ae 100644
--- a/Makefile
+++ b/Makefile
@@ -24,7 +24,7 @@
 #--------------------------------------------------------------
 
 # Set and export the version string
-export BR2_VERSION:=2013.05-rc1
+export BR2_VERSION:=2013.05-rc2
 
 # Check for minimal make version (note: this check will break at make 10.x)
 MIN_MAKE_VERSION=3.81
diff --git a/docs/download.html b/docs/download.html
index d199fdf..9817dea 100644
--- a/docs/download.html
+++ b/docs/download.html
@@ -14,12 +14,12 @@ or
 <a href="/downloads/buildroot-2013.02.tar.bz2">buildroot-2013.02.tar.bz2</a>.
 
 <p>
-The latest release candidate is <b>2013.05-rc1</b>, which can be
+The latest release candidate is <b>2013.05-rc2</b>, which can be
 downloaded here:<p>
 
-<a href="/downloads/buildroot-2013.05-rc1.tar.gz">buildroot-2013.05-rc1.tar.gz</a>
+<a href="/downloads/buildroot-2013.05-rc2.tar.gz">buildroot-2013.05-rc2.tar.gz</a>
 or
-<a href="/downloads/buildroot-2013.05-rc1.tar.bz2">buildroot-2013.05-rc1.tar.bz2</a>.
+<a href="/downloads/buildroot-2013.05-rc2.tar.bz2">buildroot-2013.05-rc2.tar.bz2</a>.
 <p>
 
 This and earlier releases can always be downloaded from
diff --git a/docs/news.html b/docs/news.html
index c66757c..848c409 100644
--- a/docs/news.html
+++ b/docs/news.html
@@ -5,6 +5,19 @@
 <p>
 
 <ul>
+  <li><b>15 May 2013 -- 2013.05-rc2 released</b>
+
+    <p>Another week, another release candidate with more cleanups and
+    build fixes. See the <a
+    href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2013.05_rc2">CHANGES</a>
+    file for details.</p>
+
+    <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
+    <a href="/downloads/buildroot-2013.05-rc2.tar.bz2">2013.05-rc2
+    release candidate</a>, and report any problems found to the <a
+    href="lists.html">mailing list</a> or <a
+    href="https://bugs.uclibc.org">bug tracker</a>.</p>
+
   <li><b>8 May 2013 -- 2013.05-rc1 released</b>
 
     <p>We have a new release candidate! Lots of changes all over the
