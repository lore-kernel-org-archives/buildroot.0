From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Thu,  6 Nov 2014 19:18:23 +0300
Subject: [Buildroot] [PATCH 0/2] Add AXS10x boards
Message-ID: <1415290705-994-1-git-send-email-abrodkin@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This series introduces 2 boards (AXS101 and AXS103) from Synopsys
that house ARC cores (ARC 700 and ARC HS38 correspondingly).

Alexey Brodkin (2):
  board: add support for ARC AXS101 Software Development Platform
  board: add support for ARC AXS103 Software Development Platform

 configs/axs101_defconfig | 28 ++++++++++++++++++++++++++++
 configs/axs103_defconfig |  9 +++++++++
 2 files changed, 37 insertions(+)
 create mode 100644 configs/axs101_defconfig
 create mode 100644 configs/axs103_defconfig

-- 
1.9.3
