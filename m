From: Chris Brandt <chris.brandt@renesas.com>
Date: Tue, 13 Feb 2018 14:54:47 -0500
Subject: [Buildroot] [PATCH 0/2] cramfs: new maintainer, repo and XIP feature
Message-ID: <20180213195449.51516-1-chris.brandt@renesas.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As of linux-4.15, cramfs is maintained again and the source
repository has moved. Additionaly, there is a new XIP option.


Chris Brandt (2):
  cramfs: change to new site location
  cramfs: add xip option

 fs/cramfs/Config.in                         |  19 +-
 fs/cramfs/cramfs.mk                         |   8 +-
 package/cramfs/0001-endian.patch            | 288 ----------------------------
 package/cramfs/0002-cygwin_IO.patch         |  15 --
 package/cramfs/0003-fix-missing-types.patch |  17 --
 package/cramfs/Config.in                    |   2 +-
 package/cramfs/Config.in.host               |   2 +-
 package/cramfs/cramfs.hash                  |   2 +-
 package/cramfs/cramfs.mk                    |   4 +-
 9 files changed, 28 insertions(+), 329 deletions(-)
 delete mode 100644 package/cramfs/0001-endian.patch
 delete mode 100644 package/cramfs/0002-cygwin_IO.patch
 delete mode 100644 package/cramfs/0003-fix-missing-types.patch

-- 
2.16.1
