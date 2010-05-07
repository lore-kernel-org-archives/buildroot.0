From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri,  7 May 2010 21:32:24 +0200
Subject: [Buildroot] [pull request] Pull request for branch squashfs-fixes
Message-ID: <cover.1273260740.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The following changes since commit ea0695ff5edff392603a77b9299833fbb399e429:
  Luca Ceresoli (1):
        customize: fix copy paths

are available in the git repository at:

  git://git.busybox.net/~tpetazzoni/git/buildroot squashfs-fixes

Thomas Petazzoni (2):
      squashfs: fix build when zlib isn't available on the host
      squashfs3: fix build when zlib isn't available on the host

 package/squashfs/squashfs.mk                       |    2 +-
 ....patch => squashfs3-3.4-build-system-fix.patch} |   15 ++++++++++++---
 package/squashfs3/squashfs3.mk                     |    2 +-
 3 files changed, 14 insertions(+), 5 deletions(-)
 rename package/squashfs3/{squashfs-3.4-build-system-fix.patch => squashfs3-3.4-build-system-fix.patch} (66%)

Thanks,
-- 
Thomas Petazzoni
