From: Alexandre Belloni <alexandre.belloni@piout.net>
Date: Tue,  3 Jan 2012 02:29:31 +0100
Subject: [Buildroot] [PATCH] upgrade at91sam926* configs
Message-ID: <1325554172-32609-1-git-send-email-alexandre.belloni@piout.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The u-boot patch is under discussion upstream but it is good enough for now to
get something working.

I compiled every platforms but only tested on a at91sam9261ek.


Alexandre Belloni (1):
  configs: at91sam926* use latest u-boot and mainline linux

 .../at91bootstrap-1.16-u-boot-relocation-fix.patch |  274 ++++++++++++++++++++
 ...011.12-change-kernel-address-in-dataflash.patch |   98 +++++++
 configs/at91sam9260dfc_defconfig                   |   10 +-
 configs/at91sam9261ek_defconfig                    |   11 +-
 configs/at91sam9263ek_defconfig                    |   11 +-
 5 files changed, 384 insertions(+), 20 deletions(-)
 create mode 100644 boot/at91bootstrap/at91bootstrap-1.16-u-boot-relocation-fix.patch
 create mode 100644 boot/uboot/uboot-v2011.12-change-kernel-address-in-dataflash.patch

-- 
1.7.5.4
