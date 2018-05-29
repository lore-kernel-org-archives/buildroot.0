From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Tue, 29 May 2018 23:22:15 +0200
Subject: [Buildroot] [PATCH v3 0/4] Linux custom logo
Message-ID: <1527628939-7389-1-git-send-email-angelo@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This series is only a resend cause some patches went missing meanwhile
patchwork was buggy.

Angelo Compagnucci (4):
  package/imagemagick: add host package
  linux: add custom linux logo
  docs/images: adding default buildroot linux logo
  configs: add linux boot logo to raspberrypi3 defconfig

 configs/raspberrypi3_defconfig             |   1 +
 docs/website/images/logo_linux_clut224.png | Bin 0 -> 6825 bytes
 linux/Config.in                            |   8 ++++++++
 linux/linux.mk                             |  15 +++++++++++++++
 package/imagemagick/imagemagick.mk         |  11 +++++++++++
 5 files changed, 35 insertions(+)
 create mode 100644 docs/website/images/logo_linux_clut224.png

-- 
2.7.4
