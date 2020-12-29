From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Tue, 29 Dec 2020 22:40:50 +0100
Subject: [Buildroot] [PATCH 0/2] configs/nitrogen*: update kernel & uboot
Message-ID: <20201229214053.1045556-1-gary.bisson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Although we should have a new 5.4.x_2.3.0 linux branch ready soon I
pushed those updates as they were used to test the Graphics update
series that will come next.

Regards,
Gary


Gary Bisson (2):
  configs/nitrogen*: update kernel to 5.4.x_2.2.0
  configs/nitrogen*: bump u-boot to version 2020.10

 configs/nitrogen6sx_defconfig |  8 ++++----
 configs/nitrogen6x_defconfig  |  8 ++++----
 configs/nitrogen7_defconfig   |  8 ++++----
 configs/nitrogen8m_defconfig  | 12 ++++++------
 configs/nitrogen8mm_defconfig | 12 ++++++------
 configs/nitrogen8mn_defconfig | 12 ++++++------
 6 files changed, 30 insertions(+), 30 deletions(-)

-- 
2.29.2
