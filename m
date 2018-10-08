From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon,  8 Oct 2018 09:22:23 +0200
Subject: [Buildroot] [PATCH 1/3] docs/website/sponsors: remove "current
 sponsors", update "past sponsors"
Message-ID: <20181008072225.20924-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit removes Google and Mind as "Current sponsors" and credits
them as "Past sponsors" for the FOSDEM 2018 Buildroot Developers
Meeting.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 docs/website/sponsors.html | 50 +++-------------------------------------------
 1 file changed, 3 insertions(+), 47 deletions(-)

diff --git a/docs/website/sponsors.html b/docs/website/sponsors.html
index 13ff6cc575..adde47231f 100644
--- a/docs/website/sponsors.html
+++ b/docs/website/sponsors.html
@@ -4,50 +4,6 @@
 <div class="row nh"><!-- current sponsor row -->
 <div class="col-lg-10 col-lg-offset-1 col-md-12 col-sm-12 col-xs-12">
 
-  <div class="panel panel-primary">
-    <div class="panel-heading">Current sponsors</div>
-    <div class="panel-body">
-
-      <div class="row">
-
-	<div class="col-sm-12">
-	  <div class="panel panel-default">
-	    <div class="panel-body">
-	      <div class="col-sm-4">
-		<a href="http://www.google.com">
-		  <img class="img-responsive center-block" src="images/google-logo.png"/>
-		</a>
-	      </div>
-	      <div class="col-sm-8">
-		<a href="http://www.google.com">Google</a> is
-		sponsoring
-		the <a href="http://elinux.org/Buildroot:DeveloperDaysFOSDEM2018">Buildroot
-		  Developers Meeting at FOSDEM 2018</a> in Brussels, by
-		providing logistics for the meeting: a free meeting
-		room and lunch for the participants.
-	      </div>
-	    </div>
-	  </div>
-
-	  <div class="col-sm-12">
-	    <div class="panel panel-default">
-	      <div class="panel-body">
-		<div class="col-sm-4">
-		  <a href="http://www.mind.be">
-		    <img class="img-responsive center-block" src="images/mind-logo.png"/>
-		  </a>
-		</div>
-		<div class="col-sm-8">
-		  As it did in previous years, <a href="http://www.mind.be">Mind</a>
-		  is sponsoring the Monday night dinner at the <a href="http://elinux.org/Buildroot:DeveloperDaysFOSDEM2018">Buildroot
-		    Developers Meeting at FOSDEM 2018</a> in Brussels.
-		</div>
-	      </div>
-	    </div>
-	  </div>
-    </div>
-  </div>
-
   <div class="panel panel-primary">
     <div class="panel-heading">Past sponsors</div>
     <div class="panel-body">
@@ -82,7 +38,7 @@
 	      </div>
 	      <div class="col-sm-12">
 		<a href="http://www.mind.be">Mind</a> sponsored the
-		dinner of the FOSDEM 2014, 2015, 2016 and 2017
+		dinner of the FOSDEM 2014, 2015, 2016, 2017 and 2018
 		Developers Meeting (Brussels) and ELCE 2016 (Berlin)
                 and 2017 (Prague), and the meeting room and the dinner for
                 the ELCE 2014 Developers Meeting (D?sseldorf).
@@ -101,8 +57,8 @@
 	      <div class="col-sm-12">
 		<p><a href="http://www.google.com">Google</a> provided
 		  the logistics for the FOSDEM 2013, FOSDEM 2014,
-		  FOSDEM 2015, FOSDEM 2016 and FOSDEM 2017 Developer Days
-		  in Brussels, Belgium.</p>
+		  FOSDEM 2015, FOSDEM 2016, FOSDEM 2017 and FOSDEM
+		  2018 Developer Days in Brussels, Belgium.</p>
 	      </div>
 	    </div>
 	  </div>
-- 
2.14.4
