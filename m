From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Fri, 24 Jan 2020 11:37:45 +0100
Subject: [Buildroot] [PATCH] docs/website: add commercial support section
 with Mind
Message-ID: <20200124103745.5132-1-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a section to the support page for commercial support.

Add a box for Mind in that section.

This can be used as an example for other companies that provide
technical support for Buildroot.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
There has been some discussion (off-list) about how to formalize
acceptance criteria for companies to be added to this commercial support
section, but without conclusion AFAIU. So I thought I'd go ahead and
just add one example that should be uncontroversial :-)

I have not looked at how it looks in the browser, because I don't know
how to deploy the website in a way that I can preview it...
---
 docs/website/support.html | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/docs/website/support.html b/docs/website/support.html
index 1a5ce9e225..5128eb291e 100644
--- a/docs/website/support.html
+++ b/docs/website/support.html
@@ -92,6 +92,43 @@
     </div>
   </div>
 
+  <div class="panel panel-primary">
+    <div class="panel-heading">Commercial support</div>
+    <div class="panel-body">
+      <p>In addition, the following companies are able to provide commercial support.</p>
+
+      <div class="row">
+	<div class="col-sm-4">
+	  <div class="panel panel-default panel-sponsor">
+	    <div class="panel-body">
+	      <div class="col-sm-12" style="height: 150px;">
+		<a href="http://www.mind.be">
+		  <img class="img-responsive center-block" src="images/mind-logo.png"/>
+		</a>
+	      </div>
+	      <div class="col-sm-12" style="height: 350px;">
+		<p><a href="http://www.mind.be">Mind</a> provides consultancy
+		and services (outsourcing and fixed price projects), as well as
+		support and training, in the field of Linux, Android and Open
+		Source software for embedded systems. Within this field, Mind's
+		core expertise is in Low-level software development, Networking,
+		Security and Multimedia.</p>
+
+		<p>Our team consists of highly skilled and enthusiastic embedded
+		software engineers with a passion for Open Source software and
+		for hardware.</p>
+
+		<p>We can provide services for the initial bringup of a
+		Buildroot-based system, developing extensions to Buildroot, and
+		long-term maintenance.</p>
+	      </div>
+	    </div>
+	  </div>
+	</div>
+      </div>
+    </div>
+  </div>
+
 </div><!--/.col-sm-10 -->
 </div><!--/.row -->
 </div>
-- 
2.21.1
