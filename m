From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 21 Jan 2018 22:29:02 +0100
Subject: [Buildroot] [git commit] docs/website: update for 2017.11.2
Message-ID: <20180121212920.45E307FB6A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0e26df452db48961a14318c4448dc04fafd9b427
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/website/download.html | 18 +++++++++---------
 docs/website/news.html     | 19 +++++++++++++++++++
 2 files changed, 28 insertions(+), 9 deletions(-)

diff --git a/docs/website/download.html b/docs/website/download.html
index 8e2525d..18c94f0 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -42,37 +42,37 @@
 	</div>
       </div>
 
-      <h3 style="text-align: center;">Latest stable release: <b>2017.11.1</b></h3>
+      <h3 style="text-align: center;">Latest stable release: <b>2017.11.2</b></h3>
 
       <div class="row mt centered">
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2017.11.1.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2017.11.2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2017.11.1.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2017.11.2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
-	  <h3><a href="/downloads/buildroot-2017.11.1.tar.gz">buildroot-2017.11.1.tar.gz</a></h3>
-	  <p><a href="/downloads/buildroot-2017.11.1.tar.gz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2017.11.2.tar.gz">buildroot-2017.11.2.tar.gz</a></h3>
+	  <p><a href="/downloads/buildroot-2017.11.2.tar.gz.sign">PGP signature</a></p>
 	</div>
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2017.11.1.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2017.11.2.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2017.11.1.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2017.11.2.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2017.11.1.tar.bz2">buildroot-2017.11.1.tar.bz2</a></h3>
-	  <p><a href="/downloads/buildroot-2017.11.1.tar.bz2.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2017.11.2.tar.bz2">buildroot-2017.11.2.tar.bz2</a></h3>
+	  <p><a href="/downloads/buildroot-2017.11.2.tar.bz2.sign">PGP signature</a></p>
 	</div>
       </div>
 <!--
diff --git a/docs/website/news.html b/docs/website/news.html
index d6e4962..be8ba8b 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,25 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li class="timeline-inverted">
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2017.11.2 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>21 January 2018</small></p>
+      </div>
+      <div class="timeline-body">
+	<p>The 2017.11.2 bugfix release is out, fixing a number of important /
+	  security related issues discovered since the 2017.11.1 release. See the
+	  <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2017.11.2">CHANGES</a>
+	  file for more details, read the
+	  <a href="http://lists.busybox.net/pipermail/buildroot/2018-January/212069.html">announcement</a>
+	  and go to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2017.11.2.tar.bz2">2017.11.2 release</a>.</p>
+      </div>
+    </div>
+  </li>
+
   <li>
     <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
     <div class="timeline-panel">
