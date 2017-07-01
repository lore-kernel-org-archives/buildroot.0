From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Jul 2017 10:28:31 +0200
Subject: [Buildroot] [git commit] configs: drop "mmc" in
	engicam_imx6ul_isiot_mmc_defconfig name
Message-ID: <20170701082619.DD94D8163D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=87de2485ac2e6c89f82979ae572402d20e482c03
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

_mmc on defconfig files in engicam need to drop and same follow on
other engicam defconfig files.

So, this patch rename engicam_imx6ul_isiot_mmc_defconfig to
engicam_imx6ul_isiot_defconfig which is missing in commit "board: Add
support for Engicam Is.IoT MX6UL SOM" (sha1:
0235bc61766bd0d4fecfbd686cd807992ba5f37d)

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...{engicam_imx6ul_isiot_mmc_defconfig => engicam_imx6ul_isiot_defconfig} | 0
 1 file changed, 0 insertions(+), 0 deletions(-)

diff --git a/configs/engicam_imx6ul_isiot_mmc_defconfig b/configs/engicam_imx6ul_isiot_defconfig
similarity index 100%
rename from configs/engicam_imx6ul_isiot_mmc_defconfig
rename to configs/engicam_imx6ul_isiot_defconfig
