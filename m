From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 22 Jan 2019 07:55:00 -0600
Subject: [Buildroot] [PATCH] package/rp-pppoe: updated website url
Message-ID: <1548165300-11371-1-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The website for rp-pppoe moved from Roaring Penguin's main site to
a personal project page.

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 package/rp-pppoe/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/rp-pppoe/Config.in b/package/rp-pppoe/Config.in
index 8a69271..12f981d 100644
--- a/package/rp-pppoe/Config.in
+++ b/package/rp-pppoe/Config.in
@@ -16,4 +16,4 @@ config BR2_PACKAGE_RP_PPPOE
 	  devices. Otherwise the normal client functionality already
 	  exists in the pppd package (and kernel).
 
-	  http://www.roaringpenguin.com/pppoe.html
+	  https://dianne.skoll.ca/projects/rp-pppoe/
-- 
1.9.1
