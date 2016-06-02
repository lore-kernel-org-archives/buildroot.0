From: Fabio Estevam <festevam@gmail.com>
Date: Thu,  2 Jun 2016 19:22:52 -0300
Subject: [Buildroot] [PATCH] imx53loco: Fix post-image.sh permission
Message-ID: <1464906172-6285-1-git-send-email-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix post-image.sh permission to avoid the following error:

>>>   Executing post-image script board/freescale/imx53loco/post-image.sh
/bin/bash: board/freescale/imx53loco/post-image.sh: Permission denied

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 board/freescale/imx53loco/post-image.sh | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 mode change 100644 => 100755 board/freescale/imx53loco/post-image.sh

diff --git a/board/freescale/imx53loco/post-image.sh b/board/freescale/imx53loco/post-image.sh
old mode 100644
new mode 100755
-- 
1.9.1
