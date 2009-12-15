From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Dec 2009 12:08:08 +0100
Subject: [Buildroot] [pull request] Pull request for branch
	gcc-pkgversion-fix
Message-ID: <cover.1260875280.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The following changes since commit 687d0958a31f6aee8e8e4d26360961327049d9a8:
  Peter Korsgaard (1):
        toolchain/uClibc: avr32 patch should apply to 0.9.30.1

are available in the git repository at:

  git://git.busybox.net/~tpetazzoni/git/buildroot gcc-pkgversion-fix

Thomas Petazzoni (1):
      gcc: do not pass --with-pkgversion to gcc < 4.3

 toolchain/gcc/gcc-uclibc-4.x.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

Thanks,
-- 
Thomas Petazzoni
