From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 6 Oct 2016 00:50:49 +0200
Subject: [Buildroot] [PATCH] website: add Mind as a sponsor for the ELCE16
	meeting
Message-ID: <20161005225049.12399-1-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also move Openwide/SMILE down to the past sponsors. This also requires
all the row endings to move.

Note that I chose to mention Mind twice, once as current sponsor and
once as past sponsor.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
I (accidentally) removed all the row divs at some point, and that still
seemed to work... But I don't really understand this bootstrap stuff so
I didn't dare touching it :-)
---
 docs/website/sponsors.html | 39 +++++++++++++++++++++++++++++----------
 1 file changed, 29 insertions(+), 10 deletions(-)

diff --git a/docs/website/sponsors.html b/docs/website/sponsors.html
index 7a176ee..0a4373d 100644
--- a/docs/website/sponsors.html
+++ b/docs/website/sponsors.html
@@ -13,19 +13,19 @@
 	  <div class="panel panel-default">
 	    <div class="panel-body">
 	      <div class="col-sm-4">
-		<a href="http://ingenierie.openwide.fr">
-		  <img class="img-responsive center-block" src="images/owi-smile-logo.png"/>
+		<a href="http://www.mind.be">
+		  <img class="img-responsive center-block" src="images/mind-logo.png"/>
 		</a>
 	      </div>
 	      <div class="col-sm-8">
-		<a href="http://ingenierie.openwide.fr">OpenWide/Smile</a> is sponsoring
-		the Buildroot Summer Camp taking place on July 1-5 2016 in Toulouse, France. OpenWide/Smile is
-		sponsoring the participation of Romain Naour and paid the food expenses for the meeting participants.
+		As it did in previous years and at FOSDEM, <a href="http://www.mind.be">Mind</a>
+		is sponsoring the Friday night dinner at the <a href="http://elinux.org/Buildroot:DeveloperDaysELCE2016">Buildroot
+		Developers Meeting at ELCE 2016</a> in Berlin.
 	      </div>
 	    </div>
 	  </div>
 	</div>
-      </div>
+
     </div>
   </div>
 
@@ -40,6 +40,23 @@
 	  <div class="panel panel-default panel-sponsor">
 	    <div class="panel-body">
 	      <div class="col-sm-12">
+		<a href="http://ingenierie.openwide.fr">
+		  <img class="img-responsive center-block" src="images/owi-smile-logo.png"/>
+		</a>
+	      </div>
+	      <div class="col-sm-12">
+		<a href="http://ingenierie.openwide.fr">OpenWide/Smile</a> sponsored
+		the Buildroot Summer Camp that took place on July 1-5 2016 in Toulouse, France. OpenWide/Smile is
+		sponsoring the participation of Romain Naour and paid the food expenses for the meeting participants.
+	      </div>
+	    </div>
+	  </div>
+	</div>
+
+	<div class="col-sm-4">
+	  <div class="panel panel-default panel-sponsor">
+	    <div class="panel-body">
+	      <div class="col-sm-12">
 		<a href="http://www.mind.be">
 		  <img class="img-responsive center-block" src="images/mind-logo.png"/>
 		</a>
@@ -70,7 +87,9 @@
 	    </div>
 	  </div>
 	</div>
+      </div>
 
+      <div class="row">
 	<div class="col-sm-4">
 	  <div class="panel panel-default panel-sponsor">
 	    <div class="panel-body">
@@ -86,9 +105,7 @@
 	    </div>
 	  </div>
 	</div>
-      </div>
 
-      <div class="row">
 	<div class="col-sm-4">
 	  <div class="panel panel-default panel-sponsor">
 	    <div class="panel-body">
@@ -120,7 +137,9 @@
 	    </div>
 	  </div>
 	</div>
+      </div>
 
+      <div class="row">
 	<div class="col-sm-4">
 	  <div class="panel panel-default panel-sponsor">
 	    <div class="panel-body">
@@ -136,9 +155,7 @@
 	    </div>
 	  </div>
 	</div>
-      </div>
 
-      <div class="row">
 	<div class="col-sm-4">
 	  <div class="panel panel-default panel-sponsor">
 	    <div class="panel-body">
@@ -169,7 +186,9 @@
 	    </div>
 	  </div>
 	</div>
+      </div>
 
+      <div class="row">
 	<div class="col-sm-4">
 	  <div class="panel panel-default panel-sponsor">
 	    <div class="panel-body">
-- 
2.9.3
