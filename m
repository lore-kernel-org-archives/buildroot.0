From: Julien Olivain <juju@cotds.org>
Date: Sat, 21 Mar 2020 17:50:55 +0100
Subject: [Buildroot] [PATCH 2/2] package/freescale-imx/imx-sc-firmware: fix
 hashes for license files
In-Reply-To: <20200321165055.430694-1-juju@cotds.org>
References: <20200321165055.430694-1-juju@cotds.org>
Message-ID: <20200321165055.430694-2-juju@cotds.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit f85c4a41701472a005ae17e67910290e08383b6f updated package
version but did not updated hashes for EULA and COPYING license files.
The patch fixes "make legal-info" for imx-sc-firmware package.

Signed-off-by: Julien Olivain <juju@cotds.org>
---
 package/freescale-imx/imx-sc-firmware/imx-sc-firmware.hash | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/freescale-imx/imx-sc-firmware/imx-sc-firmware.hash b/package/freescale-imx/imx-sc-firmware/imx-sc-firmware.hash
index fb9c5e7f85..bd8de5b869 100644
--- a/package/freescale-imx/imx-sc-firmware/imx-sc-firmware.hash
+++ b/package/freescale-imx/imx-sc-firmware/imx-sc-firmware.hash
@@ -1,4 +1,4 @@
 # Locally calculated
 sha256  5a28180217975f3d78fcfac15e46b0a942910fadf078e4af76deb6dc498136ed  imx-sc-firmware-1.2.7.1.bin
-sha256  69d19847bac9af7f9e832170a15138f5ef144d8064413434114d75a68982cc9c  EULA
-sha256  6467f2e81d06b19fe541de49bdba32a9a205e8d1c230220fe24247b48672cb46  COPYING
+sha256  9665930f69c0b6f4a4c055d7fe2b8ee563e771efbc83892abb1955e61492cdf7  EULA
+sha256  d55f024af2bfff714b90de596f6d0399124b999e8c18a86b13a3b507bae6f561  COPYING
-- 
2.25.1
