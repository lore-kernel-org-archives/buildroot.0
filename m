From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 9 Jun 2015 23:01:07 +0200
Subject: [Buildroot] [git commit] package/matchbox: point to new home
Message-ID: <20150609211052.33E457FEE8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=02994456527ffcae435f2358afbe8c349f95cf69
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The new home of the matchbox project is with the Yocto project.
The old home was already redirecting to it anyway, but better point
directly to the official location.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/matchbox/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/matchbox/Config.in b/package/matchbox/Config.in
index 2f9b73d..891ac95 100644
--- a/package/matchbox/Config.in
+++ b/package/matchbox/Config.in
@@ -15,7 +15,7 @@ config BR2_PACKAGE_MATCHBOX
 	  handhelds, set-top boxes, kiosks and anything else for which
 	  screen space, input mechanisms or system resources are limited.
 
-	  http://matchbox-project.org/
+	  https://www.yoctoproject.org/tools-resources/projects/matchbox
 
 if BR2_PACKAGE_MATCHBOX
 
