From: Maxime Chevallier <chevalliersebmax@gmail.com>
Date: Mon, 25 Sep 2017 00:05:32 +0200
Subject: [Buildroot]  [PATCH 0/1] [RFC] Add support for espressobin
Message-ID: <1506290733-6042-1-git-send-email-chevalliersebmax@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi everyone,

The following patch adds basic support for the Globalscale
Espressobin board, based on Marvell Armada 3720.

This is all based on mainline linux and toolchains, and does
not includes bootloader generation for the moment.

Lots of things can be added to generate more complete images,
with full hardware support. That would require either using a
custom device-tree, or a more featured in-tree one when it is
available on linux mainline.

Please do not hesitate to comment on this patch, especially on
the naming of the different files.

I added myself in the DEVELOPERS file, I'm not quite sure this
if this is a correct thing to do.

Maxime

Maxime Chevallier (1):
  mvebu_espressobin-88f3720 : Add support for espressobin

 DEVELOPERS                                  |  4 ++
 board/globalscale/espressobin/genimage.cfg  | 11 +++++
 board/globalscale/espressobin/readme.txt    | 76 +++++++++++++++++++++++++++++
 configs/mvebu_espressobin-88f3720_defconfig | 29 +++++++++++
 4 files changed, 120 insertions(+)
 create mode 100644 board/globalscale/espressobin/genimage.cfg
 create mode 100644 board/globalscale/espressobin/readme.txt
 create mode 100644 configs/mvebu_espressobin-88f3720_defconfig

-- 
2.7.4
