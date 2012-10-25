From: Alexandre Belloni <alexandre.belloni@piout.net>
Date: Fri, 26 Oct 2012 00:15:30 +0200
Subject: [Buildroot] [PATCH 0/3] Update AT91SAM926* patches and configs
Message-ID: <1351203333-26588-1-git-send-email-alexandre.belloni@piout.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As u-boot took the patch in the mainline, I updated the at91bootstrap and
u-boot patches accordingly.

Also, update defconfigs to use latest u-boot.

Tested on at91sam9261ek with u-boot 2011.12, 2012.04.1 and 2012.10.

Alexandre Belloni (3):
  at91bootstrap: update patch for latest u-boot
  u-boot: update at91 patches to match mainline
  at91sam92*: update defconfigs to use latest u-boot

 .../at91bootstrap-1.16-u-boot-relocation-fix.patch |  127 ++++++------
 ...011.12-change-kernel-address-in-dataflash.patch |  210 +++++++++++---------
 ...012.04-change-kernel-address-in-dataflash.patch |  210 +++++++++++---------
 configs/at91sam9260dfc_defconfig                   |    6 -
 configs/at91sam9261ek_defconfig                    |    6 -
 configs/at91sam9263ek_defconfig                    |    6 -
 6 files changed, 280 insertions(+), 285 deletions(-)

-- 
1.7.9.5
