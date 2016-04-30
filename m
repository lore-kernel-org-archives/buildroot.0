From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 30 Apr 2016 15:28:32 +0200
Subject: [Buildroot] [git commit] move busybox-minimal.config to be used by
	other noMMU targets
Message-ID: <20160430132939.05C7281794@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5e1b132495fe8c27af3cfac73d75121f82734c13
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Config can be used by other noMMU targets as qemu-system-m68k
with coldfire emulation.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 configs/stm32f429_disco_defconfig                                    | 2 +-
 configs/stm32f469_disco_defconfig                                    | 2 +-
 {board/stmicroelectronics => package/busybox}/busybox-minimal.config | 0
 3 files changed, 2 insertions(+), 2 deletions(-)

Patch is too large, so refusing to show it
