From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 8 May 2010 09:39:25 +0200
Subject: [Buildroot] [git commit master] CHANGES: #1531 and #1669 are now
	resolved
Message-ID: <20100508073943.9E16F8F575@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=395a70f72fbba38df396717f3c930e17d0f920dc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/CHANGES b/CHANGES
index 47901ea..bd76981 100644
--- a/CHANGES
+++ b/CHANGES
@@ -14,6 +14,8 @@
 	#985: Bump usb_modeswitch package to 1.1.0
 	#1135: Package customize. Wrong copying
 	#1525: Package hal deletes a whole <target>/etc/rc.d directory
+	#1531: libxcb 1.5 build fails, due to missing xcbgen Python module
+	#1669: Busybox failed to compile when using an external toolchain
 	#1699: Fix usbutils dependencies and bump
 	#1705: Fix pciutils broken cross compiling
 	#1717: External toolchain fixes for hostapd & wpa_supplicant
-- 
1.6.3.3
