From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 11 Aug 2019 14:07:34 +0200
Subject: [Buildroot] [PATCH] DEVELOPERS: add Nicholas Sielicki as contact
 for galileo_defconfig
Message-ID: <20190811120739.26539-13-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Nicholas was the most recent person to make significant changes to the
galileo_defconfig, so let's add him as a contact for this defconfig,
so that he receives notification of build failures and gets Cc'ed on
patches.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Nicholas Sielicki <sielicki@yandex.com>
Cc: Ray Kinsella <ray.kinsella@intel.com>
Cc: Padraig James Connolly <padraig.connolly@intel.com>
---
Nicholas, could you reply with an Acked-by if you're fine with this?
Thanks!

Otherwise, Ray and Padraig, if you are still working at Intel and
willing to maintain this defconfig, please let us know. Thanks!
---
 DEVELOPERS | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 4cfb67e3a7..a9ed4d5360 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1707,6 +1707,10 @@ N:	Naumann Andreas <ANaumann@ultratronik.de>
 F:	package/evemu/
 F:	package/libevdev/
 
+N:	Nicholas Sielicki <sielicki@yandex.com>
+F:	board/intel/galileo/
+F:	configs/galileo_defconfig
+
 N:	Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
 F:	package/libgit2/
 
-- 
2.21.0
