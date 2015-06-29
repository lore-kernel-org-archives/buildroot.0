From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 30 Jun 2015 00:07:45 +0200
Subject: [Buildroot] [PATCH 5/6 v2] config/raspberrypi: rename our non-DT
	defconfig file
In-Reply-To: <cover.1435615426.git.yann.morin.1998@free.fr>
References: <cover.1435615426.git.yann.morin.1998@free.fr>
Message-ID: <756b7274bebd602204a45dee1899a5fccc814b65.1435615426.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since we no longer have a non-DT defconfig, and we no longer want to
advertise such a possibility (non-DT is being phased out), just rename
the DT-enabled defconfig file.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Floris Bos <bos@je-eigen-domein.nl>
Cc: Pascal de Bruijn <pmjdebruijn@pcode.nl>
---
 configs/{raspberrypi_dt_defconfig => raspberrypi_defconfig} | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename configs/{raspberrypi_dt_defconfig => raspberrypi_defconfig} (100%)

diff --git a/configs/raspberrypi_dt_defconfig b/configs/raspberrypi_defconfig
similarity index 100%
rename from configs/raspberrypi_dt_defconfig
rename to configs/raspberrypi_defconfig
-- 
1.9.1
