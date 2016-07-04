From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 4 Jul 2016 23:24:18 +0200
Subject: [Buildroot] [git commit] udpcast: remove menu ... endmenu
Message-ID: <20160704212442.64E0B81836@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fd781bb7913274ec11c83568af29536c4b15ce1f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For just two sub-options, this is really overkill.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/udpcast/Config.in | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/udpcast/Config.in b/package/udpcast/Config.in
index 0424db7..ef94b30 100644
--- a/package/udpcast/Config.in
+++ b/package/udpcast/Config.in
@@ -14,8 +14,6 @@ config BR2_PACKAGE_UDPCAST
 
 if BR2_PACKAGE_UDPCAST
 
-menu "udpcast tools selection"
-
 config BR2_PACKAGE_UDPCAST_SENDER
 	bool "sender"
 	help
@@ -26,6 +24,4 @@ config BR2_PACKAGE_UDPCAST_RECEIVER
 	help
 	  The udpcast receiver.
 
-endmenu
-
 endif
