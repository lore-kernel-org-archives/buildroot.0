From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 1 Jan 2018 12:51:59 +0100
Subject: [Buildroot] [git commit] docs/website: update for 2017.02.9
Message-ID: <20180101115229.D58838129F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7da7a1f96f69b3dcd52af1d33d2b260d53af6bc3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/website/download.html | 18 +++++++++---------
 docs/website/news.html     | 19 +++++++++++++++++++
 2 files changed, 28 insertions(+), 9 deletions(-)

diff --git a/docs/website/download.html b/docs/website/download.html
index e5d7c81..8e2525d 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -8,37 +8,37 @@
     <div class="panel-heading">Download</div>
     <div class="panel-body">
 
-      <h3 style="text-align: center;">Latest long term support release: <b>2017.02.8</b></h3>
+      <h3 style="text-align: center;">Latest long term support release: <b>2017.02.9</b></h3>
 
       <div class="row mt centered">
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2017.02.8.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2017.02.9.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2017.02.8.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2017.02.9.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
-	  <h3><a href="/downloads/buildroot-2017.02.8.tar.gz">buildroot-2017.02.8.tar.gz</a></h3>
-	  <p><a href="/downloads/buildroot-2017.02.8.tar.gz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2017.02.9.tar.gz">buildroot-2017.02.9.tar.gz</a></h3>
+	  <p><a href="/downloads/buildroot-2017.02.9.tar.gz.sign">PGP signature</a></p>
 	</div>
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2017.02.8.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2017.02.9.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2017.02.8.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2017.02.9.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2017.02.8.tar.bz2">buildroot-2017.02.8.tar.bz2</a></h3>
-	  <p><a href="/downloads/buildroot-2017.02.8.tar.bz2.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2017.02.9.tar.bz2">buildroot-2017.02.9.tar.bz2</a></h3>
+	  <p><a href="/downloads/buildroot-2017.02.9.tar.bz2.sign">PGP signature</a></p>
 	</div>
       </div>
 
diff --git a/docs/website/news.html b/docs/website/news.html
index 7522f26..d6e4962 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,25 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li>
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2017.02.9 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>1 January 2018</small></p>
+      </div>
+      <div class="timeline-body">
+	<p>The 2017.02.9 bugfix release is out, fixing a number of important /
+	  security related issues discovered since the 2017.02.8 release. See the
+	  <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2017.02.9">CHANGES</a>
+	  file for more details, read the
+	  <a href="http://lists.busybox.net/pipermail/buildroot/2018-January/210559.html">announcement</a>
+	  and go to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2017.02.9.tar.bz2">2017.02.9 release</a>.</p>
+      </div>
+    </div>
+  </li>
+
   <li class="timeline-inverted">
     <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
     <div class="timeline-panel">
