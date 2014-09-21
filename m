From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Sep 2014 21:21:28 +0200
Subject: [Buildroot] [git commit] configs/freescale_imx6qsabresd: rename
	imx6 to imx6q
Message-ID: <20140921192326.44FD19D529@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=760b8d0c7297c9f475e2aac51d08413928aa4533
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This defconfig is specific to the SABRESD board equipped with the iMX6Q SoC.
Rename it for clarity in order to avoid confusion with the upcoming
defconfig for the iMX6DL version.

Suggested by Gary Bisson.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Cc: Gilles Talis <gilles.talis@gmail.com>
Cc: Gary Bisson <bisson.gary@gmail.com>
Cc: Vincent Stehl?? <vincent.stehle@freescale.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ..._defconfig => freescale_imx6qsabresd_defconfig} |    0
 1 files changed, 0 insertions(+), 0 deletions(-)

diff --git a/configs/freescale_imx6sabresd_defconfig b/configs/freescale_imx6qsabresd_defconfig
similarity index 100%
rename from configs/freescale_imx6sabresd_defconfig
rename to configs/freescale_imx6qsabresd_defconfig
