From: Cengiz Can <cengiz@kernel.wtf>
Date: Thu, 08 Aug 2019 17:01:55 +0300
Subject: [Buildroot] [PATCH v6 01/10] package/python3-mako: new package
In-Reply-To: <20190804185417.6562-1-bernd.kuhls@t-online.de>
References: <20190804185417.6562-1-bernd.kuhls@t-online.de>
Message-ID: <a7b184f38eee5cfd0f3b769b8f897075@kernel.wtf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Tested-By: Cengiz Can <cengiz@kernel.wtf>

Applied to:
   68bf8420c1e5ebd0eedabf0098ad2b5c4d4fa840

Platform:
   IMX6 Quad Sabre SD derivative (Poslab SavageBoard)

CPU:
   ARMv7 Processor [412fc09a] revision 10 (ARMv7), cr=10c5387d

GPU:
   etnaviv-gpu 130000.gpu: model: GC2000, revision: 5108
   etnaviv-gpu 134000.gpu: model: GC320, revision: 5007
   etnaviv-gpu 2204000.gpu: model: GC355, revision: 1215

Buildroot base configuration:
   imx6-sabresd_qt5_defconfig

Changed/Added Buildroot configuration parameters:
  BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_KMSRO=y

Kernel version:
   v4.19.16

Kernel base configuration:
   imx_v6_v7_defconfig

Some of the `dmesg` lines:
   etnaviv-gpu 2204000.gpu: Ignoring GPU with VG and FE2.0
   [drm] Initialized etnaviv 1.2.0 20151214 for etnaviv on minor 0
   ..
   [drm] Initialized imx-drm 1.0.0 20120507 for display-subsystem on 
minor 1

glmark2-es2-drm score:
   51

Huge thanks to all involved!

Cengiz Can
@cengiz_io
