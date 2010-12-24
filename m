From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 24 Dec 2010 18:07:41 +0100
Subject: [Buildroot] [pull request] Pull request for branch
	for-2011.02/dl-tools
Message-ID: <cover.1293210451.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The following changes since commit c8530262260fee4b475ccca1ae04eb28433fc4eb:
  Thomas Petazzoni (1):
        toolchain: fix again stamp file touch

are available in the git repository at:

  git://git.busybox.net/~tpetazzoni/git/buildroot for-2011.02/dl-tools

Daniel Nystr??m (1):
      package/Makefile.package.in: Added BZR download support

Thomas Petazzoni (1):
      infrastructure: only require download tools when needed

 package/Makefile.package.in            |   53 ++++++++++++++++++++++++--------
 toolchain/dependencies/dependencies.mk |    7 ++++
 toolchain/dependencies/dependencies.sh |    2 +-
 3 files changed, 48 insertions(+), 14 deletions(-)

Thanks,
-- 
Thomas Petazzoni
