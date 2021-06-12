From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 12 Jun 2021 23:09:43 +0200
Subject: [Buildroot] [git commit] docs/website: change wording about
 training provided by Bootlin
Message-ID: <20210612203850.4FCBA8B367@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2e1e9d2ebd5d59b3120c2ccfc6571eadb6745e4f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As suggested by Yann, let's avoid announcing the exact date of the
next course, as it gets outdated very often. Instead, use a more
generic wording and simply point to a Bootlin page that has all the
details.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
