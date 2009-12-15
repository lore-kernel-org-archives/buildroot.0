From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Dec 2009 12:23:28 +0100
Subject: [Buildroot] [pull request] Pull request for branch avr32-fixes
Message-ID: <cover.1260876205.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The following changes since commit 687d0958a31f6aee8e8e4d26360961327049d9a8:
  Peter Korsgaard (1):
        toolchain/uClibc: avr32 patch should apply to 0.9.30.1

are available in the git repository at:

  git://git.busybox.net/~tpetazzoni/git/buildroot avr32-fixes

Thomas Petazzoni (2):
      uclibc: get rid of avr32 special version since upstream works
      update avr32 defconfigs after uclibc avr32 version removal

 configs/atngw100-base_defconfig                    |    5 +--
 configs/atngw100_defconfig                         |    5 +--
 configs/atstk1005_defconfig                        |    3 +-
 configs/atstk100x_defconfig                        |    5 +--
 toolchain/uClibc/Config.in                         |   12 +-------
 ...uClibc-0.9.30-avr32-2.1.5-unifdef-getline.patch |   29 --------------------
 toolchain/uClibc/uclibc.mk                         |    2 -
 7 files changed, 9 insertions(+), 52 deletions(-)
 delete mode 100644 toolchain/uClibc/uClibc-0.9.30-avr32-2.1.5-unifdef-getline.patch

Thanks,
-- 
Thomas Petazzoni
