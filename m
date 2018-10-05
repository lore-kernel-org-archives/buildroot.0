From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 5 Oct 2018 13:44:30 +0200
Subject: [Buildroot] [git commit branch/2018.05.x] package/arp-scan: update
 upstream URL in Config.in help
Message-ID: <20181005114336.08B478D25C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fe34d651a1f723202b6f4be8d30c9bde047c3c08
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.05.x

Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 98350254765ff84c9e24828316eecf039778b72d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
