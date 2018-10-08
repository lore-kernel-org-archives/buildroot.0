From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 8 Oct 2018 09:59:17 +0200
Subject: [Buildroot] [git commit] docs/website/sponsors: credit Scaleway for
 the Hackathon
Message-ID: <20181008080413.584258E02B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=28912be4f2b783372344f6469a9c1c94bde54bcf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Better late than never: let's thank Scaleway who provided some
excellent hosting conditions for our March 2018 Hackathon in Paris.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/website/images/scaleway-logo.png | Bin 0 -> 12331 bytes
 docs/website/sponsors.html            |  18 ++++++++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/docs/website/images/scaleway-logo.png b/docs/website/images/scaleway-logo.png
new file mode 100644
index 0000000000..1685914548
Binary files /dev/null and b/docs/website/images/scaleway-logo.png differ
diff --git a/docs/website/sponsors.html b/docs/website/sponsors.html
index adde47231f..9636a160b3 100644
--- a/docs/website/sponsors.html
+++ b/docs/website/sponsors.html
@@ -4,6 +4,24 @@
 <div class="row nh"><!-- current sponsor row -->
 <div class="col-lg-10 col-lg-offset-1 col-md-12 col-sm-12 col-xs-12">
 
+  <div class="panel panel-primary">
+    <div class="panel-heading">Sponsor of the Buildroot Hackathon, March 2018</div>
+    <div class="panel-body">
+      <div class="col-sm-6">
+	<p>The Buildroot community would like to
+	  thank <a href="https://www.scaleway.com/">Scaleway</a>, who
+	  provided the complete logistics to organize our Buildroot
+	  Hackathon in Paris in March 2018: meeting room, Internet
+	  connectivity and accommodation.</p>
+      </div>
+      <div class="col-sm-6">
+	<a href="http://www.scaleway.com">
+	  <img class="img-responsive center-block" src="images/scaleway-logo.png"/>
+	</a>
+      </div>
+    </div>
+  </div>
+
   <div class="panel panel-primary">
     <div class="panel-heading">Past sponsors</div>
     <div class="panel-body">
