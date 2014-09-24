From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Wed, 24 Sep 2014 14:03:11 +0200
Subject: [Buildroot] [PATCH 0/2] i.MX6 SABRESD improvements
Message-ID: <1411560193-9697-1-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

here are 2 little improvements to the i.MX6 SABRESD board support in Buildroot,
both suggested by Thomas Petazzoni in
http://lists.busybox.net/pipermail/buildroot/2014-September/106704.html.

Nothing huge, just see the changelog below.

Luca Ceresoli (2):
  freescale/imx6-sabresd: use global patch dir
  freescale/imx6-sabresd: use up-to-date mainline Linux

 ...ommon-boot-Linux-to-init-in-mfgtools-mode.patch | 36 ++++++++++++++++++++++
 ...ommon-boot-Linux-to-init-in-mfgtools-mode.patch | 36 ----------------------
 configs/freescale_imx6dlsabresd_defconfig          | 10 +++---
 configs/freescale_imx6qsabresd_defconfig           | 10 +++---
 4 files changed, 46 insertions(+), 46 deletions(-)
 create mode 100644 board/freescale/imx6sabresd/patches/uboot/uboot-0001-mx6qsabre_common-boot-Linux-to-init-in-mfgtools-mode.patch
 delete mode 100644 board/freescale/imx6sabresd/uboot-0001-mx6qsabre_common-boot-Linux-to-init-in-mfgtools-mode.patch

-- 
Luca

-- 
1.9.1
