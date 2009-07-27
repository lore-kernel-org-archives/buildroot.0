From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Jul 2009 15:07:14 +0200
Subject: [Buildroot] [pull request] Pull request for branch qt
Message-ID: <cover.1248700034.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The following changes since commit 660952565ed0c76b4a2e345bb79fd553a4f53d77:
  Thomas Petazzoni (1):
        Update CHANGES with recent improvements

are available in the git repository at:

  git://git.busybox.net/~tpetazzoni/git/buildroot qt

Thomas Petazzoni (4):
      qt: rename qtopia4 to qt
      qt: put the Qt options into a submenu
      qt: fix build with external toolchain
      qt: the GUI module requires the network module to work properly

 package/Config.in                                  |    2 +-
 package/qt/Config.gfx.in                           |   19 +
 package/{qtopia4 => qt}/Config.in                  |  167 +++---
 package/qt/Config.mouse.in                         |   24 +
 package/{qtopia4 => qt}/Config.sql.in              |   18 +-
 .../qt-4.5.2-fix-qt-zlib-build.patch}              |    0
 package/qt/qt.mk                                   |  583 ++++++++++++++++++++
 package/qtopia4/Config.gfx.in                      |   19 -
 package/qtopia4/Config.mouse.in                    |   24 -
 package/qtopia4/qtopia4.mk                         |  582 -------------------
 10 files changed, 720 insertions(+), 718 deletions(-)
 create mode 100644 package/qt/Config.gfx.in
 rename package/{qtopia4 => qt}/Config.in (62%)
 create mode 100644 package/qt/Config.mouse.in
 rename package/{qtopia4 => qt}/Config.sql.in (60%)
 rename package/{qtopia4/qtopia-4.5.2-fix-qt-zlib-build.patch => qt/qt-4.5.2-fix-qt-zlib-build.patch} (100%)
 create mode 100644 package/qt/qt.mk
 delete mode 100644 package/qtopia4/Config.gfx.in
 delete mode 100644 package/qtopia4/Config.mouse.in
 delete mode 100644 package/qtopia4/qtopia4.mk

Thanks,
-- 
Thomas Petazzoni
