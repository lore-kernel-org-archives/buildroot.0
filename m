From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 14 Oct 2020 23:57:29 +0200
Subject: [Buildroot] [git commit]
 toolchain/toolchain-external/toolchain-external-bootlin: update to
 2020.08-1 toolchains
Message-ID: <20201014215744.16FCC8762B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3d7a7a6cbac4d9a93b0ca0221923b038b3c54a1c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bootlin toolchains in version 2020.08-1 have just been released, so
let's update the toolchain-external-bootlin package to those new
toolchains.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../toolchain-external-bootlin/Config.in.options   | 1057 ++++++++++++--------
 .../toolchain-external-bootlin.hash                |  612 ++++++------
 .../toolchain-external-bootlin.mk                  |  306 +++---
 3 files changed, 1071 insertions(+), 904 deletions(-)

Patch is too large, so refusing to show it
