From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 23 Apr 2012 23:45:07 +0200
Subject: [Buildroot] [pull request] Pull request for branch
	for-2012.05/static-libs
Message-ID: <cover.1335217505.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The following changes since commit f00424cff00bdabd54350eb82deb908676e86a1d:

  uClibc: 0.9.33.1: fix version (soname) number (2012-04-23 09:26:13 +0200)

are available in the git repository at:
  git://git.free-electrons.com/users/thomas-petazzoni/buildroot.git for-2012.05/static-libs

Thomas Petazzoni (1):
      external-toolchain: do not copy shared libraries when BR2_PREFER_STATIC_LIB=y

 toolchain/toolchain-external/ext-tool.mk |   16 +++++++++-------
 1 files changed, 9 insertions(+), 7 deletions(-)

Thanks,
-- 
Thomas Petazzoni
