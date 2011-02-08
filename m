From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  8 Feb 2011 08:45:15 +0100
Subject: [Buildroot] [pull request] Pull request for branch cmake-upgrade
Message-ID: <cover.1297151107.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The following changes since commit c761eafb021c2beaf52b2d1a383433deac5fc2b4:
  Thomas Petazzoni (1):
        openssl: pass LDFLAGS to fix incorrect link

are available in the git repository at:

  git://git.busybox.net/~tpetazzoni/git/buildroot cmake-upgrade

Thomas Petazzoni (2):
      cmake: bump to 2.8.3
      cmake: add patch to fix FindQt4 issue

 package/cmake/cmake-2.8.3-qt4-fix.patch |  257 +++++++++++++++++++++++++++++++
 package/cmake/cmake.mk                  |    2 +-
 2 files changed, 258 insertions(+), 1 deletions(-)
 create mode 100644 package/cmake/cmake-2.8.3-qt4-fix.patch

Thanks,
-- 
Thomas Petazzoni
