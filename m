From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 15 Nov 2009 22:33:24 +0100
Subject: [Buildroot] [git commit master] docs/docs.html: add link to doc for
	latest stable release as well
Message-ID: <20091115213415.49AFE77615@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=f1a5f6e9c30e6d872804de0785e730e575543bee
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This will get copied to /downloads together with tarballs at release time.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 docs/docs.html |   16 +++++++++++-----
 1 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/docs/docs.html b/docs/docs.html
index 3938826..663135a 100644
--- a/docs/docs.html
+++ b/docs/docs.html
@@ -2,15 +2,21 @@
 
 
 <h3>Documentation</h3>
-Current documentation for buildroot includes:
+Documentation for buildroot includes:
 
 <ul>
 
   <li>
-    <a href= "buildroot.html">Buildroot - Usage and
-    documentation</a> is where you want to start reading if you wish to
-    understand how buildroot work, or wish to change/extend/fix things.  If you
-    find any errors (factual, grammatical, whatever) please report them.
+    Usage and documentation is where you want to start reading if you
+    wish to understand how buildroot work, or wish to
+    change/extend/fix things. If you find any errors (factual,
+    grammatical, whatever) please report them. Choose between:
+    <p>
+    <ul>
+      <li><a href="/downloads/buildroot.html">Latest stable release</a></li>
+      <li><a href="buildroot.html">GIT head revision</a></li>
+    </ul>
+    <p>
   </li>
 
   <li>
-- 
1.6.3.3
