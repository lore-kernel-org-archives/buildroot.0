From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed,  5 Feb 2020 15:26:30 +0100
Subject: [Buildroot] [PATCH 1/2] docs/website/sponsors.html: move Smile to
 past sponsors
Message-ID: <20200205142631.6937-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The new text is unfortunately too long to fit in the box, so bump the
height to 400px for the top row.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/website/sponsors.html | 36 ++++++++----------------------------
 1 file changed, 8 insertions(+), 28 deletions(-)

diff --git a/docs/website/sponsors.html b/docs/website/sponsors.html
index 822407a987..bdec4c7f16 100644
--- a/docs/website/sponsors.html
+++ b/docs/website/sponsors.html
@@ -4,28 +4,6 @@
 <div class="row nh"><!-- current sponsor row -->
 <div class="col-lg-10 col-lg-offset-1 col-md-12 col-sm-12 col-xs-12">
 
-  <div class="panel panel-primary">
-    <div class="panel-heading">Sponsors of the Buildroot Developers Meeting @ ELCE 2019</div>
-    <div class="panel-body">
-      <div class="col-sm-6">
-	<p>The Buildroot community would like to thank
-	  <a href="http://smile.eu">Smile</a> for providing the
-	  meeting location for the 3 days of
-	  the <a href="https://elinux.org/Buildroot:DeveloperDaysELCE2019">Buildroot
-	  Developers Meeting</a> organized on October 25-27 before the
-	  <a href="https://events.linuxfoundation.org/events/embedded-linux-conference-europe-2019/">Embedded
-	    Linux Conference Europe</a> in Lyon, France.</p>
-      </div>
-
-      <div class="col-sm-6">
-	<a href="http://www.smile.eu">
-	  <img class="img-responsive center-block" src="images/smile-logo.png"/>
-	</a>
-      </div>
-
-    </div>
-  </div>
-
   <div class="panel panel-primary">
     <div class="panel-heading">Sponsor of the Buildroot.org domain</div>
     <div class="panel-body">
@@ -58,10 +36,12 @@
 		  <img class="img-responsive center-block" src="images/smile-logo.png"/>
 		</a>
 	      </div>
-	      <div class="col-sm-12" style="height: 350px;">
-		<a href="https://www.smile.eu">Smile</a> sponsored
-		the Buildroot Summer Camp that took place on July 1-5 2016 in Toulouse, France. Smile
-		sponsored the participation of Romain Naour and paid the food expenses for the meeting participants.
+	      <div class="col-sm-12" style="height: 400px;">
+	        <a href="https://www.smile.eu">Smile</a> provided the meeting location for the
+		<a href="https://elinux.org/Buildroot:DeveloperDaysELCE2019">ELCE 2019</a>
+		meeting and sponsored the Buildroot Summer Camp that took place on July 1-5 2016
+		in Toulouse, France. Smile sponsored the participation of Romain Naour and paid
+		the food expenses for the meeting participants.
 		In 2018, Smile sponsored of LLVM/Clang integration into Buildroot, see the final
 		<a href="http://www.linuxembedded.fr/2018/07/llvmclang-integration-into-buildroot">report</a>.
 	      </div>
@@ -77,7 +57,7 @@
 		  <img class="img-responsive center-block" src="images/mind-logo.png"/>
 		</a>
 	      </div>
-	      <div class="col-sm-12" style="height: 350px;">
+	      <div class="col-sm-12" style="height: 400px;">
 		<a href="http://www.mind.be">Mind</a> sponsored
 		financially the Buildroot Association for the ELCE
 		2018 meeting, sponsored the dinner of the FOSDEM 2014,
@@ -97,7 +77,7 @@
 		<p><a href="http://www.google.com">
 		    <img class="img-responsive center-block" src="images/google-logo.png"/></a></p>
 	      </div>
-	      <div class="col-sm-12" style="height: 350px;">
+	      <div class="col-sm-12" style="height: 400px;">
 		<p><a href="http://www.google.com">Google</a> provided
 		  the logistics for the FOSDEM 2013, FOSDEM 2014,
 		  FOSDEM 2015, FOSDEM 2016, FOSDEM 2017, FOSDEM 2018
-- 
2.20.1
