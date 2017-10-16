From: Chris Packham <judge.packham@gmail.com>
Date: Tue, 17 Oct 2017 10:59:01 +1300
Subject: [Buildroot] [RFC PATCH 0/3] squashfs support for zstd
Message-ID: <20171016215904.3380-1-judge.packham@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Support for zstd as a compression algorithm for squashfs will be coming
soon to a kernel near you. This series adds support for generating images
compressed with zstd.

Chris Packham (3):
  zstd: install to staging directory
  zstd: build for host
  squashfs: add support for zstd

 fs/squashfs/Config.in                              |   3 +
 fs/squashfs/squashfs.mk                            |   2 +
 .../0006-squashfs-tools-Add-zstd-support.patch     | 420 +++++++++++++++++++++
 package/squashfs/Config.in                         |   5 +
 package/squashfs/squashfs.mk                       |  12 +-
 package/zstd/zstd.mk                               |  27 ++
 6 files changed, 467 insertions(+), 2 deletions(-)
 create mode 100644 package/squashfs/0006-squashfs-tools-Add-zstd-support.patch

-- 
2.14.2
