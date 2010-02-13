From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 13 Feb 2010 12:27:51 +0100
Subject: [Buildroot] [pull request] Pull request for branch uclibc-iconv-fix
Message-ID: <cover.1266060467.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The following changes since commit f0bdacdb5b8fe0fbc276ed510fc58e9a219f5cf8:
  Peter Korsgaard (1):
        update for 2010.02-rc1

are available in the git repository at:

  git://git.busybox.net/~tpetazzoni/git/buildroot uclibc-iconv-fix

Thomas Petazzoni (1):
      Add patch to fix uClibc build failure with locale enabled

 ...libc-0.9.30.2-fix-make-install-host-utils.patch |  153 ++++++++++++++++++++
 1 files changed, 153 insertions(+), 0 deletions(-)
 create mode 100644 toolchain/uClibc/uClibc-0.9.30.2-fix-make-install-host-utils.patch

Thanks,
-- 
Thomas Petazzoni
