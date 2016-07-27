From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Wed, 27 Jul 2016 15:27:05 +0200
Subject: [Buildroot] [PATCH 0/2] configs: update Boundary Devices platforms
Message-ID: <1469626027-28568-1-git-send-email-gary.bisson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

This series udpates both the kernel and U-Boot revisions for all
our platforms:
- kernel is now 4.1.15
- U-Boot is now v2016.03

Note that I've had to switch Github archive adress for some reason.
Using the old "tarball" address failed on the latest revision, now
using the same URL as when you click on "Download" on the Github
page.

I know most configurations are cloning the full repo but I still
find downloading the archive way faster.

Regards,
Gary

Gary Bisson (2):
  configs: nitrogen*: bump kernel version to 4.1.15_1.0.0_ga
  configs: nitrogen*: bump u-boot version to v2016.03

 configs/nitrogen6sx_defconfig | 12 ++++++------
 configs/nitrogen6x_defconfig  | 12 ++++++------
 configs/nitrogen7_defconfig   | 11 ++++++-----
 3 files changed, 18 insertions(+), 17 deletions(-)

-- 
2.8.1
