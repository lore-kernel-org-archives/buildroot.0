From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 28 Mar 2015 00:20:16 +0100
Subject: [Buildroot] [PATCH 0/3] toolchain/external: add Linaro 2014.11
	(branch yem/toolchain-linaro-2014.11)
Message-ID: <cover.1427498258.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series introduces the Linaro 2014.11 toolchains, for ARM (LE),
ARM (EB) and AArch64.

See the commit log of patch 1 for the gory details... :-/

ARM (LE) and AArch64 toolchains tested with a minimalist setup, based on
qemu_arm_vexpress_defconfig, with just a switch to use EABIhf and this
toolchain (rather than the default EABI and internal toolchain).

Regards,
Yann E. MORIN.


The following changes since commit 9c820091d1a1813e6de4016ea510a047847f9648:

  package/dovecot: fix hash typo (2015-03-27 18:47:38 +0100)

are available in the git repository at:

  git://git.busybox.net/~ymorin/git/buildroot yem/toolchain-linaro-2014.11

for you to fetch changes up to 247483b4380ee25909381aceec19c224712b3627:

  toolchain/external: add Linaro AArch64 2014.11 (2015-03-28 00:16:42 +0100)

----------------------------------------------------------------
Yann E. MORIN (3):
      toolchain/external: add Linaro ARM 2014.11 ARMv7 EABIhf
      toolchain/external: add Linaro ARM BE 2014.11 ARMv7 EABIhf
      toolchain/external: add Linaro AArch64 2014.11

 toolchain/toolchain-external/Config.in             | 73 ++++++++++++++++++++++
 .../toolchain-external/toolchain-external.hash     |  6 ++
 toolchain/toolchain-external/toolchain-external.mk | 38 +++++++++++
 3 files changed, 117 insertions(+)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
