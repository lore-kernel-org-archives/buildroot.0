From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 3 Jun 2016 09:50:35 +0200
Subject: [Buildroot] [git commit] imx53loco: Fix post-image.sh permission
Message-ID: <20160603075052.CEEB881F72@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ee1ea8211669cab03a93e889d1d178d59b9085d1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix post-image.sh permission to avoid the following error:

>>>   Executing post-image script board/freescale/imx53loco/post-image.sh
/bin/bash: board/freescale/imx53loco/post-image.sh: Permission denied

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 board/freescale/imx53loco/post-image.sh | 0
 1 file changed, 0 insertions(+), 0 deletions(-)

diff --git a/board/freescale/imx53loco/post-image.sh b/board/freescale/imx53loco/post-image.sh
old mode 100644
new mode 100755
