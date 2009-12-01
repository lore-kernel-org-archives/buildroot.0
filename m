From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 1 Dec 2009 15:20:18 +0100
Subject: [Buildroot] [git commit master] update for 2009.11
Message-ID: <20091201142052.646AD777B5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=798927cce9fa8510237a259476e199e01f5dc82e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES            |    2 +-
 docs/download.html |   10 +++++-----
 docs/news.html     |    9 +++++++++
 3 files changed, 15 insertions(+), 6 deletions(-)

diff --git a/CHANGES b/CHANGES
index 6e5eef3..47759e3 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,4 +1,4 @@
-2009.11, Not yet released:
+2009.11, Released December 1st, 2009:
 
 	Additional fixes and cleanups.
 
diff --git a/docs/download.html b/docs/download.html
index e497659..c90f4fc 100644
--- a/docs/download.html
+++ b/docs/download.html
@@ -6,14 +6,14 @@
 
 <p>
 
-The latest stable release is <b>2009.08</b>, which can be downloaded
+The latest stable release is <b>2009.11</b>, which can be downloaded
 here:<p>
 
-<a href="/downloads/buildroot-2009.08.tar.gz">buildroot-2009.08.tar.gz</a>
+<a href="/downloads/buildroot-2009.11.tar.gz">buildroot-2009.11.tar.gz</a>
 or
-<a href="/downloads/buildroot-2009.08.tar.bz2">buildroot-2009.08.tar.bz2</a>.
+<a href="/downloads/buildroot-2009.11.tar.bz2">buildroot-2009.11.tar.bz2</a>.
 <p>
-
+<!--
 The latest release candidate is <b>2009.11-rc2</b>, which can be
 downloaded here:<p>
 
@@ -21,7 +21,7 @@ downloaded here:<p>
 or
 <a href="/downloads/buildroot-2009.11-rc2.tar.bz2">buildroot-2009.11-rc2.tar.bz2</a>.
 <p>
-
+-->
 This and earlier releases can always be downloaded from
 <a href="/downloads/">http://buildroot.net/downloads/</a>.
 
diff --git a/docs/news.html b/docs/news.html
index 3376bee..811674b 100644
--- a/docs/news.html
+++ b/docs/news.html
@@ -5,6 +5,15 @@
 <p>
 
 <ul>
+  <li><b>1 December 2009 -- 2009.11 released</b>
+
+    <p>The stable 2009.11 release is out - Thanks to everyone
+    contributing and testing the release candidates. See the
+    <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2009.11">CHANGES</a>
+    for more details, and go to the <a href="/downloads/">downloads page</a>
+    to pick up the <a href="/downloads/buildroot-2009.11.tar.bz2">2009.11
+    release</a>.</p>
+
   <li><b>29 November 2009 -- 2009.11-rc2 released</b>
 
     <p>RC2 is out with more cleanups and bugfixes, see the <a
-- 
1.6.3.3
