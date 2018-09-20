From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Thu, 20 Sep 2018 08:24:52 -0500
Subject: [Buildroot] [PATCH 07/14] package/arp-scan: URL update
In-Reply-To: <1537449899-9576-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1537449899-9576-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <1537449899-9576-7-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
---
 package/arp-scan/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/arp-scan/Config.in b/package/arp-scan/Config.in
index cc47a72..ed70b39 100644
--- a/package/arp-scan/Config.in
+++ b/package/arp-scan/Config.in
@@ -7,4 +7,4 @@ config BR2_PACKAGE_ARP_SCAN
 	  arp-scan is a command-line tool that uses the ARP protocol to
 	  discover and fingerprint IP hosts on the local network.
 
-	  http://www.nta-monitor.com/wiki/index.php/Arp-scan_Documentation
+	  https://github.com/royhills/arp-scan
-- 
1.9.1
