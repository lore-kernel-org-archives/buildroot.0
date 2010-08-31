From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 1 Sep 2010 00:07:06 +0200
Subject: [Buildroot] [git commit master 1/1] update for 2010.08
Message-ID: <20100831220735.865C18A36F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=32b8d438b3b73daa31500345132e5af0bb1964df
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES            |    2 +-
 Config.in          |    2 +-
 docs/download.html |   10 +++++-----
 docs/news.html     |    9 +++++++++
 4 files changed, 16 insertions(+), 7 deletions(-)

diff --git a/CHANGES b/CHANGES
index 0c983f3..17a594c 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,4 +1,4 @@
-2010.08: Not yet released:
+2010.08: Released August 31th, 2010:
 
 	Fixes all over the tree.
 
diff --git a/Config.in b/Config.in
index 7d32a2f..4d7e585 100644
--- a/Config.in
+++ b/Config.in
@@ -8,7 +8,7 @@ config BR2_HAVE_DOT_CONFIG
 
 config BR2_VERSION
 	string
-	default "2010.08-rc2-git"
+	default "2010.08"
 
 source "target/Config.in.arch"
 source "target/device/Config.in"
diff --git a/docs/download.html b/docs/download.html
index 832e7d2..75abc92 100644
--- a/docs/download.html
+++ b/docs/download.html
@@ -6,14 +6,14 @@
 
 <p>
 
-The latest stable release is <b>2010.05</b>, which can be downloaded
+The latest stable release is <b>2010.08</b>, which can be downloaded
 here:<p>
 
-<a href="/downloads/buildroot-2010.05.tar.gz">buildroot-2010.05.tar.gz</a>
+<a href="/downloads/buildroot-2010.08.tar.gz">buildroot-2010.08.tar.gz</a>
 or
-<a href="/downloads/buildroot-2010.05.tar.bz2">buildroot-2010.05.tar.bz2</a>.
+<a href="/downloads/buildroot-2010.08.tar.bz2">buildroot-2010.08.tar.bz2</a>.
 <p>
-
+<!--
 The latest release candidate is <b>2010.08-rc2</b>, which can be
 downloaded here:<p>
 
@@ -21,7 +21,7 @@ downloaded here:<p>
 or
 <a href="/downloads/buildroot-2010.08-rc2.tar.bz2">buildroot-2010.08-rc2.tar.bz2</a>.
 <p>
-
+-->
 This and earlier releases can always be downloaded from
 <a href="/downloads/">http://buildroot.net/downloads/</a>.
 
diff --git a/docs/news.html b/docs/news.html
index 3dbf2fd..347d44a 100644
--- a/docs/news.html
+++ b/docs/news.html
@@ -6,6 +6,15 @@
 
 <ul>
 
+  <li><b>31 August 2010 -- 2010.08 released</b>
+
+    <p>The stable 2010.08 release is out - Thanks to everyone
+    contributing and testing the release candidates. See the
+    <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2010.08">CHANGES</a>
+    file for more details,
+    and go to the <a href="/downloads/">downloads page</a> to pick up the
+    <a href="/downloads/buildroot-2010.08.tar.bz2">2010.08 release</a>.</p>
+
   <li><b>30 August 2010 -- 2010.08-rc2 released</b>
 
     <p>RC2 is out with more cleanups and bugfixes, see the <a
-- 
1.7.1
