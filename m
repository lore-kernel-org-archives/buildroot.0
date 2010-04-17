From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 Apr 2010 02:12:18 +0200
Subject: [Buildroot] [pull request] Pull request for branch
	codesourcery-toolchain-support
Message-ID: <cover.1271463088.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Here is a resend of my CodeSourcery external toolchain support patch
set. I've fixed the merge conflict that Peter had, which was the only
feedback I received on this patchset.

Regards,

Thomas

The following changes since commit 65e209ca07416bc040fe98d16b60b6cb4304987f:
  Peter Korsgaard (1):
        openssl: fix build without ipv6 support

are available in the git repository at:

  git://git.busybox.net/~tpetazzoni/git/buildroot codesourcery-toolchain-support

Thomas Petazzoni (4):
      external toolchains: take into account architecture variant
      external-toolchain: support libraries outside of /lib
      external-toolchain: Support for multilib toolchains
      busybox: make sure architecture flags are used at link time

 package/Makefile.in                      |   22 +++---
 package/busybox/busybox-1.13.x.config    |    1 +
 package/busybox/busybox.mk               |    8 +-
 toolchain/external-toolchain/ext-tool.mk |  109 ++++++++++++++++++++++++-----
 4 files changed, 106 insertions(+), 34 deletions(-)

Thanks,
-- 
Thomas Petazzoni
