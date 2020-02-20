From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 20 Feb 2020 21:32:23 +0100
Subject: [Buildroot] [git commit] docs/website: add commercial support
 section
Message-ID: <20200220202309.74C428E5C1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4d84b08507d04884c18a2c14e196fa5052bcc448
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a section to the support page for commercial support.

Add Mind, Bootlin and Smile in that section.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Acked-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/website/support.html | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/docs/website/support.html b/docs/website/support.html
index 1a5ce9e225..6c602b42d2 100644
--- a/docs/website/support.html
+++ b/docs/website/support.html
@@ -92,6 +92,31 @@
     </div>
   </div>
 
+  <div class="panel panel-primary">
+    <div class="panel-heading">Commercial support</div>
+    <div class="panel-body">
+      <p>In addition, the following companies are able to provide commercial
+	 support. Only companies heavily involved in Buildroot maintenance and
+	 community are listed here.</p>
+
+      <div class="row">
+	<div class="col-sm-12">
+	  <center>
+	    <a href="https://bootlin.com/engineering/">
+	      <img src="images/bootlin-logo.png" style="max-width:200px; margin-right:40px;"/>
+	    </a>
+	    <a href="https://mind.be/services/buildroot.html">
+	      <img src="images/mind-logo.png" style="max-width:200px; margin-right:40px;"/>
+	    </a>
+	    <a href="https://www.smile.eu/en/offers/embedded-iot">
+	      <img src="images/smile-logo.png" style="max-width:200px; margin-right:40px;"/>
+	    </a>
+	  </center>
+	</div>
+      </div>
+    </div>
+  </div>
+
 </div><!--/.col-sm-10 -->
 </div><!--/.row -->
 </div>
