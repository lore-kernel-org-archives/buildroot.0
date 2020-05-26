From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 26 May 2020 21:53:15 +0200
Subject: [Buildroot] [git commit] docs/website/sponsors.html: show 2020
 sponsors
Message-ID: <20200526193646.5CBC891A97@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1e6e67a82569093a9f2c59a3a94e874bba93fea6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

So far in 2020, Logilin and Tap2Open made some financial donations to
the Buildroot Association, so let's thank them on our sponsors page.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 docs/website/images/tap2open-logo.png | Bin 0 -> 9064 bytes
 docs/website/sponsors.html            |  40 ++++++++++++++++++++++++++++++++++
 2 files changed, 40 insertions(+)

diff --git a/docs/website/images/tap2open-logo.png b/docs/website/images/tap2open-logo.png
new file mode 100644
index 0000000000..136019b621
Binary files /dev/null and b/docs/website/images/tap2open-logo.png differ
diff --git a/docs/website/sponsors.html b/docs/website/sponsors.html
index 4cbfc5a34b..2f3f6309ae 100644
--- a/docs/website/sponsors.html
+++ b/docs/website/sponsors.html
@@ -4,6 +4,46 @@
 <div class="row nh"><!-- current sponsor row -->
 <div class="col-lg-10 col-lg-offset-1 col-md-12 col-sm-12 col-xs-12">
 
+    <div class="panel panel-primary">
+    <div class="panel-heading">Current sponsors</div>
+    <div class="panel-body">
+
+      <div class="row">
+	<div class="col-sm-4">
+	  <div class="panel panel-default panel-sponsor">
+	    <div class="panel-body">
+	      <div class="col-sm-12" style="height: 150px;">
+		<a href="https://www.tap2open.com">
+		  <img class="img-responsive center-block" src="images/tap2open-logo.png"/>
+		</a>
+	      </div>
+	      <div class="col-sm-12" style="height: 150px;">
+	        <a href="https://www.tap2open.com">Tap2Open</a>
+	        financially sponsored the <a href="/association.html">Buildroot Association</a>
+	        in 2020.</div>
+	    </div>
+	  </div>
+	</div>
+
+	<div class="col-sm-4">
+	  <div class="panel panel-default panel-sponsor">
+	    <div class="panel-body">
+	      <div class="col-sm-12" style="height: 150px;">
+		<a href="http://www.logilin.fr">
+		  <img class="img-responsive center-block" src="images/logilin-logo.png"/>
+		</a>
+	      </div>
+	      <div class="col-sm-12" style="height: 150px;">
+		<a href="http://www.logilin.fr">Logilin</a>
+		financially sponsored the <a href="/association.html">Buildroot Association</a>
+		in 2020.</div>
+	    </div>
+	  </div>
+	</div>
+      </div>
+    </div>
+    </div>
+
   <div class="panel panel-primary">
     <div class="panel-heading">Sponsor of the Buildroot.org domain</div>
     <div class="panel-body">
