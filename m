From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 29 Sep 2010 00:15:09 +0200
Subject: [Buildroot] [pull request] Pull request for branch
	for-2010.11/kernel-image-formats
Message-ID: <cover.1285712084.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Two relatively minor improvements to the kernel build infrastructure.

Thomas

The following changes since commit 3e5e39a8a25a4a085afe08bdcf46933c8d569ed7:
  Peter Korsgaard (1):
        barebox/u-boot/linux: don't error out on missing config when make source

are available in the git repository at:

  git://git.busybox.net/~tpetazzoni/git/buildroot for-2010.11/kernel-image-formats

Thomas Petazzoni (2):
      linux: restrict output image formats to the appropriate arches
      linux: fix uImage location on AVR32

 linux/Config.in |   10 ++++++----
 linux/linux.mk  |    6 +++++-
 2 files changed, 11 insertions(+), 5 deletions(-)

Thanks,
-- 
Thomas Petazzoni
