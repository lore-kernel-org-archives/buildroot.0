From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 1 Aug 2016 21:36:22 +0200
Subject: [Buildroot] [git commit] configs/freescale: drop unneeded exit
	statement in post-image scripts
Message-ID: <20160801193723.725838211A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d43f526a0ef54a3f7ec0d12064959eb89dd6cbc9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

There is no need for the 'exit' statement in the post-image scripts,
so just remove it.

Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 board/freescale/imx25pdk/post-image.sh    | 2 --
 board/freescale/imx51evk/post-image.sh    | 2 --
 board/freescale/imx53loco/post-image.sh   | 2 --
 board/freescale/imx6ulevk/post-image.sh   | 2 --
 board/freescale/imx7dsdb/post-image.sh    | 2 --
 board/technexion/imx6ulpico/post-image.sh | 2 --
 6 files changed, 12 deletions(-)

diff --git a/board/freescale/imx25pdk/post-image.sh b/board/freescale/imx25pdk/post-image.sh
index 8757355..b4ac460 100755
--- a/board/freescale/imx25pdk/post-image.sh
+++ b/board/freescale/imx25pdk/post-image.sh
@@ -12,5 +12,3 @@ genimage \
   --inputpath "${BINARIES_DIR}" \
   --outputpath "${BINARIES_DIR}" \
   --config "${GENIMAGE_CFG}"
-
-exit $?
diff --git a/board/freescale/imx51evk/post-image.sh b/board/freescale/imx51evk/post-image.sh
index 8757355..b4ac460 100755
--- a/board/freescale/imx51evk/post-image.sh
+++ b/board/freescale/imx51evk/post-image.sh
@@ -12,5 +12,3 @@ genimage \
   --inputpath "${BINARIES_DIR}" \
   --outputpath "${BINARIES_DIR}" \
   --config "${GENIMAGE_CFG}"
-
-exit $?
diff --git a/board/freescale/imx53loco/post-image.sh b/board/freescale/imx53loco/post-image.sh
index 8757355..b4ac460 100755
--- a/board/freescale/imx53loco/post-image.sh
+++ b/board/freescale/imx53loco/post-image.sh
@@ -12,5 +12,3 @@ genimage \
   --inputpath "${BINARIES_DIR}" \
   --outputpath "${BINARIES_DIR}" \
   --config "${GENIMAGE_CFG}"
-
-exit $?
diff --git a/board/freescale/imx6ulevk/post-image.sh b/board/freescale/imx6ulevk/post-image.sh
index 8757355..b4ac460 100755
--- a/board/freescale/imx6ulevk/post-image.sh
+++ b/board/freescale/imx6ulevk/post-image.sh
@@ -12,5 +12,3 @@ genimage \
   --inputpath "${BINARIES_DIR}" \
   --outputpath "${BINARIES_DIR}" \
   --config "${GENIMAGE_CFG}"
-
-exit $?
diff --git a/board/freescale/imx7dsdb/post-image.sh b/board/freescale/imx7dsdb/post-image.sh
index 8757355..b4ac460 100755
--- a/board/freescale/imx7dsdb/post-image.sh
+++ b/board/freescale/imx7dsdb/post-image.sh
@@ -12,5 +12,3 @@ genimage \
   --inputpath "${BINARIES_DIR}" \
   --outputpath "${BINARIES_DIR}" \
   --config "${GENIMAGE_CFG}"
-
-exit $?
diff --git a/board/technexion/imx6ulpico/post-image.sh b/board/technexion/imx6ulpico/post-image.sh
index 8757355..b4ac460 100755
--- a/board/technexion/imx6ulpico/post-image.sh
+++ b/board/technexion/imx6ulpico/post-image.sh
@@ -12,5 +12,3 @@ genimage \
   --inputpath "${BINARIES_DIR}" \
   --outputpath "${BINARIES_DIR}" \
   --config "${GENIMAGE_CFG}"
-
-exit $?
