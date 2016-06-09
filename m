From: Joao Pinto <Joao.Pinto@synopsys.com>
Date: Thu,  9 Jun 2016 11:40:29 +0100
Subject: [Buildroot] [PATCH 0/2] juno: add support for Juno r2 and point to
	v4.6 mainline
Message-ID: <cover.1465468621.git.jpinto@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add support for Juno r2 and change the kernel version to v4.6 mainline.

Joao Pinto (2):
  juno: Adding support for Juno r2
  configs/arm_juno: Point to 4.6 mainline kernel

 board/arm/juno/readme.txt  | 17 ++++++++++++++++-
 configs/arm_juno_defconfig |  9 ++++-----
 2 files changed, 20 insertions(+), 6 deletions(-)

-- 
1.8.1.5
