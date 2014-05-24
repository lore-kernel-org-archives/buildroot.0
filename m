From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sat, 24 May 2014 22:06:51 +0200
Subject: [Buildroot] [PATCH 4 of 4 v2 for-2014.05] website: add alt-tags to
	images
In-Reply-To: <patchbomb.1400962007@argentina>
References: <patchbomb.1400962007@argentina>
Message-ID: <19a79a9209ac201ff237.1400962011@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
v2: new patch

 docs/header.html |  3 ++-
 docs/index.html  |  3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/docs/header.html b/docs/header.html
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
