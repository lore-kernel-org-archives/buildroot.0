From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 26 Feb 2010 15:52:48 +0100
Subject: [Buildroot] [git commit master] Update for 2010.02
Message-ID: <20100226145314.AC2BD7778D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=ac1dfc84da705162fd9b43bd7f09eaacbd032d4e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES            |    2 +-
 Config.in          |    2 +-
 docs/download.html |   10 +++++-----
 docs/news.html     |    9 +++++++++
 4 files changed, 16 insertions(+), 7 deletions(-)

diff --git a/CHANGES b/CHANGES
index e6a656b..a49ca4e 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,4 +1,4 @@
-2010.02, Not yet released:
+2010.02, Release February 26th, 2010:
 
 	Fixes all over the tree.
 
diff --git a/Config.in b/Config.in
index 21d0ffe..ef5d2a0 100644
--- a/Config.in
+++ b/Config.in
@@ -8,7 +8,7 @@ config BR2_HAVE_DOT_CONFIG
 
 config BR2_VERSION
 	string
-	default "2010.02-rc2"
+	default "2010.02"
 
 source "target/Config.in.arch"
 source "target/device/Config.in"
diff --git a/docs/download.html b/docs/download.html
index f921aa7..1666827 100644
--- a/docs/download.html
+++ b/docs/download.html
@@ -6,14 +6,14 @@
 
 <p>
 
-The latest stable release is <b>2009.11</b>, which can be downloaded
+The latest stable release is <b>2010.02</b>, which can be downloaded
 here:<p>
 
-<a href="/downloads/buildroot-2009.11.tar.gz">buildroot-2009.11.tar.gz</a>
+<a href="/downloads/buildroot-2010.02.tar.gz">buildroot-2010.02.tar.gz</a>
 or
-<a href="/downloads/buildroot-2009.11.tar.bz2">buildroot-2009.11.tar.bz2</a>.
+<a href="/downloads/buildroot-2010.02.tar.bz2">buildroot-2010.02.tar.bz2</a>.
 <p>
-
+<!--
 The latest release candidate is <b>2010.02-rc2</b>, which can be
 downloaded here:<p>
 
@@ -21,7 +21,7 @@ downloaded here:<p>
 or
 <a href="/downloads/buildroot-2010.02-rc2.tar.bz2">buildroot-2010.02-rc2.tar.bz2</a>.
 <p>
-
+-->
 This and earlier releases can always be downloaded from
 <a href="/downloads/">http://buildroot.net/downloads/</a>.
 
diff --git a/docs/news.html b/docs/news.html
index 48fa8df..3526314 100644
--- a/docs/news.html
+++ b/docs/news.html
@@ -5,6 +5,15 @@
 <p>
 
 <ul>
+  <li><b>26 February 2010 -- 2010.02 released</b>
+
+    <p>The stable 2010.02 release is out - Thanks to everyone
+    contributing and testing the release candidates. See the
+    <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2010.02">CHANGES</a>
+    file for more details, and go to the <a href="/downloads/">downloads page</a>
+    to pick up the <a href="/downloads/buildroot-2010.02.tar.bz2">2010.02
+    release</a>.</p>
+
   <li><b>23 February 2010 -- 2010.02-rc2 released</b>
 
     <p>RC2 is out with more cleanups and bugfixes, see the <a
-- 
1.6.3.3
