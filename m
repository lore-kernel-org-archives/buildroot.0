From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon,  7 May 2012 17:08:56 +0200
Subject: [Buildroot] [pull request] Pull request for branch
	for-2012.05/linaro
Message-ID: <cover.1336403333.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The following changes since commit 025eb2fb908cb3c500e69225832b59b5ffb08cf5:

  dnsmasq: bump to version 2.61 and enhance (2012-05-06 23:18:17 +0200)

are available in the git repository at:

  git://git.free-electrons.com/users/thomas-petazzoni/buildroot.git for-2012.05/linaro

for you to fetch changes up to 057c729c2438107b426576121bcf83f792734a6f:

  external-toolchain: add support for Linaro 2012.04 (2012-05-07 17:08:37 +0200)

----------------------------------------------------------------
Thomas Petazzoni (2):
      external-toolchain: add support for recent Linaro toolchains
      external-toolchain: add support for Linaro 2012.04

 toolchain/helpers.mk                     |   73 ++++++++++++++++++++----------
 toolchain/toolchain-external/Config.in   |   15 ++++++
 toolchain/toolchain-external/ext-tool.mk |   26 +++++++++--
 3 files changed, 87 insertions(+), 27 deletions(-)

Thanks,
-- 
Thomas Petazzoni
