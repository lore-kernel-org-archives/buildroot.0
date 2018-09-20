From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 20 Sep 2018 22:20:39 +0200
Subject: [Buildroot] [git commit] package/arp-scan: update upstream URL in
 Config.in help
Message-ID: <20180920202053.33DD3886CE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=98350254765ff84c9e24828316eecf039778b72d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/arp-scan/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/arp-scan/Config.in b/package/arp-scan/Config.in
index cc47a72b01..ed70b39586 100644
--- a/package/arp-scan/Config.in
+++ b/package/arp-scan/Config.in
@@ -7,4 +7,4 @@ config BR2_PACKAGE_ARP_SCAN
 	  arp-scan is a command-line tool that uses the ARP protocol to
 	  discover and fingerprint IP hosts on the local network.
 
-	  http://www.nta-monitor.com/wiki/index.php/Arp-scan_Documentation
+	  https://github.com/royhills/arp-scan
