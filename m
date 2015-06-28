From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 29 Jun 2015 00:25:19 +0200
Subject: [Buildroot] [PATCH 10/11] config/raspberrypi: rename our defconfig
	files
In-Reply-To: <cover.1435529863.git.yann.morin.1998@free.fr>
References: <cover.1435529863.git.yann.morin.1998@free.fr>
Message-ID: <7611f3430ed4ff6661634b8224da7f7c6a29e416.1435529863.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since we no longer have a non-DT defconfig, and we no longer want to
advertise such a possibility (non-DT is being phased out), just rename
our defconfig files.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Floris Bos <bos@je-eigen-domein.nl>
Cc: Pascal de Bruijn <pmjdebruijn@pcode.nl>
---
 configs/{raspberrypi_dt_defconfig => raspberrypi_defconfig}           | 0
 configs/{raspberrypi_plus_dt_defconfig => raspberrypi_plus_defconfig} | 0
 2 files changed, 0 insertions(+), 0 deletions(-)
 rename configs/{raspberrypi_dt_defconfig => raspberrypi_defconfig} (100%)
 rename configs/{raspberrypi_plus_dt_defconfig => raspberrypi_plus_defconfig} (100%)

diff --git a/configs/raspberrypi_dt_defconfig b/configs/raspberrypi_defconfig
similarity index 100%
rename from configs/raspberrypi_dt_defconfig
rename to configs/raspberrypi_defconfig
diff --git a/configs/raspberrypi_plus_dt_defconfig b/configs/raspberrypi_plus_defconfig
similarity index 100%
rename from configs/raspberrypi_plus_dt_defconfig
rename to configs/raspberrypi_plus_defconfig
-- 
1.9.1
