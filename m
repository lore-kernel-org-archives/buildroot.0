From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 20 Sep 2015 23:45:50 +0200
Subject: [Buildroot] [PATCH 0/5] toolchain/external: bump the Linaro
	toolchains (branch yem/toolchain-linaro-2015.02-2)
Message-ID: <cover.1442785491.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series bumps the Linaro toolchains up to the latest stable version,
2015.02, as noticed by Arnout.

Those toolchains are only available for x86_64 hosts, so we keep the
previous version for those stuck in 32-bit land.

Regards,
Yann E. MORIN.


The following changes since commit dab6765150e0eb5016869f3c0c0e0047745560e9:

  elf2flt: fix build when LTO is enabled (2015-09-20 15:33:58 +0200)

are available in the git repository at:

  git://git.busybox.net/~ymorin/git/buildroot yem/toolchain-linaro-2015.02-2

for you to fetch changes up to f534ca154bca1af779660c7cf411203eaeb01eb8:

  toolchain/external: bump Linaro to 2015.12 for AArch64 (LE) (2015-09-20 23:30:05 +0200)

----------------------------------------------------------------
Yann E. MORIN (5):
      toolchain/external: commonalise comments about Linaro toolchains
      toolchain/external: rename Linaro arm and AArch64 options
      toolchain/external: bump Linaro to 2015.12 for ARM (LE)
      toolchain/external: bump Linaro to 2015.12 for ARM (BE)
      toolchain/external: bump Linaro to 2015.12 for AArch64 (LE)

 Config.in.legacy                                   | 30 ++++++++
 toolchain/toolchain-external/Config.in             | 87 ++++++++++++++++++----
 .../toolchain-external/toolchain-external.hash     |  3 +
 toolchain/toolchain-external/toolchain-external.mk | 18 ++++-
 4 files changed, 121 insertions(+), 17 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
