From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri,  9 Apr 2010 12:23:06 +0200
Subject: [Buildroot] [pull request] Pull request for branch squashfs3
Message-ID: <cover.1270808538.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

As requested during the review of the fs-cleanup branch, here is a set
of 2 patches that reintroduce the support for squashfs3. To make
things simpler, a separate package has been added.

The options are marked BR2_DEPRECATED.

Thomas

The following changes since commit 0b79c5022d32b15180a18087a0fba5a2f1af5cc7:
  Thomas Petazzoni (1):
        fs/*/Config.in: remove useless configuration comments

are available in the git repository at:

  git://git.busybox.net/~tpetazzoni/git/buildroot squashfs3

Thomas Petazzoni (2):
      squashfs3: new package
      Add version selection for the SquashFS root filesystem

 fs/squashfs/Config.in                              |   19 ++++++++++++
 fs/squashfs/squashfs.mk                            |    4 ++
 package/Config.in                                  |    1 +
 package/squashfs3/Config.in                        |    7 ++++
 .../squashfs3/squashfs-3.4-build-system-fix.patch  |   28 ++++++++++++++++++
 package/squashfs3/squashfs3.mk                     |   30 ++++++++++++++++++++
 6 files changed, 89 insertions(+), 0 deletions(-)
 create mode 100644 package/squashfs3/Config.in
 create mode 100644 package/squashfs3/squashfs-3.4-build-system-fix.patch
 create mode 100644 package/squashfs3/squashfs3.mk

Thanks,
-- 
Thomas Petazzoni
