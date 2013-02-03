From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  3 Feb 2013 13:15:27 +0100
Subject: [Buildroot] [PATCH 1/2] tvheadend: get rid of trailing spaces/tabs
Message-ID: <1359893728-4345-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/tvheadend/Config.in |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

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
-- 
1.7.9.5
