From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 28 May 2019 10:29:36 +0200
Subject: [Buildroot] [PATCH next 3/4] configs/csky_gx6605s: use the C-SKY
 external toolchain package
In-Reply-To: <20190528082938.5997-1-thomas.petazzoni@bootlin.com>
References: <20190528082938.5997-1-thomas.petazzoni@bootlin.com>
Message-ID: <20190528082938.5997-4-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/csky_gx6605s_defconfig | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/configs/csky_gx6605s_defconfig b/configs/csky_gx6605s_defconfig
index d0a2aadc6d..691f970844 100644
--- a/configs/csky_gx6605s_defconfig
+++ b/configs/csky_gx6605s_defconfig
@@ -1,12 +1,7 @@
 BR2_csky=y
 BR2_GLOBAL_PATCH_DIR="board/csky/gx6605s/patches"
-BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="https://github.com/c-sky/tools/raw/master/csky-linux-tools-x86_64-glibc-linux-4.9.56-20180128.tar.gz"
-BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX="csky-linux"
-BR2_TOOLCHAIN_EXTERNAL_GCC_6=y
-BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_9=y
-BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
-BR2_TOOLCHAIN_EXTERNAL_CXX=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_CSKY=y
 BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
 BR2_LINUX_KERNEL=y
-- 
2.21.0
