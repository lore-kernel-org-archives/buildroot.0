From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 21 Mar 2020 18:02:39 +0100
Subject: [Buildroot] [git commit] package/freescale-imx/imx-sc-firmware: fix
 hashes for license files
Message-ID: <20200321164950.572E28078E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=de131e674e4272f5e610f85c6a142c8b1165aa95
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit f85c4a41701472a005ae17e67910290e08383b6f updated package
version but did not updated hashes for EULA and COPYING license files.
The patch fixes "make legal-info" for imx-sc-firmware package.

Signed-off-by: Julien Olivain <juju@cotds.org>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
