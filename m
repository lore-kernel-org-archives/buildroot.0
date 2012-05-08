From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  8 May 2012 16:39:20 +0200
Subject: [Buildroot] [pull request] Pull request for branch
	for-2012.05/locale-support
Message-ID: <cover.1336487951.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The following changes since commit 025eb2fb908cb3c500e69225832b59b5ffb08cf5:

  dnsmasq: bump to version 2.61 and enhance (2012-05-06 23:18:17 +0200)

are available in the git repository at:

  git://git.free-electrons.com/users/thomas-petazzoni/buildroot.git for-2012.05/locale-support

for you to fetch changes up to 3409d2f9bde0d6aa08fa537d4124db66147d6730:

  Add support to generate locale data (2012-05-08 16:33:04 +0200)

----------------------------------------------------------------
Thomas Petazzoni (2):
      localedef: new package
      Add support to generate locale data

 Makefile                       |   33 +++++++++++++++++++++++++++++++++
 package/localedef/localedef.mk |   20 ++++++++++++++++++++
 toolchain/toolchain-common.in  |   18 ++++++++++++++++++
 toolchain/uClibc/uclibc.mk     |   11 ++++++++++-
 4 files changed, 81 insertions(+), 1 deletion(-)
 create mode 100644 package/localedef/localedef.mk

Thanks,
-- 
Thomas Petazzoni
