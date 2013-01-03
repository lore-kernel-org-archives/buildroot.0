From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 3 Jan 2013 22:02:10 +0100
Subject: [Buildroot] [git commit] docs: 2012.11.1 is out
Message-ID: <20130103210208.230E69A5EE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=31ff7b5eac3883a11faf60d9af0b47bfc2d903f3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 docs/download.html |    6 +++---
 docs/news.html     |   11 +++++++++++
 2 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/docs/download.html b/docs/download.html
index 4cb01c9..2b1bb80 100644
--- a/docs/download.html
+++ b/docs/download.html
@@ -6,12 +6,12 @@
 
 <p>
 
-The latest stable release is <b>2012.11</b>, which can be downloaded
+The latest stable release is <b>2012.11.1</b>, which can be downloaded
 here:<p>
 
-<a href="/downloads/buildroot-2012.11.tar.gz">buildroot-2012.11.tar.gz</a>
+<a href="/downloads/buildroot-2012.11.1.tar.gz">buildroot-2012.11.1.tar.gz</a>
 or
-<a href="/downloads/buildroot-2012.11.tar.bz2">buildroot-2012.11.tar.bz2</a>.
+<a href="/downloads/buildroot-2012.11.1.tar.bz2">buildroot-2012.11.1.tar.bz2</a>.
 <!--
 <p>
 The latest release candidate is <b>2012.11-rc2</b>, which can be
diff --git a/docs/news.html b/docs/news.html
index 7e791be..343690f 100644
--- a/docs/news.html
+++ b/docs/news.html
@@ -5,6 +5,17 @@
 <p>
 
 <ul>
+  <li><b>3 January 2013 -- 2012.11.1 released</b>
+
+    <p>The 2012.11.1 bugfix release is out - Thanks to everyone
+    contributing. This release fixes critical issues discovered since
+    the 2012.11 release, most importantly with non-largefile builds on
+    recent Ubuntu versions. See the
+    <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2012.11.1">CHANGES</a>
+    file for more details,
+    and go to the <a href="/downloads/">downloads page</a> to pick up the
+    <a href="/downloads/buildroot-2012.11.1.tar.bz2">2012.11.1 release</a>.</p>
+
   <li><b>2 December 2012 -- 2012.11 released</b>
 
     <p>The stable 2012.11 release is out - Thanks to everyone
