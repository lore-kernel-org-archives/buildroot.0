From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  2 Apr 2011 18:52:50 +0200
Subject: [Buildroot] [pull request] Pull request for branch
	for-2011.05/more-qt-fixes
Message-ID: <cover.1301763163.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The following changes since commit 0a70aa0cc5d0980e72677869d9d87e0e4e35e483:

  webkit: bump to version 1.2.7 (2011-03-31 15:23:13 +0200)

are available in the git repository at:
  git://git.busybox.net/~tpetazzoni/git/buildroot for-2011.05/more-qt-fixes

Thomas Petazzoni (2):
      qt: fix plugin installation and change plugin path
      qt: speed up qmake build

 package/qt/qt-4.7.2-configure.patch |   48 +++++++++++++++++++++++++++++++++++
 package/qt/qt.mk                    |   15 +++-------
 2 files changed, 53 insertions(+), 10 deletions(-)
 create mode 100644 package/qt/qt-4.7.2-configure.patch

Thanks,
-- 
Thomas Petazzoni
