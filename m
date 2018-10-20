From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 20 Oct 2018 17:21:47 +0200
Subject: [Buildroot] [git commit] docs/website/sponsors: credit Smile for
 the LLVM/Clang internship
Message-ID: <20181020152039.27F1283EA7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=76fdc787cc811f1fe2ade929e2ce01c5b7bc8dfb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update Smile url and logo.

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 docs/website/images/owi-smile-logo.png | Bin 25258 -> 0 bytes
 docs/website/images/smile-logo.png     | Bin 0 -> 60367 bytes
 docs/website/sponsors.html             |   8 +++++---
 3 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/docs/website/images/owi-smile-logo.png b/docs/website/images/owi-smile-logo.png
deleted file mode 100644
index 9744ca1531..0000000000
Binary files a/docs/website/images/owi-smile-logo.png and /dev/null differ
diff --git a/docs/website/images/smile-logo.png b/docs/website/images/smile-logo.png
new file mode 100644
index 0000000000..7bcea3334c
Binary files /dev/null and b/docs/website/images/smile-logo.png differ
diff --git a/docs/website/sponsors.html b/docs/website/sponsors.html
index 6f45b0bdf2..60f0e55939 100644
--- a/docs/website/sponsors.html
+++ b/docs/website/sponsors.html
@@ -155,14 +155,16 @@
 	  <div class="panel panel-default panel-sponsor">
 	    <div class="panel-body">
 	      <div class="col-sm-12">
-		<a href="http://ingenierie.openwide.fr">
-		  <img class="img-responsive center-block" src="images/owi-smile-logo.png"/>
+		<a href="https://www.smile.eu">
+		  <img class="img-responsive center-block" src="images/smile-logo.png"/>
 		</a>
 	      </div>
 	      <div class="col-sm-12">
-		<a href="http://ingenierie.openwide.fr">OpenWide/Smile</a> sponsored
+		<a href="https://www.smile.eu">OpenWide/Smile</a> sponsored
 		the Buildroot Summer Camp that took place on July 1-5 2016 in Toulouse, France. OpenWide/Smile is
 		sponsoring the participation of Romain Naour and paid the food expenses for the meeting participants.
+		In 2018, Smile sponsored of LLVM/Clang integration into Buildroot, see the final
+		<a href="http://www.linuxembedded.fr/2018/07/llvmclang-integration-into-buildroot">report</a>.
 	      </div>
 	    </div>
 	  </div>
