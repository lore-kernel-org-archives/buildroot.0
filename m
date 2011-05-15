From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 15 May 2011 22:00:14 +0200
Subject: [Buildroot] [pull request] Pull request for branch
	for-2011.05/remove-dead-code
Message-ID: <cover.1305489609.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The following changes since commit 5c88d720f99ce6374a2a9b6afcb93ff627f464fa:

  Merge branch 'for-2011.05/new-codesourcery-toolchain' of http://free-electrons.com/~thomas/buildroot (2011-05-13 15:30:37 +0200)

are available in the git repository at:

  http://free-electrons.com/~thomas/buildroot.git for-2011.05/remove-dead-code

Thomas Petazzoni (2):
      uClibc: remove AVR32 patches for 0.9.29
      gcc: remove references to arm-softfloat.patch.conditional

 toolchain/gcc/gcc-uclibc-4.x.mk                    |   13 -
 toolchain/uClibc/uClibc-0.9.29-arch.patch.avr32    | 3546 --------------------
 .../uClibc-0.9.29-fix-sa_onstack.patch.avr32       |   31 -
 3 files changed, 0 insertions(+), 3590 deletions(-)
 delete mode 100644 toolchain/uClibc/uClibc-0.9.29-arch.patch.avr32
 delete mode 100644 toolchain/uClibc/uClibc-0.9.29-fix-sa_onstack.patch.avr32

Thanks,
-- 
Thomas Petazzoni
