From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 19 Feb 2010 00:36:03 +0100
Subject: [Buildroot] [pull request] Pull request for branch misc-fixes4
Message-ID: <cover.1266536162.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The following changes since commit ac8329cff0a969bec23be7871bfaf394e369be7c:
  Peter Korsgaard (1):
        Merge branch 'misc-fixes3' of git://git.busybox.net/~tpetazzoni/git/buildroot

are available in the git repository at:

  git://git.busybox.net/~tpetazzoni/git/buildroot misc-fixes4

Thomas Petazzoni (3):
      Add libxpm as a dependency of ace_of_penguins
      Fix build failure of rubix
      xboard: remove package

 package/games/Config.in                            |    1 -
 package/games/ace_of_penguins/Config.in            |    1 +
 package/games/ace_of_penguins/ace_of_penguins.mk   |    2 +-
 .../rubix-1.0.5-dont-use-legacy-functions.patch    |   18 ++++++
 package/games/xboard/Config.in                     |    8 ---
 package/games/xboard/xboard-4.2.7-installer.patch  |   55 --------------------
 package/games/xboard/xboard.mk                     |   16 ------
 7 files changed, 20 insertions(+), 81 deletions(-)
 create mode 100644 package/games/rubix/rubix-1.0.5-dont-use-legacy-functions.patch
 delete mode 100644 package/games/xboard/Config.in
 delete mode 100644 package/games/xboard/xboard-4.2.7-installer.patch
 delete mode 100644 package/games/xboard/xboard.mk

Thanks,
-- 
Thomas Petazzoni
