From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 16 Jul 2016 12:00:52 +0200
Subject: [Buildroot] [git commit] docs/website: adjust presentation of Mind
	sponsoring
Message-ID: <20160716100135.393507FBF2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d07521f798a7d2a609f34fbbcacf70799a4e7899
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Make the font size of the Mind block the same as all other blocks (it
was smaller) and re-adjust the min height of all blocks so that they
look the same.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/website/css/main.css  | 2 +-
 docs/website/sponsors.html | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/website/css/main.css b/docs/website/css/main.css
index db9c4c9..5255531 100644
--- a/docs/website/css/main.css
+++ b/docs/website/css/main.css
@@ -163,7 +163,7 @@ i {
 }
 
 .panel-sponsor {
-	min-height: 300px;
+	min-height: 350px;
 	text-align: justify;
 	text-justify: inter-word;
 }
diff --git a/docs/website/sponsors.html b/docs/website/sponsors.html
index 48c50c4..7a176ee 100644
--- a/docs/website/sponsors.html
+++ b/docs/website/sponsors.html
@@ -44,7 +44,7 @@
 		  <img class="img-responsive center-block" src="images/mind-logo.png"/>
 		</a>
 	      </div>
-	      <div class="col-sm-12" style="font-size: 12px;">
+	      <div class="col-sm-12">
 		<a href="http://www.mind.be">Mind</a> sponsored the
 		dinner of the FOSDEM 2014, 2015 and 2016 Developers
 		Meeting (Brussels), the meeting room and the dinner
