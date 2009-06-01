From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 1 Jun 2009 09:23:11 +0200
Subject: [Buildroot] [git commit] docs/: announce 2009.05
Message-ID: <20090601072349.6136377824@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0b76735b4703a6f542726d438c5f38f1840fd6db
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master


Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 docs/download.html |   10 +++++++++-
 docs/news.html     |   10 ++++++++++
 2 files changed, 19 insertions(+), 1 deletions(-)

diff --git a/docs/download.html b/docs/download.html
index 47db25f..349a7cd 100644
--- a/docs/download.html
+++ b/docs/download.html
@@ -6,7 +6,15 @@
 
 <p>
 
-The latest release can always be dowloaded from
+The latest stable release is <b>2009.05</b>, which can be downloaded
+here:<p>
+
+<a href="/downloads/buildroot-2009.05.tar.gz">buildroot-2009.05.tar.gz</a>
+or
+<a href="/downloads/buildroot-2009.05.tar.bz2">buildroot-2009.05.tar.bz2</a>.
+<p>
+
+This and earlier releases can always be dowloaded from
 <a href="/downloads/">http://buildroot.net/downloads/</a>.
 
 <p>
diff --git a/docs/news.html b/docs/news.html
index f73f53b..75113c4 100644
--- a/docs/news.html
+++ b/docs/news.html
@@ -5,6 +5,16 @@
 <p>
 
 <ul>
+  <li><b>1 June 2009 -- 2009.05 released</b>
+
+    <p>The stable 2009.05 release is out - Thanks to everyone
+    contributing and testing the release candidates. See the
+    <a href="http://lists.busybox.net/pipermail/buildroot/2009-June/027640.html">announcement</a>
+    or <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2009.05">CHANGES</a>
+    for more details, and go to the <a href="/downloads/">downloads page</a>
+    to pick up the <a href="/downloads/buildroot-2009.05.tar.bz2">2009.05
+    release</a>.</p>
+
   <li><b>27 May 2009 -- 2009.05-rc3 released</b>
 
     <p>We had a number of fixes post-RC2, so RC3 is out (see <a
-- 
1.6.0.6
