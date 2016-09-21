From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 21 Sep 2016 23:24:31 +0200
Subject: [Buildroot] [git commit] docs: website: update for 2016.08.1
Message-ID: <20160921212456.364678083A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ef803279452e5cfe86a7118eafd390f612cbe7ff
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/website/download.html | 18 +++++++++---------
 docs/website/news.html     | 21 +++++++++++++++++++++
 2 files changed, 30 insertions(+), 9 deletions(-)

diff --git a/docs/website/download.html b/docs/website/download.html
index 6380d9a..9ce62c8 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -8,37 +8,37 @@
     <div class="panel-heading">Download</div>
     <div class="panel-body">
 
-      <h3 style="text-align: center;">Latest stable release: <b>2016.08</b></h3>
+      <h3 style="text-align: center;">Latest stable release: <b>2016.08.1</b></h3>
 
       <div class="row mt centered">
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2016.08.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2016.08.1.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2016.08.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2016.08.1.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
-	  <h3><a href="/downloads/buildroot-2016.08.tar.gz">buildroot-2016.08.tar.gz</a></h3>
-	  <p><a href="/downloads/buildroot-2016.08.tar.gz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2016.08.1.tar.gz">buildroot-2016.08.1.tar.gz</a></h3>
+	  <p><a href="/downloads/buildroot-2016.08.1.tar.gz.sign">PGP signature</a></p>
 	</div>
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2016.08.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2016.08.1.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2016.08.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2016.08.1.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2016.08.tar.bz2">buildroot-2016.08.tar.bz2</a></h3>
-	  <p><a href="/downloads/buildroot-2016.08.tar.bz2.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2016.08.1.tar.bz2">buildroot-2016.08.1.tar.bz2</a></h3>
+	  <p><a href="/downloads/buildroot-2016.08.1.tar.bz2.sign">PGP signature</a></p>
 	</div>
       </div>
 <!--
diff --git a/docs/website/news.html b/docs/website/news.html
index 84040c6..9f23d35 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,27 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li>
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2016.08.1 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>21 September 2016</small></p>
+      </div>
+      <div class="timeline-body">
+	<p>The 2016.08.1 bugfix release is out. This release fixes a
+	  potential entire root filesystem removal issue with the
+	  external toolchain handling discovered since the 2016.08
+	  release. See the
+	  <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2016.08.1">CHANGES</a>
+	  file for more details, read the
+	  <a href="http://lists.busybox.net/pipermail/buildroot/2016-September/172712.html">announcement<a> and go to the
+	  <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2016.08.1.tar.bz2">2016.08.1 release</a>.</p>
+      </div>
+    </div>
+  </li>
+
   <li class="timeline-inverted">
     <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
     <div class="timeline-panel">
