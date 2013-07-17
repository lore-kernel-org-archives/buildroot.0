From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 17 Jul 2013 22:30:46 +0200
Subject: [Buildroot] [PATCHv3 0/4] EABI vs EABIhf check
Message-ID: <1374093050-30344-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Third version of the EABI vs EABIhf check, which takes into account
the comments from Yann E. Morin:

 * Added quoting where needed.
 * Fixed the comment in Config.in.arm

Thanks!

Thomas

Thomas Petazzoni (4):
  toolchain/helpers: don't use the x$(...) = x"value" syntax
  toolchain: check ARM EABI vs. EABIhf for external toolchains
  toolchain/toolchain-external: don't use x$(...) construct or ==
  arch/arm: update VFPv2 comment to mention ARMv5

 arch/Config.in.arm                       |  5 +++--
 toolchain/helpers.mk                     | 21 ++++++++++++++++++---
 toolchain/toolchain-external/ext-tool.mk | 13 ++++++++-----
 3 files changed, 29 insertions(+), 10 deletions(-)

-- 
1.8.1.2
