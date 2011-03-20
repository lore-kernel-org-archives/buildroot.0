From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Mar 2011 15:19:11 +0100
Subject: [Buildroot] [pull request] Pull request for branch
	for-2011.05/qt-migration
Message-ID: <cover.1300630739.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The following changes since commit 0a064b48c9d1044b05aee65272f5af7f28879473:
  Gustavo Zacarias (1):
        gst-ffmpeg: bump to version 0.10.11

are available in the git repository at:

  git://git.busybox.net/~tpetazzoni/git/buildroot for-2011.05/qt-migration

Thomas Petazzoni (1):
      qt: convert to the GENTARGETS infrastructure

 package/qt/Config.in |   35 ++--
 package/qt/qt.mk     |  623 +++++++++++++++++++++++---------------------------
 2 files changed, 302 insertions(+), 356 deletions(-)

Thanks,
-- 
Thomas Petazzoni
