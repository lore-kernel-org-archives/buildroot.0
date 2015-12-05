From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 5 Dec 2015 23:17:04 +0100
Subject: [Buildroot] [git commit] docs: website: update for 2015.11.1
Message-ID: <20151205221735.6FDA780ADC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f8daafddb2339d5d34af1ed23f7dcf4380b775bc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/website/download.html | 18 +++++++++---------
 docs/website/news.html     | 19 +++++++++++++++++++
 2 files changed, 28 insertions(+), 9 deletions(-)

diff --git a/docs/website/download.html b/docs/website/download.html
index 4f8d67a..46f601d 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -8,37 +8,37 @@
     <div class="panel-heading">Download</div>
     <div class="panel-body">
 
-      <h3 style="text-align: center;">Latest stable release: <b>2015.11</b></h3>
+      <h3 style="text-align: center;">Latest stable release: <b>2015.11.1</b></h3>
 
       <div class="row mt centered">
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2015.11.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2015.11.1.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2015.11.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2015.11.1.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
-	  <h3><a href="/downloads/buildroot-2015.11.tar.gz">buildroot-2015.11.tar.gz</a></h3>
-	  <p><a href="/downloads/buildroot-2015.11.tar.gz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2015.11.1.tar.gz">buildroot-2015.11.1.tar.gz</a></h3>
+	  <p><a href="/downloads/buildroot-2015.11.1.tar.gz.sign">PGP signature</a></p>
 	</div>
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2015.11.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2015.11.1.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2015.11.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2015.11.1.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2015.11.tar.bz2">buildroot-2015.11.tar.bz2</a></h3>
-	  <p><a href="/downloads/buildroot-2015.11.tar.bz2.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2015.11.1.tar.bz2">buildroot-2015.11.1.tar.bz2</a></h3>
+	  <p><a href="/downloads/buildroot-2015.11.1.tar.bz2.sign">PGP signature</a></p>
 	</div>
       </div>
 <!--
diff --git a/docs/website/news.html b/docs/website/news.html
index 89c5062..5d4c264 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,25 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li class="timeline-inverted">
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2015.11.1 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>5 December 2015</small></p>
+      </div>
+      <div class="timeline-body">
+	<p>The 2015.11.1 bugfix release is out - Thanks to everyone
+	contributing. This release fixes critical issues discovered
+	since the 2015.11 release. See the
+	<a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2015.11.1">CHANGES</a>
+	file for more details, and go to the
+	<a href="/downloads/">downloads page</a> to pick up the
+	<a href="/downloads/buildroot-2015.11.1.tar.bz2">2015.11.1 release</a>.</p>
+      </div>
+    </div>
+  </li>
+
   <li>
     <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
     <div class="timeline-panel">
