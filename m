From: Dagg Stompler <daggs@gmx.com>
Date: Sat,  9 Jul 2016 11:03:35 +0300
Subject: [Buildroot] [PATCH 2/2] freescale-imx: add missing hash
In-Reply-To: <20160709080335.30055-1-daggs@gmx.com>
References: <20160709080335.30055-1-daggs@gmx.com>
Message-ID: <20160709080335.30055-2-daggs@gmx.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

add hash for amd-gpu-bin-mx51-11.09.01.bin

Signed-off-by: Dagg Stompler <daggs@gmx.com>
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
-- 
2.9.0
