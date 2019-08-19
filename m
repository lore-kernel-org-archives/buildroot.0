From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 19 Aug 2019 22:27:42 +0200
Subject: [Buildroot] [git commit] docs/website: move sponsors of past events
 to "past sponsors"
Message-ID: <20190819202515.88EC283786@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8b7ca5169ded410a7159a04fd219dc7e888c4584
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In this commit, we:

 - move the sponsors of the Buildroot Meeting at ELCE 2018 to "Past
   Sponsors"

 - move Scaleway, as a sponsor of Hackathon in Paris in 2018 to "Past
   Sponsors"

 - merge the Free Electrons and Bootlin entries together in "Past
   Sponsors"

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 docs/website/sponsors.html | 198 ++++++++++++++++++---------------------------
 1 file changed, 78 insertions(+), 120 deletions(-)

diff --git a/docs/website/sponsors.html b/docs/website/sponsors.html
index 4d7f69f18d..822407a987 100644
--- a/docs/website/sponsors.html
+++ b/docs/website/sponsors.html
@@ -44,30 +44,26 @@
   </div>
 
   <div class="panel panel-primary">
-    <div class="panel-heading">Sponsors of the Buildroot Developers Meeting @ ELCE 2018</div>
+    <div class="panel-heading">Past sponsors</div>
     <div class="panel-body">
-
-      <p>The Buildroot community would like to thank the following
-      companies for sponsoring
-      the <a href="https://elinux.org/Buildroot:DeveloperDaysELCE2018">Buildroot
-      Developers Meeting</a> organized on October 20/21 before the
-      <a href="https://events.linuxfoundation.org/events/elc-openiot-europe-2018/">Embedded
-      Linux Conference Europe</a> in Edinburgh.</p>
+      <p>Throughout its history, the Buildroot project has been sponsored by
+	various companies, that we would like to thank below.</p>
 
       <div class="row">
-
 	<div class="col-sm-4">
 	  <div class="panel panel-default panel-sponsor">
 	    <div class="panel-body">
-	      <div class="col-sm-12">
-		<a href="http://www.mind.be">
-		  <img class="img-responsive center-block" src="images/mind-logo.png"/>
+	      <div class="col-sm-12" style="height: 150px;">
+		<a href="https://www.smile.eu">
+		  <img class="img-responsive center-block" src="images/smile-logo.png"/>
 		</a>
 	      </div>
-	      <div class="col-sm-12">
-		<a href="http://www.mind.be">Mind</a> sponsored the
-		event by contributing financially to the <em>Buildroot
-		  Association</em>.
+	      <div class="col-sm-12" style="height: 350px;">
+		<a href="https://www.smile.eu">Smile</a> sponsored
+		the Buildroot Summer Camp that took place on July 1-5 2016 in Toulouse, France. Smile
+		sponsored the participation of Romain Naour and paid the food expenses for the meeting participants.
+		In 2018, Smile sponsored of LLVM/Clang integration into Buildroot, see the final
+		<a href="http://www.linuxembedded.fr/2018/07/llvmclang-integration-into-buildroot">report</a>.
 	      </div>
 	    </div>
 	  </div>
@@ -76,14 +72,19 @@
 	<div class="col-sm-4">
 	  <div class="panel panel-default panel-sponsor">
 	    <div class="panel-body">
-	      <div class="col-sm-12">
-		<p><a href="https://www.amarulasolutions.com/">
-		    <img class="img-responsive center-block" src="images/amarula-solutions-logo.png"/></a></p>
+	      <div class="col-sm-12" style="height: 150px;">
+		<a href="http://www.mind.be">
+		  <img class="img-responsive center-block" src="images/mind-logo.png"/>
+		</a>
 	      </div>
-	      <div class="col-sm-12">
-		<a href="https://www.amarulasolutions.com/">Amarula
-		  Solutions</a> sponsored the event by contributing
-		financially to the <em>Buildroot Association</em>.
+	      <div class="col-sm-12" style="height: 350px;">
+		<a href="http://www.mind.be">Mind</a> sponsored
+		financially the Buildroot Association for the ELCE
+		2018 meeting, sponsored the dinner of the FOSDEM 2014,
+		2015, 2016, 2017 and 2018 Developers Meeting
+		(Brussels) and ELCE 2016 (Berlin) and 2017 (Prague),
+		and the meeting room and the dinner for the ELCE 2014
+		Developers Meeting (D??sseldorf).
 	      </div>
 	    </div>
 	  </div>
@@ -92,14 +93,16 @@
 	<div class="col-sm-4">
 	  <div class="panel panel-default panel-sponsor">
 	    <div class="panel-body">
-	      <div class="col-sm-12">
-		<p><a href="https://www.bootlin.com/">
-		    <img class="img-responsive center-block" src="images/bootlin-logo.png"/></a></p>
+	      <div class="col-sm-12" style="height: 150px;">
+		<p><a href="http://www.google.com">
+		    <img class="img-responsive center-block" src="images/google-logo.png"/></a></p>
 	      </div>
-	      <div class="col-sm-12">
-		<a href="https://www.bootlin.com/">Bootlin</a>
-		sponsored the event by contributing financially to
-		the <em>Buildroot Association</em>.
+	      <div class="col-sm-12" style="height: 350px;">
+		<p><a href="http://www.google.com">Google</a> provided
+		  the logistics for the FOSDEM 2013, FOSDEM 2014,
+		  FOSDEM 2015, FOSDEM 2016, FOSDEM 2017, FOSDEM 2018
+		  and FOSDEM 2019 Developer Days in Brussels,
+		  Belgium.</p>
 	      </div>
 	    </div>
 	  </div>
@@ -109,51 +112,54 @@
       <div class="row">
 
 	<div class="col-sm-4">
-	  <div class="panel panel-default panel-sponsor">
+	  <div class="panel panel-default panel-sponsor" style="height: 400px;">
 	    <div class="panel-body">
 	      <div class="col-sm-12">
-		<a href="http://www.logilin.fr">
-		  <img class="img-responsive center-block" src="images/logilin-logo.png"/>
-		</a>
+		<p><a href="https://www.amarulasolutions.com/">
+		    <img class="img-responsive center-block" src="images/amarula-solutions-logo.png"/></a></p>
 	      </div>
 	      <div class="col-sm-12">
-		<a href="http://www.logilin.fr">Logilin</a> sponsored the
-		event by contributing financially to the <em>Buildroot
-		  Association</em>.
+		<a href="https://www.amarulasolutions.com/">Amarula
+		  Solutions</a> sponsored the event by contributing
+		financially to the <em>Buildroot Association</em>.
 	      </div>
 	    </div>
 	  </div>
 	</div>
 
 	<div class="col-sm-4">
-	  <div class="panel panel-default panel-sponsor">
+	  <div class="panel panel-default panel-sponsor" style="height: 400px;">
 	    <div class="panel-body">
 	      <div class="col-sm-12">
-		<a href="http://www.tkos.col.il">
-		  <img class="img-responsive center-block" src="images/tkos-logo.png"/>
-		</a>
+		<p><a href="https://www.bootlin.com/">
+		    <img class="img-responsive center-block" src="images/bootlin-logo.png"/></a></p>
 	      </div>
+
 	      <div class="col-sm-12">
-		<a href="http://www.tkos.co.il">Tk Open Systems</a>
-		sponsored the event by contributing financially to
-		the <em>Buildroot Association</em>.
+		<p><a href="http://www.bootlin.com">Bootlin</a>
+		  sponsored financially the Buildroot Association for
+		  the ELCE 2018 meeting, sponsored the meeting
+		  location for the ELCE 2016 Developer Days in Berlin,
+		  Germany, and the lunch for the ELCE 2009 Developer
+		  Days in Grenoble, France.</p>
 	      </div>
 	    </div>
 	  </div>
 	</div>
 
 	<div class="col-sm-4">
-	  <div class="panel panel-default panel-sponsor">
+	  <div class="panel panel-default panel-sponsor" style="height: 400px;">
 	    <div class="panel-body">
 	      <div class="col-sm-12">
-		<a href="http://www.rockwellcollins.com/">
-		  <img class="img-responsive center-block" src="images/rockwell-collins-logo.png"/>
+		<a href="http://www.logilin.fr">
+		  <img class="img-responsive center-block" src="images/logilin-logo.png"/>
 		</a>
 	      </div>
 	      <div class="col-sm-12">
-		<a href="http://www.rockwellcollins.com">Rockwell
-		Collins</a> sponsored the event by funding the social
-		Saturday dinner for the participants.
+		<a href="http://www.logilin.fr">Logilin</a> sponsored
+		the ELCE 2018 Buildroot Developers meeting by
+		contributing financially to the <em>Buildroot
+		Association</em>.
 	      </div>
 	    </div>
 	  </div>
@@ -161,49 +167,21 @@
 
       </div>
 
-    </div>
-
-  </div>
-
-  <div class="panel panel-primary">
-    <div class="panel-heading">Sponsor of the Buildroot Hackathon, March 2018</div>
-    <div class="panel-body">
-      <div class="col-sm-6">
-	<p>The Buildroot community would like to
-	  thank <a href="https://www.scaleway.com/">Scaleway</a>, who
-	  provided the complete logistics to organize our Buildroot
-	  Hackathon in Paris in March 2018: meeting room, Internet
-	  connectivity and accommodation.</p>
-      </div>
-      <div class="col-sm-6">
-	<a href="http://www.scaleway.com">
-	  <img class="img-responsive center-block" src="images/scaleway-logo.png"/>
-	</a>
-      </div>
-    </div>
-  </div>
-
-  <div class="panel panel-primary">
-    <div class="panel-heading">Past sponsors</div>
-    <div class="panel-body">
-      <p>Throughout its history, the Buildroot project has been sponsored by
-	various companies, that we would like to thank below.</p>
-
       <div class="row">
+
 	<div class="col-sm-4">
 	  <div class="panel panel-default panel-sponsor">
 	    <div class="panel-body">
 	      <div class="col-sm-12">
-		<a href="https://www.smile.eu">
-		  <img class="img-responsive center-block" src="images/smile-logo.png"/>
+		<a href="http://www.tkos.col.il">
+		  <img class="img-responsive center-block" src="images/tkos-logo.png"/>
 		</a>
 	      </div>
 	      <div class="col-sm-12">
-		<a href="https://www.smile.eu">OpenWide/Smile</a> sponsored
-		the Buildroot Summer Camp that took place on July 1-5 2016 in Toulouse, France. OpenWide/Smile is
-		sponsoring the participation of Romain Naour and paid the food expenses for the meeting participants.
-		In 2018, Smile sponsored of LLVM/Clang integration into Buildroot, see the final
-		<a href="http://www.linuxembedded.fr/2018/07/llvmclang-integration-into-buildroot">report</a>.
+		<a href="http://www.tkos.co.il">Tk Open Systems</a>
+		sponsored the ELCE 2018 Buildroot Developers meeting
+		by contributing financially to the <em>Buildroot
+		Association</em>.
 	      </div>
 	    </div>
 	  </div>
@@ -212,17 +190,16 @@
 	<div class="col-sm-4">
 	  <div class="panel panel-default panel-sponsor">
 	    <div class="panel-body">
-	      <div class="col-sm-12">
-		<a href="http://www.mind.be">
-		  <img class="img-responsive center-block" src="images/mind-logo.png"/>
+	      <div class="col-sm-12" style="height: 100px;">
+		<a href="http://www.rockwellcollins.com/">
+		  <img class="img-responsive center-block" src="images/rockwell-collins-logo.png"/>
 		</a>
 	      </div>
 	      <div class="col-sm-12">
-		<a href="http://www.mind.be">Mind</a> sponsored the
-		dinner of the FOSDEM 2014, 2015, 2016, 2017 and 2018
-		Developers Meeting (Brussels) and ELCE 2016 (Berlin)
-                and 2017 (Prague), and the meeting room and the dinner for
-                the ELCE 2014 Developers Meeting (D??sseldorf).
+		<a href="http://www.rockwellcollins.com">Rockwell
+		Collins</a> sponsored the ELCE 2018 Buildroot
+		Developers meeting by funding the social Saturday
+		dinner for the participants.
 	      </div>
 	    </div>
 	  </div>
@@ -231,15 +208,16 @@
 	<div class="col-sm-4">
 	  <div class="panel panel-default panel-sponsor">
 	    <div class="panel-body">
-	      <div class="col-sm-12">
-		<p><a href="http://www.google.com">
-		    <img class="img-responsive center-block" src="images/google-logo.png"/></a></p>
+	      <div class="col-sm-12" style="height: 100px;">
+		<a href="http://www.scaleway.com">
+		  <img class="img-responsive center-block" src="images/scaleway-logo.png"/>
+		</a>
 	      </div>
 	      <div class="col-sm-12">
-		<p><a href="http://www.google.com">Google</a> provided
-		  the logistics for the FOSDEM 2013, FOSDEM 2014,
-		  FOSDEM 2015, FOSDEM 2016, FOSDEM 2017 and FOSDEM
-		  2018 Developer Days in Brussels, Belgium.</p>
+		<a href="https://www.scaleway.com/">Scaleway</a>
+		sponsored the complete logistics to organize our Buildroot
+		Hackathon in Paris in March 2018: meeting room, Internet
+		connectivity and accommodation.
 	      </div>
 	    </div>
 	  </div>
@@ -345,26 +323,6 @@
 	</div>
       </div>
 
-      <div class="row">
-	<div class="col-sm-4">
-	  <div class="panel panel-default panel-sponsor">
-	    <div class="panel-body">
-	      <div class="col-sm-12">
-		<p><a href="http://www.free-electrons.com">
-		    <img class="img-responsive center-block" src="images/free-electrons-logo.png"/></a></p>
-	      </div>
-	      <div class="col-sm-12">
-		<p><a href="http://www.free-electrons.com">Free
-		  Electrons</a> sponsored the meeting location for the
-		  ELCE 2016 Developer Days in Berlin, Germany, and the
-		  lunch for the ELCE 2009 Developer Days in Grenoble,
-		  France.</p>
-	      </div>
-	    </div>
-	  </div>
-	</div>
-      </div>
-
     </div>
   </div>
 </div>
