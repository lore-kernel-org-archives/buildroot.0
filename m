From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Fri, 27 Mar 2020 18:12:00 +0100
Subject: [Buildroot] [PATCH v2 0/3] imx: update Boundary Devices boards
 support
Message-ID: <20200327171203.619849-1-gary.bisson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

As suggested by Thomas[1], updating the readme.txt and using
genimage.sh.

As an FYI, we unfortunately cannot use the genimage.sh as the args are
already used by the imx8-bootloader-prepare.sh.

So we keep using post-image.sh for all nitrogen boards for consistency.

Regards,
Gary

[1] http://lists.busybox.net/pipermail/buildroot/2020-March/278224.html

Gary Bisson (3):
  board/boundarydevices/common/post-image.sh: use genimage.sh
  board/boundarydevices: update readme.txt
  configs/nitrogen8mm: Add new defconfig

 board/boundarydevices/common/post-image.sh | 13 +----
 board/boundarydevices/common/readme.txt    | 12 ++++-
 configs/nitrogen8mm_defconfig              | 56 ++++++++++++++++++++++
 3 files changed, 67 insertions(+), 14 deletions(-)
 create mode 100644 configs/nitrogen8mm_defconfig

-- 
2.25.1
