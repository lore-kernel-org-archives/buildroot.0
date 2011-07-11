From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 11 Jul 2011 22:17:15 +0200
Subject: [Buildroot] [pull request] Pull request for branch valgrind
Message-ID: <cover.1310415416.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The following changes since commit bd76bc5f80b963570e8eda92efc961e683264402:

  CHANGES: update with recent changes (2011-07-11 07:44:24 +0200)

are available in the git repository at:
  http://free-electrons.com/~thomas/buildroot.git valgrind

Thomas Petazzoni (1):
      valgrind: bump to 3.6.1 and add support for ARMv7

 package/valgrind/Config.in                         |    3 +-
 package/valgrind/valgrind-3.6.1-largefile.patch    |   56 ++++++
 ...rind.patch => valgrind-3.6.1-more-ioctls.patch} |  198 ++++++++++----------
 package/valgrind/valgrind-largefile.patch          |   27 ---
 package/valgrind/valgrind.mk                       |   99 ++--------
 package/valgrind/valgrind.sh                       |   10 -
 6 files changed, 176 insertions(+), 217 deletions(-)
 create mode 100644 package/valgrind/valgrind-3.6.1-largefile.patch
 rename package/valgrind/{valgrind.patch => valgrind-3.6.1-more-ioctls.patch} (83%)
 delete mode 100644 package/valgrind/valgrind-largefile.patch
 delete mode 100755 package/valgrind/valgrind.sh

Thanks,
-- 
Thomas Petazzoni
