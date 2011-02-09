From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 9 Feb 2011 23:09:48 +0100
Subject: [Buildroot] [git commit master 1/1] Config.in: use
	kent.dl.sourceforge.net by default
Message-ID: <20110209221130.BBBC08F480@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=d0d3502e2ee103914414b4a82ea0ce786b54c4a5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Easynews has been down for a number of days, and it is no longer in the
mirror list, so use the mirror from the University of Kent instead by
default.

At the same time fix the link to the sf mirror list.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Config.in |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Config.in b/Config.in
index c992c5b..a67c08d 100644
--- a/Config.in
+++ b/Config.in
@@ -103,7 +103,7 @@ config BR2_BACKUP_SITE
 
 config BR2_SOURCEFORGE_MIRROR
 	string "Sourceforge mirror site"
-	default "easynews"
+	default "kent"
 	help
 	  Sourceforge has a system of mirror sites.  Some sites may be
 	  closer to your location, and sometimes mirror sites go down
@@ -111,7 +111,7 @@ config BR2_SOURCEFORGE_MIRROR
 	  your preferred Sourceforge mirror site.
 
 	  The list of mirrors is available here:
-	  http://prdownloads.sourceforge.net/index-sf.html?download
+	  http://sourceforge.net/apps/trac/sourceforge/wiki/Mirrors
 
 config BR2_KERNEL_MIRROR
 	string "Kernel.org mirror"
-- 
1.7.3.4
