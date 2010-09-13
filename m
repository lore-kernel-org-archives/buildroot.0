From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 13 Sep 2010 23:04:15 +0200
Subject: [Buildroot] [git commit master 1/1] CHANGES: strace is updated,
	not removed
Message-ID: <20100913210458.0C3DE8A61B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=771d76313a9668445fd3edcd5ca334e90d751c4a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Thanks to Sylvain 'ythier' Hitier for noticing.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/CHANGES b/CHANGES
index 39b4de2..5b851dd 100644
--- a/CHANGES
+++ b/CHANGES
@@ -8,10 +8,10 @@
 	Toolchain: ARM cortex A9 support
 
 	Updated/fixed packages: berkeleydb, busybox, dropbear,
-	iptables, kismet, openvpn, qt, usbutils
+	iptables, kismet, openvpn, qt, strace, usbutils
 
 	Removed packages: dillo, libglib12, libgtk12, microwin,
-	pcmcia, strace
+	pcmcia
 
 2010.08: Released August 31th, 2010:
 
-- 
1.7.1
