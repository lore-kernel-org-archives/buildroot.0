From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Tue, 26 Aug 2014 10:40:47 +0200
Subject: [Buildroot] [PATCH v2 1/3] configs/freescale_imx6qsabresd: rename
	imx6 to imx6q
Message-ID: <1409042449-8263-1-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This defconfig is specific to the SABRESD board equipped with the iMX6Q SoC.
Rename it for clarity in order to avoid confusion with the upcoming
defconfig for the iMX6DL version.

Suggested by Gary Bisson.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Cc: Gilles Talis <gilles.talis@gmail.com>
Cc: Gary Bisson <bisson.gary@gmail.com>
Cc: Vincent Stehl? <vincent.stehle@freescale.com>

---

This patch is new in v3.
---
 .../{freescale_imx6sabresd_defconfig => freescale_imx6qsabresd_defconfig} | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename configs/{freescale_imx6sabresd_defconfig => freescale_imx6qsabresd_defconfig} (100%)

diff --git a/configs/freescale_imx6sabresd_defconfig b/configs/freescale_imx6qsabresd_defconfig
similarity index 100%
rename from configs/freescale_imx6sabresd_defconfig
rename to configs/freescale_imx6qsabresd_defconfig
-- 
1.9.1
