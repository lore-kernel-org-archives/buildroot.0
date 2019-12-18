From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 18 Dec 2019 21:47:11 +0100
Subject: [Buildroot] [git commit] package/freescale-imx/firmware-imx: fix
 license hashes
Message-ID: <20191218203948.601BD8C584@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1bea3e32418c7264ec2b70588976a234e9aa9cdc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

License files were updated since the previous version.
This patch update to the new license hashes. It also fixes the
"make legal-info" command failure due to the hash mismatch.

Fixes:
  - http://autobuild.buildroot.org/results/d9d/d9d82dd6727b82a643cbb75ca33b88a4636bd5fe

Signed-off-by: Julien Olivain <juju@cotds.org>
[yann.morin.1998 at free.fr: add autobuilder reference]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/freescale-imx/firmware-imx/firmware-imx.hash | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/freescale-imx/firmware-imx/firmware-imx.hash b/package/freescale-imx/firmware-imx/firmware-imx.hash
index 6d99ec0077..85f203311f 100644
--- a/package/freescale-imx/firmware-imx/firmware-imx.hash
+++ b/package/freescale-imx/firmware-imx/firmware-imx.hash
@@ -1,4 +1,4 @@
 # Locally calculated
 sha256 c115d5d0d115fc14754671bd2428f672f9f99677988588accef2fbca2c3f749c  firmware-imx-8.1.1.bin
-sha256 fc93f26e4197b9240c327ce26ae6e02123f022423d4704c7b0448a37372cf2a2  EULA
-sha256 78696664f7afe7f2b081c99af60082d6403fab935b1b10056ed41aec123ff7fa  COPYING
+sha256 69d19847bac9af7f9e832170a15138f5ef144d8064413434114d75a68982cc9c  EULA
+sha256 6467f2e81d06b19fe541de49bdba32a9a205e8d1c230220fe24247b48672cb46  COPYING
