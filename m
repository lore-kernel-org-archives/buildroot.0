From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed,  9 Jun 2021 10:16:20 +0200
Subject: [Buildroot] [PATCH] docs/website: change wording about training
 provided by Bootlin
Message-ID: <20210609081620.427629-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As suggested by Yann, let's avoid announcing the exact date of the
next course, as it gets outdated very often. Instead, use a more
generic wording and simply point to a Bootlin page that has all the
details.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 docs/website/docs.html | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/docs/website/docs.html b/docs/website/docs.html
index e8d8138565..85b005004d 100644
--- a/docs/website/docs.html
+++ b/docs/website/docs.html
@@ -108,14 +108,13 @@
 	  </div>
 
 	  <div class="panel panel-default">
-	    <div class="panel-heading">Public training course</div>
+	    <div class="panel-heading">Public online training course</div>
 	    <div class="panel-body">
-	      The next online public training course on Buildroot
-	      organized
-	      by <a href="https://www.bootlin.com">Bootlin</a> will
-	      take place from May 31 to June 4, 2021, with Thomas Petazzoni as
-	      trainer. <a href="https://bootlin.com/training/buildroot/">Infos</a>
-	      and <a href="https://www.eventbrite.com/e/bootlin-embedded-linux-development-with-buildroot-training-seminar-tickets-145276318379">registration</a>.
+	      Regular online training courses, available to individual
+	      registration, are proposed by Bootlin, with Thomas
+	      Petazzoni as
+	      trainer. See <a href="https://bootlin.com/training/buildroot/">next
+	      dates and registration details</a>.
 	    </div>
 	  </div>
 	</div>
-- 
2.31.1
