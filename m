From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 16 Jul 2016 11:57:14 +0200
Subject: [Buildroot] [git commit] docs/website: add OpenWide/Smile as sponsor
Message-ID: <20160716100135.1C7497FBF2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=607c97c47e7277a9e3356884bd813ec5fddafb87
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As mentionned in
http://lists.busybox.net/pipermail/buildroot/2016-July/167050.html,
OpenWide/Smile has sponsored the Buildroot Summer Camp, by allowing
Romain Naour to participate, and by paying the food expenses for the
event.

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Cc: J??r??my Rosen <jeremy.rosen@smile.fr>
[Thomas:
 - renamed the logo file
 - remove useless white area in the logo, so that it appears bigger on
   the website]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/website/images/owi-smile-logo.png | Bin 0 -> 25258 bytes
 docs/website/sponsors.html             |  17 +++++++++++++++++
 2 files changed, 17 insertions(+)

diff --git a/docs/website/images/owi-smile-logo.png b/docs/website/images/owi-smile-logo.png
new file mode 100644
index 0000000..9744ca1
Binary files /dev/null and b/docs/website/images/owi-smile-logo.png differ
diff --git a/docs/website/sponsors.html b/docs/website/sponsors.html
index 200e7e4..be1fac6 100644
--- a/docs/website/sponsors.html
+++ b/docs/website/sponsors.html
@@ -13,6 +13,23 @@
 	  <div class="panel panel-default">
 	    <div class="panel-body">
 	      <div class="col-sm-4">
+		<a href="http://ingenierie.openwide.fr">
+		  <img class="img-responsive center-block" src="images/owi-smile-logo.png"/>
+		</a>
+	      </div>
+	      <div class="col-sm-8">
+		<a href="http://ingenierie.openwide.fr">OpenWide/Smile</a> is sponsoring
+		the Buildroot Summer Camp taking place on July 1-5 2016 in Toulouse, France. OpenWide/Smile is
+		sponsoring the participation of Romain Naour and paid the food expenses for the meeting participants.
+	      </div>
+	    </div>
+	  </div>
+	</div>
+
+	<div class="col-sm-12">
+	  <div class="panel panel-default">
+	    <div class="panel-body">
+	      <div class="col-sm-4">
 		<a href="http://google.com">
 		  <img class="img-responsive center-block" src="images/google-logo.png"/>
 		</a>
