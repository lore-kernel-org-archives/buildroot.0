From: =?gb18030?B?hKK80rWT?= <liu.jialu@qq.com>
Date: Thu, 20 Jun 2019 17:56:30 +0800
Subject: [Buildroot] csky_gx6605s_defconfig add "BR2_TOOLCHAIN_EXTERNAL=y"
Message-ID: <tencent_2664A2093675DB6268415CDB@qq.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

hi?
           buildroot source: git clone git://git.buildroot.net/buildroot
          

all BR2_TOOLCHAIN_EXTERNAL_* items depend on BR2_TOOLCHAIN_EXTERNAL=y


diff --git a/configs/csky_gx6605s_defconfig b/configs/csky_gx6605s_defconfig
index d0a2aad..22e9e0c 100644
--- a/configs/csky_gx6605s_defconfig
+++ b/configs/csky_gx6605s_defconfig
@@ -1,5 +1,6 @@
 BR2_csky=y
 BR2_GLOBAL_PATCH_DIR="board/csky/gx6605s/patches"
+BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
 BR2_TOOLCHAIN_EXTERNAL_URL="https://github.com/c-sky/tools/raw/master/csky-linux-tools-x86_64-glibc-linux-4.9.56-20180128.tar.gz"
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX="csky-linux"
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190620/8ae9a883/attachment.html>
