From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 30 Aug 2013 00:03:48 +0200
Subject: [Buildroot] [git commit] Prepare for 2013.08-rc3
Message-ID: <20130829221536.30A9F9B5A9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4e4a0a347764935d044a5d782d86006964fc3830
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES            |    2 +-
 Makefile           |    2 +-
 docs/download.html |    6 +++---
 docs/news.html     |   13 +++++++++++++
 4 files changed, 18 insertions(+), 5 deletions(-)

diff --git a/CHANGES b/CHANGES
index 4653e38..80cd357 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,4 +1,4 @@
-2013.08, Not yet released:
+2013.08-rc3, Released August 29th, 2013:
 
 	Fixes all over the tree.
 
diff --git a/Makefile b/Makefile
index 84d160a..e7f822a 100644
--- a/Makefile
+++ b/Makefile
@@ -24,7 +24,7 @@
 #--------------------------------------------------------------
 
 # Set and export the version string
-export BR2_VERSION:=2013.08-rc2
+export BR2_VERSION:=2013.08-rc3
 
 # Check for minimal make version (note: this check will break at make 10.x)
 MIN_MAKE_VERSION=3.81
diff --git a/docs/download.html b/docs/download.html
index 66a9c72..79a9889 100644
--- a/docs/download.html
+++ b/docs/download.html
@@ -15,12 +15,12 @@ or
 
 <p>
 
-The latest release candidate is <b>2013.08-rc2</b>, which can be
+The latest release candidate is <b>2013.08-rc3</b>, which can be
 downloaded here:<p>
 
-<a href="/downloads/buildroot-2013.08-rc2.tar.gz">buildroot-2013.08-rc2.tar.gz</a>
+<a href="/downloads/buildroot-2013.08-rc3.tar.gz">buildroot-2013.08-rc3.tar.gz</a>
 or
-<a href="/downloads/buildroot-2013.08-rc2.tar.bz2">buildroot-2013.08-rc2.tar.bz2</a>.
+<a href="/downloads/buildroot-2013.08-rc3.tar.bz2">buildroot-2013.08-rc3.tar.bz2</a>.
 <p>
 
 This and earlier releases can always be downloaded from
diff --git a/docs/news.html b/docs/news.html
index f233a35..4888eff 100644
--- a/docs/news.html
+++ b/docs/news.html
@@ -5,6 +5,19 @@
 <p>
 
 <ul>
+  <li><b>29 August 2013 -- 2013.08-rc3 released</b>
+
+    <p>Another week, another release candidate with more cleanups and
+    build fixes. See the <a
+    href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2013.08_rc3">CHANGES</a>
+    file for details.</p>
+
+    <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
+    <a href="/downloads/buildroot-2013.08-rc3.tar.bz2">2013.08-rc3
+    release candidate</a>, and report any problems found to the <a
+    href="lists.html">mailing list</a> or <a
+    href="https://bugs.uclibc.org">bug tracker</a>.</p>
+
   <li><b>16 August 2013 -- 2013.08-rc2 released</b>
 
     <p>We have a new release candidate! Lots of changes all over the
