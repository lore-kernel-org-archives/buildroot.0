From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon,  3 Dec 2018 21:53:03 +0100
Subject: [Buildroot] [PATCH v3 0/2] Minor fs/common.mk improvements
Message-ID: <20181203205306.27361-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

This small patch series is a new iteration of the few remaining
patches from Yann's series "[PATCH 0/6 v2] fs: fix and better handle
capabilities".

In Yann series, patches 1 to 3 have already been applied.

Patch 4 was not liked by Arnout, with some good explanation.

In this patch series, I propose:

 - An additional patch to rename FULL_DEVICE_TABLE to
   ROOTFS_FULL_DEVICES_TABLE to be consistent with
   ROOTFS_FULL_USERS_TABLE.

 - Yann's original PATCH 5/6, but reworked to apply without what was
   his PATCH 4/6.

PATCH 6/6 from Yann series is not integrated, because I believe it is
not correct (I will reply to it separately).

Thanks,

Thomas

Thomas Petazzoni (1):
  fs/common.mk: rename FULL_DEVICE_TABLE to ROOTFS_FULL_DEVICES_TABLE

Yann E. MORIN (1):
  fs/common.mk: allow user provided permissions to override packages
    permissions

 fs/common.mk | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

-- 
2.19.2
