From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Thu, 4 Jun 2009 11:58:58 +0200
Subject: [Buildroot] [git commit] use https for the bugtracker URLs
Message-ID: <20090604095925.85F3B777A2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0ebab19479d48f38d0cae3c5d8480a22fef5c4ab
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master


Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
---
 docs/git.html    |    5 +++--
 docs/header.html |    2 +-
 docs/news.html   |   16 ++++++++--------
 3 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/docs/git.html b/docs/git.html
index ef20eea..8820981 100644
--- a/docs/git.html
+++ b/docs/git.html
@@ -27,12 +27,13 @@ tree at any time so it is in sync with the latest and greatest by entering your
 buildroot directory and running the command:
 
 <pre>
-git pull</pre>
+git pull
+</pre>
 
 Because you've only been granted anonymous access to the tree, you won't be
 able to commit any changes. Changes can be submitted for inclusion by posting
 them to the buildroot mailing list or to the <a
-href="http://bugs.uclibc.org/">Bug and Patch Tracking System</a>.
+href="https://bugs.uclibc.org/">Bug and Patch Tracking System</a>.
 
 <!--#include file="footer.html" -->
 
diff --git a/docs/header.html b/docs/header.html
index c9e5817..beb85e9 100644
--- a/docs/header.html
+++ b/docs/header.html
@@ -36,7 +36,7 @@
     <br><a href="/download.html">Download</a>
     <br><a href="http://git.buildroot.net/buildroot">Browse Source</a>
     <br><a href="/git.html">Accessing Source</a>
-    <br><a href="http://bugs.uclibc.org/">Bug Tracking</a>
+    <br><a href="https://bugs.uclibc.org/">Bug Tracking</a>
     <br><a href="/docs.html">Documentation</a>
     <br><a href="/lists.html">Mailing Lists</a>
 
diff --git a/docs/news.html b/docs/news.html
index 75113c4..65fd892 100644
--- a/docs/news.html
+++ b/docs/news.html
@@ -26,7 +26,7 @@
     <a href="/downloads/buildroot-2009.05-rc3.tar.bz2">2009.05-rc3
     release candidate</a>, and report any problems found to the <a
     href="lists.html">mailing list</a> or <a
-    href="http://bugs.uclibc.org">bug tracker</a>.</p>
+    href="https://bugs.uclibc.org">bug tracker</a>.</p>
 
   <li><b>19 May 2009 -- 2009.05-rc2 released</b>
 
@@ -39,7 +39,7 @@
     <a href="/downloads/buildroot-2009.05-rc2.tar.bz2">2009.05-rc2
     release candidate</a>, and report any problems found to the <a
     href="lists.html">mailing list</a> or <a
-    href="http://bugs.uclibc.org">bug tracker</a>.</p>
+    href="https://bugs.uclibc.org">bug tracker</a>.</p>
 
   <li><b>14 May 2009 -- Buildroot.org</b>
 
@@ -61,7 +61,7 @@
     <a href="/downloads/buildroot-2009.05-rc1.tar.bz2">2009.05-rc1
     release candidate</a>, and report any problems found to the <a
     href="lists.html">mailing list</a> or <a
-    href="http://bugs.uclibc.org">bug tracker</a>.</p>
+    href="https://bugs.uclibc.org">bug tracker</a>.</p>
 
   <li><b>3 May 2009 -- Moved to git</b>
 
@@ -101,7 +101,7 @@
     <a href="/downloads/buildroot-2009.02-rc4.tar.bz2">2009.02-rc4
     release candidate</a>, and report any problems found to the <a
     href="lists.html">mailing list</a> or <a
-    href="http://bugs.uclibc.org">bug tracker</a>.</p>
+    href="https://bugs.uclibc.org">bug tracker</a>.</p>
 
   <li><b>31 January 2009 -- 2009.02-rc3 released</b>
       <p>RC3 is out with more cleanups and bug fixes. Unless big issues
@@ -112,7 +112,7 @@
     <a href="/downloads/buildroot-2009.02-rc3.tar.bz2">2009.02-rc3
     release candidate</a>, and report any problems found to the <a
     href="lists.html">mailing list</a> or <a
-    href="http://bugs.uclibc.org">bug tracker</a>.</p>
+    href="https://bugs.uclibc.org">bug tracker</a>.</p>
 
   <li><b>23 January 2009 -- 2009.02-rc2 released</b>
     <p>Another week, another release candidate with a bunch of
@@ -122,7 +122,7 @@
     <a href="/downloads/buildroot-2009.02-rc2.tar.bz2">2009.02-rc2
     release candidate</a>, and report any problems found to the <a
     href="lists.html">mailing list</a> or <a
-    href="http://bugs.uclibc.org">bug tracker</a>.</p>
+    href="https://bugs.uclibc.org">bug tracker</a>.</p>
 
   <li><b>16 January 2009 -- Release candidate and new maintainer</b>
     <p>It has been a long time coming, but we finally have a new
@@ -132,7 +132,7 @@
     <a href="/downloads/buildroot-2009.02-rc1.tar.bz2">2009.02-rc1
     release candidate</a>, and report any problems found to the <a
     href="lists.html">mailing list</a> or <a
-    href="http://bugs.uclibc.org">bug tracker</a>. The plan is to
+    href="https://bugs.uclibc.org">bug tracker</a>. The plan is to
     release 2009.02 in time for <a
     href="http://www.fosdem.org/2009/">FOSDEM</a>.</p>
 
@@ -160,7 +160,7 @@
 
     If you find a bug in buildroot, or wish to submit a patch to fix a problem
     or add a shiny new feature, please use the <a
-    href="http://bugs.uclibc.org/">Bug and Patch Tracking System</a> to post
+    href="https://bugs.uclibc.org/">Bug and Patch Tracking System</a> to post
     the details, to make certain your work is not lost.
 
 
-- 
1.6.0.6
