From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Thu, 16 Jul 2020 16:29:21 +0200
Subject: [Buildroot] [PATCH 0/2] configs: update Boundary Devices boards
 support
Message-ID: <20200716142923.698157-1-gary.bisson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

This series updates our board support to have:
- Linux kernel 5.4 (based on 2.1.0 release from NXP)
- Latest U-Boot revision (no version change)

Let me know if you have any questions.

Regards,
Gary

Gary Bisson (2):
  configs/nitrogen*: bump kernel version to 5.4.x_2.1.0
  configs/nitrogen*: bump u-boot revision

 configs/nitrogen6sx_defconfig | 10 +++++-----
 configs/nitrogen6x_defconfig  | 10 +++++-----
 configs/nitrogen7_defconfig   | 10 +++++-----
 configs/nitrogen8m_defconfig  | 10 +++++-----
 configs/nitrogen8mm_defconfig | 10 +++++-----
 configs/nitrogen8mn_defconfig | 10 +++++-----
 6 files changed, 30 insertions(+), 30 deletions(-)

-- 
2.27.0
