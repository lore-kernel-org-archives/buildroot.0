From: Max Filippov <jcmvbkbc@gmail.com>
Date: Sun, 25 Dec 2016 05:50:36 -0800
Subject: [Buildroot] [PATCH 0/2] add custom xtensa core support to linux and
	U-Boot
Message-ID: <1482673838-24567-1-git-send-email-jcmvbkbc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

this series adds xtensa configuration overlay extraction to the prepatch
step of linux and U-Boot build. That allows building linux and U-Boot for
custom xtensa cores as a part of a buildroot build.

Max Filippov (2):
  linux: add xtensa overlay unpacking to prepatch step
  uboot: add xtensa overlay unpacking to prepatch step

 boot/uboot/uboot.mk | 10 ++++++++++
 linux/linux.mk      | 10 ++++++++++
 2 files changed, 20 insertions(+)

-- 
2.1.4
