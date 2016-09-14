From: Fabio Estevam <fabio.estevam@nxp.com>
Date: Wed, 14 Sep 2016 10:00:26 -0300
Subject: [Buildroot] [PATCH] wandboard: Remove unneeded return code
Message-ID: <1473858026-17765-1-git-send-email-fabio.estevam@nxp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

There is no need to handle this return code, so just remove it.

Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
---
 board/wandboard/post-image.sh | 2 --
 1 file changed, 2 deletions(-)

diff --git a/board/wandboard/post-image.sh b/board/wandboard/post-image.sh
index 11f58db..18e76aa 100755
--- a/board/wandboard/post-image.sh
+++ b/board/wandboard/post-image.sh
@@ -13,5 +13,3 @@ genimage \
   --outputpath "${BINARIES_DIR}" \
   --config "${GENIMAGE_CFG}"
 
-RET=${?}
-exit ${RET}
-- 
2.7.4
