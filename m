From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 16 Jul 2016 12:21:53 +0200
Subject: [Buildroot] [git commit] gpu-amd-bin-mx51: add missing hash
Message-ID: <20160716115408.9E4AA7FC6B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=752a3aad96d3fbab2ac53b0384656ed49fb2ca4f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add hash for amd-gpu-bin-mx51-11.09.01.bin (the framebuffer variant of
the driver).

Signed-off-by: Dagg Stompler <daggs@gmx.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/freescale-imx/gpu-amd-bin-mx51/gpu-amd-bin-mx51.hash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/freescale-imx/gpu-amd-bin-mx51/gpu-amd-bin-mx51.hash b/package/freescale-imx/gpu-amd-bin-mx51/gpu-amd-bin-mx51.hash
index 200265e..9c08e4a 100644
--- a/package/freescale-imx/gpu-amd-bin-mx51/gpu-amd-bin-mx51.hash
+++ b/package/freescale-imx/gpu-amd-bin-mx51/gpu-amd-bin-mx51.hash
@@ -1,2 +1,3 @@
 # locally computed
 sha256  c7a6fa03b7aa2a375556c59908876554ba720c1e744baba2debb84a408f790db  amd-gpu-x11-bin-mx51-11.09.01.bin
+sha256  f0db68a764b5fb199729e7435f606b8d12b61ca97990336c647b7e81f4a584d9  amd-gpu-bin-mx51-11.09.01.bin
