From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 25 May 2014 21:51:57 +0200
Subject: [Buildroot] [git commit] website: add alt-tags to images
Message-ID: <20140525204125.AD8AD9CD68@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b8557dc823a536a364d9eeb45bf3139a23e829e2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/header.html |    3 ++-
 docs/index.html  |    3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/docs/header.html b/docs/header.html
index 93a4d51..c1eba22 100644
--- a/docs/header.html
+++ b/docs/header.html
@@ -47,7 +47,8 @@
               <li><a href="/contribute.html">Contribute</a></li>
               <li><a href="/sponsors.html">Sponsors</a></li>
             </ul>
-            <a class="gplus" href="https://plus.google.com/100084591154899263420/posts"><img src="images/gplus.png" height="28" width="28"></a>
+            <a class="gplus" href="https://plus.google.com/100084591154899263420/posts">
+            <img src="images/gplus.png" height="28" width="28" alt="Google+" /></a>
           </div><!--/.nav-collapse -->
         </div>
       </div>
diff --git a/docs/index.html b/docs/index.html
index c1eadfb..f5c0ea7 100644
--- a/docs/index.html
+++ b/docs/index.html
@@ -2,7 +2,8 @@
 
 <div class="hero-unit">
   <div class="row-fluid">
-    <img src="images/logo.png" height="170" width="170" style="float: right;"/>
+    <img src="images/logo.png" height="170" width="170" style="float: right;"
+        alt="Buildroot logo" />
     <div class="span8">
       <h1>Buildroot<br/><small>Making Embedded Linux Easy</small></h1>
       <p>Buildroot is a simple, efficient and easy-to-use tool to generate
