From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 Feb 2016 22:51:57 +0100
Subject: [Buildroot] [git commit branch/next] package/systemd: fix wrong
	capitalization
Message-ID: <20160229215223.1266380819@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=83364d15187f06132624c41aa1ce3d226455b821
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Reported-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/systemd/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index 89427cc..e9a7883 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -100,7 +100,7 @@ config BR2_PACKAGE_SYSTEMD_TIMESYNCD
 	bool "enable SNTP client"
 	help
 	  systemd-timesyncd is a service that may be used to synchronize the
-	  local system clock with a Network Time Protocol Server.
+	  local system clock with a Network Time Protocol server.
 
 	  This simple NTP solution is an alternative to sntp/ntpd from the ntp
 	  package.
