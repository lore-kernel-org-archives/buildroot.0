From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Wed,  1 Aug 2018 10:21:00 +0200
Subject: [Buildroot] [PATCH] firmware-imx: fix EULA and COPYING hashes
Message-ID: <20180801082100.18394-1-gary.bisson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

NXP updated their EULA text to 2018.
Also add QCA text for their WiFi module firmware files.

Fixes:
http://autobuild.buildroot.net/results/144c3ac1902be605ca221e5685b13ba22db9a70e/
http://autobuild.buildroot.net/results/c8f787cc5309a9d216fb74b13e700e520facef64/

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
---
 package/freescale-imx/firmware-imx/firmware-imx.hash | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/freescale-imx/firmware-imx/firmware-imx.hash b/package/freescale-imx/firmware-imx/firmware-imx.hash
index c4930bb67d..c22ee4c192 100644
--- a/package/freescale-imx/firmware-imx/firmware-imx.hash
+++ b/package/freescale-imx/firmware-imx/firmware-imx.hash
@@ -1,4 +1,4 @@
 # Locally calculated
 sha256 a8f099bdf786b2da1e8b43094950c033ccdbf93f1b8a93caffb912e1500cd735  firmware-imx-7.5.bin
-sha256 faf01d10e484879247963eb97d96622a980232e22a35e487dfe53b13708b686a  EULA
-sha256 0f34f6175247762e2e1c38319aadf657a53f00ce124e569dfc61b30451549e7a  COPYING
+sha256 fc93f26e4197b9240c327ce26ae6e02123f022423d4704c7b0448a37372cf2a2  EULA
+sha256 78696664f7afe7f2b081c99af60082d6403fab935b1b10056ed41aec123ff7fa  COPYING
-- 
2.18.0
