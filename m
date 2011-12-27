From: Alexandre Belloni <abelloni@adeneo-embedded.com>
Date: Tue, 27 Dec 2011 18:23:49 +0100
Subject: [Buildroot] [PATCH] Add defconfigs for LPC3250 boards
Message-ID: <1325006629.2527.1.camel@emblysd024.adetel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

the following patch will add defconfigs for the three LPC3250
development boards supported by the LPClinux.com community. For now,
they are suggesting using LTIB to build the rootfs image but the
packages are quite outdated.

I have successfully used buildroot to buils my u-boot, kernel and rootfs
images for a custom board based on the ea3250 design.

I chose to use the 2.6.34 repository as the 2.6.39.2 doesn't seem to be
fully functionnal (see
http://lpclinux.com/Forums/LPC32xxLinuxPatch0046).

I also fixed the gcc version to 4.3.x as using a later version seems to
break the network drivers.


Alexandre Belloni (1):
  Add various LPC3250 development board defconfigs

 configs/ea3250_defconfig  |   37 +++++++++++++++++++++++++++++++++++++
 configs/fdi3250_defconfig |   37 +++++++++++++++++++++++++++++++++++++
 configs/phy3250_defconfig |   37 +++++++++++++++++++++++++++++++++++++
 3 files changed, 111 insertions(+), 0 deletions(-)
 create mode 100644 configs/ea3250_defconfig
 create mode 100644 configs/fdi3250_defconfig
 create mode 100644 configs/phy3250_defconfig

-- 
Alexandre Belloni

Adeneo Embedded
Adetel Group

2, ch. du Ruisseau - 69134 Ecully, France

www.adeneo-embedded.com
 
