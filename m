From: Julien Olivain <juju@cotds.org>
Date: Sat, 21 Mar 2020 17:50:54 +0100
Subject: [Buildroot] [PATCH 1/2] package/freescale-imx/firmware-imx: fix
 hashes for license files
Message-ID: <20200321165055.430694-1-juju@cotds.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit 8cc27a292e3433a0993b0e28573fa876a87b0a7a updated package
version but did not updated hashes for EULA and COPYING license files.
The patch fixes "make legal-info" for firmware-imx package. Also
adopt new spacing convention in .hash files (two spaces).

Signed-off-by: Julien Olivain <juju@cotds.org>
---
 package/freescale-imx/firmware-imx/firmware-imx.hash | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/freescale-imx/firmware-imx/firmware-imx.hash b/package/freescale-imx/firmware-imx/firmware-imx.hash
index 7b9f722881..e49ce085bf 100644
--- a/package/freescale-imx/firmware-imx/firmware-imx.hash
+++ b/package/freescale-imx/firmware-imx/firmware-imx.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256 45b0a7392e7a4b2e6c7e1cb988dd660ff3f8cd465afdf796ff840a00db08389d  firmware-imx-8.5.bin
-sha256 69d19847bac9af7f9e832170a15138f5ef144d8064413434114d75a68982cc9c  EULA
-sha256 6467f2e81d06b19fe541de49bdba32a9a205e8d1c230220fe24247b48672cb46  COPYING
+sha256  45b0a7392e7a4b2e6c7e1cb988dd660ff3f8cd465afdf796ff840a00db08389d  firmware-imx-8.5.bin
+sha256  9665930f69c0b6f4a4c055d7fe2b8ee563e771efbc83892abb1955e61492cdf7  EULA
+sha256  d55f024af2bfff714b90de596f6d0399124b999e8c18a86b13a3b507bae6f561  COPYING
-- 
2.25.1
