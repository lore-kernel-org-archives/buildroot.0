From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Thu, 26 Mar 2020 15:44:33 +0100
Subject: [Buildroot] [PATCH 0/3] imx: update Boundary Devices boards support
Message-ID: <20200326144436.529906-1-gary.bisson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I'm back at Boundary Devices and decided to revive its i.MX support in
Buildroot. So here is a first series to update BD support:
- Updating U-Boot / bootscript
- Adding 8MMini device support

Let me know if you have any questions.

Regards,
Gary

Gary Bisson (3):
  configs/nitrogen*: bump u-boot to 2018.07
  board/boundarydevices: update boot scripts
  configs/nitrogen8mm: Add new defconfig

 board/boundarydevices/common/boot.cmd         | 24 ++++++++++++-------
 board/boundarydevices/common/upgrade.cmd      | 20 ++++++++++++----
 configs/nitrogen6sx_defconfig                 |  4 ++--
 configs/nitrogen6x_defconfig                  |  4 ++--
 configs/nitrogen7_defconfig                   |  4 ++--
 configs/nitrogen8m_defconfig                  |  8 +++----
 ...ogen8m_defconfig => nitrogen8mm_defconfig} | 20 ++++++++--------
 7 files changed, 50 insertions(+), 34 deletions(-)
 copy configs/{nitrogen8m_defconfig => nitrogen8mm_defconfig} (67%)

-- 
2.25.1
