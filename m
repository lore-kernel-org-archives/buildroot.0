From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 May 2010 00:57:33 +0200
Subject: [Buildroot] [pull request] Pull request for branch
	dependencies-fixes
Message-ID: <cover.1274482644.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The following changes since commit 51861e1ba19a036625643a56382a175e8388529f:
  Peter Korsgaard (1):
        sshfs: needs largefile support (because of fuse)

are available in the git repository at:

  git://git.busybox.net/~tpetazzoni/git/buildroot dependencies-fixes

Thomas Petazzoni (2):
      dependencies: fix tests on LD_LIBRARY_PATH
      dependencies: check that . is not in the PATH

 toolchain/dependencies/dependencies.sh |   23 +++++++++++++++++++----
 1 files changed, 19 insertions(+), 4 deletions(-)

Thanks,
-- 
Thomas Petazzoni
