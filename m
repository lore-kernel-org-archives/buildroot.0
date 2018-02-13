From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 13 Feb 2018 14:26:35 +0100
Subject: [Buildroot] [PATCH 3/3] docs/website: Free Electrons is now Bootlin
In-Reply-To: <20180213132635.13455-1-thomas.petazzoni@bootlin.com>
References: <20180213132635.13455-1-thomas.petazzoni@bootlin.com>
Message-ID: <20180213132635.13455-3-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Free Electrons has been renamed to Bootlin, so update the
Documentation section of our website describing the Buildroot training
course to use the new company name and domain name.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 docs/website/docs.html       | 12 ++++++------
 docs/website/js/buildroot.js |  2 +-
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/docs/website/docs.html b/docs/website/docs.html
index 9cee36da28..9ef202ff9d 100644
--- a/docs/website/docs.html
+++ b/docs/website/docs.html
@@ -78,8 +78,8 @@
   <div class="panel panel-primary">
     <div class="panel-heading">Training</div>
     <div class="panel-body">
-      <p><a href="http://www.free-electrons.com">Free Electrons</a> offers a
-	complete <a href="http://free-electrons.com/training/buildroot/">3-days
+      <p><a href="http://www.bootlin.com">Bootlin</a> (formerly Free Electrons)
+	offers a complete <a href="http://bootlin.com/training/buildroot/">3-days
 	  training course on Buildroot</a>. They also make the training
 	materials freely available:</p>
 
@@ -89,7 +89,7 @@
 	    <div class="panel-heading">Slides preview</div>
 	    <div class="panel-body">
 	      <div id="slides" style="width: 100%; padding-bottom: 75%; position: relative">
-		<a href="http://free-electrons.com/doc/training/buildroot/buildroot-slides.pdf"><img src="images/buildroot-slides.png" alt="buildroot slides" style="position:absolute; width:100%; height:100%; top:0; left:0;"></a>
+		<a href="http://bootlin.com/doc/training/buildroot/buildroot-slides.pdf"><img src="images/buildroot-slides.png" alt="buildroot slides" style="position:absolute; width:100%; height:100%; top:0; left:0;"></a>
 	      </div>
 	    </div>
 	  </div>
@@ -100,9 +100,9 @@
 	    <div class="panel-heading">Training materials</div>
 	    <div class="panel-body">
 	      <ul>
-		<li><a href="http://free-electrons.com/doc/training/buildroot/buildroot-slides.pdf">slides (PDF)</a></li>
-		<li><a href="http://free-electrons.com/doc/training/buildroot/buildroot-labs.pdf">practical labs (PDF)</a></li>
-		<li><a href="http://free-electrons.com/doc/training/buildroot/buildroot-labs.tar.xz">practical labs data (.tar.xz)</a></li>
+		<li><a href="http://bootlin.com/doc/training/buildroot/buildroot-slides.pdf">slides (PDF)</a></li>
+		<li><a href="http://bootlin.com/doc/training/buildroot/buildroot-labs.pdf">practical labs (PDF)</a></li>
+		<li><a href="http://bootlin.com/doc/training/buildroot/buildroot-labs.tar.xz">practical labs data (.tar.xz)</a></li>
 	      </ul>
 	    </div>
 	  </div>
diff --git a/docs/website/js/buildroot.js b/docs/website/js/buildroot.js
index a30da633e9..ec28cbb750 100644
--- a/docs/website/js/buildroot.js
+++ b/docs/website/js/buildroot.js
@@ -90,5 +90,5 @@ jQuery(document).ready(function($) {
     load_activity("http://buildroot-busybox.2317881.n4.nabble.com/Buildroot-busybox-ft2.xml", "mailing-list-activity");
     load_activity("http://git.buildroot.org/buildroot/atom/?h=master", "commit-activity");
 
-    $('#slides').html('<iframe src="https://docs.google.com/gview?url=http://free-electrons.com/doc/training/buildroot/buildroot-slides.pdf&embedded=true" style="position:absolute; width:100%; height:100%; top:0; left:0;" frameborder="0"></iframe>')
+    $('#slides').html('<iframe src="https://docs.google.com/gview?url=http://bootlin.com/doc/training/buildroot/buildroot-slides.pdf&embedded=true" style="position:absolute; width:100%; height:100%; top:0; left:0;" frameborder="0"></iframe>')
 });
-- 
2.14.3
