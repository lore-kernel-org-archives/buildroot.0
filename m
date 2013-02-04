From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 4 Feb 2013 23:33:09 +0100
Subject: [Buildroot] [git commit] tvheadend: get rid of trailing spaces/tabs
Message-ID: <20130204223733.28BB89A808@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=78e8ed096d643717026392cca19573fb278a1c8d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/tvheadend/Config.in |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tvheadend/Config.in b/package/tvheadend/Config.in
index 67badce..899b160 100644
--- a/package/tvheadend/Config.in
+++ b/package/tvheadend/Config.in
@@ -10,9 +10,9 @@ config BR2_PACKAGE_TVHEADEND
 	  Tvheadend is a TV streaming server for Linux supporting DVB-S,
 	  DVB-S2, DVB-C, DVB-T, ATSC, IPTV, and Analog video (V4L) as
 	  input sources.
-	  
+
 	  https://www.lonelycoder.com/redmine/projects/tvheadend/
-	  
+
 	  Note:
 	    - a default user has been created to log in the web configuration
 	      GUI: admin/admin; you can change it at your discretion at runtime.
