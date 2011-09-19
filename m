From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 19 Sep 2011 22:10:51 +0200
Subject: [Buildroot] [pull request] Pull request for branch
	for-2011.11/xeno-rtai-fixes
Message-ID: <cover.1316463052.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The following changes since commit dcb43a0eb0c09ffb84c6c7b4c169a2874cb24cc9:

  barebox: patch-kernel.sh is no more (2011-09-19 10:13:37 +0200)

are available in the git repository at:
  http://free-electrons.com/~thomas/buildroot.git for-2011.11/xeno-rtai-fixes

Thomas Petazzoni (5):
      package: add a PRE_PATCH_HOOKS hook point
      rtai, xenomai: use the pre patch hook point
      rtai: fix path to apply-patches
      rtai: Install modules in /lib/modules/<version>/rtai
      xenomai: install in /usr

 linux/linux-ext-rtai.mk     |    6 ++--
 linux/linux-ext-xenomai.mk  |    2 +-
 package/Makefile.package.in |    2 +
 package/rtai/rtai.mk        |    2 +-
 package/xenomai/xenomai.mk  |   54 ++++++++----------------------------------
 5 files changed, 18 insertions(+), 48 deletions(-)

Thanks,
-- 
Thomas Petazzoni
