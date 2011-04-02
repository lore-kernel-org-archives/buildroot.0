From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  2 Apr 2011 18:53:31 +0200
Subject: [Buildroot] [pull request] Pull request for branch
	for-2011.05/dev-handling
Message-ID: <cover.1301763205.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The following changes since commit 0a70aa0cc5d0980e72677869d9d87e0e4e35e483:

  webkit: bump to version 1.2.7 (2011-03-31 15:23:13 +0200)

are available in the git repository at:
  git://git.busybox.net/~tpetazzoni/git/buildroot for-2011.05/dev-handling

Thomas Petazzoni (2):
      Simplify udev startup script
      Allow several device tables and split in two parts our device table

Yegor Yefremov (1):
      Create menu entry to select device creation method

 fs/Config.in                        |   41 +++++++-
 fs/common.mk                        |   14 ++-
 linux/linux.mk                      |    7 ++
 package/busybox/S10mdev             |   22 ++++
 package/busybox/busybox.mk          |   15 +++
 package/makedevs/README             |   35 +++++++
 package/udev/S10udev                |   34 -------
 target/generic/device_table.txt     |  186 ++--------------------------------
 target/generic/device_table_dev.txt |  142 ++++++++++++++++++++++++++
 9 files changed, 276 insertions(+), 220 deletions(-)
 create mode 100644 package/busybox/S10mdev
 create mode 100644 package/makedevs/README
 create mode 100644 target/generic/device_table_dev.txt

Thanks,
-- 
Thomas Petazzoni
