From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 12 Aug 2019 23:07:20 +0200
Subject: [Buildroot] [git commit] DEVELOPERS: add Sergio Prado as contact
 for toradex_apalis_imx6_defconfig
Message-ID: <20190812211734.9747F8E8A0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=465d715679f8ce5c525b58328ca99ec3cdf29457
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Sergio added this defconfig a while ago, and is still active
contributing to Buildroot, so let's add him as the contact for this
defconfig, so that he receives build failure notifications and gets
Cc'ed on patches.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Sergio Prado <sergio.prado@e-labworks.com>
Cc: Scott Fan <fancp2007@gmail.com>
Acked-by: "Sergio Prado" <sergio.prado@e-labworks.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 9c86547aca..cd0c87f9b2 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2087,6 +2087,8 @@ F:	package/rtl8189fs/
 F:	package/xr819-xradio/
 
 N:	Sergio Prado <sergio.prado@e-labworks.com>
+F:	board/toradex/apalis-imx6/
+F:	configs/toradex_apalis_imx6_defconfig
 F:	package/aoetools/
 F:	package/curlpp/
 F:	package/daq/
