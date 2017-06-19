From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 19 Jun 2017 09:26:12 +0200
Subject: [Buildroot] [git commit] configs/qemu_sh4*: rename back the linux
	config file to linux-4.9.config
Message-ID: <20170619073237.2240481D81@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0f575dd1e3be98ae66a35d527b922b3dc7f1a099
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In commit 28d97609b25cb534a55b6cf6b1945428e817c54a ("configs/qemu:
bump to the latest kernel version") updated most qemu defconfigs to
use Linux 4.11. However, for the SH4 configurations, Linux 4.9 was
kept, because 4.11 apparently has an issue.

Unfortunately, while the defconfigs for SH4 were unchanged, the Linux
kernel configuration file was renamed from linux-4.9.config to
linux-4.11.config.

This commit renames the Linux configuration files back to their
previous name, linux-4.9.config, matching what the Qemu SH4 defconfigs
specify.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 board/qemu/sh4-r2d/{linux-4.11.config => linux-4.9.config}   | 0
 board/qemu/sh4eb-r2d/{linux-4.11.config => linux-4.9.config} | 0
 2 files changed, 0 insertions(+), 0 deletions(-)

diff --git a/board/qemu/sh4-r2d/linux-4.11.config b/board/qemu/sh4-r2d/linux-4.9.config
similarity index 100%
rename from board/qemu/sh4-r2d/linux-4.11.config
rename to board/qemu/sh4-r2d/linux-4.9.config
diff --git a/board/qemu/sh4eb-r2d/linux-4.11.config b/board/qemu/sh4eb-r2d/linux-4.9.config
similarity index 100%
rename from board/qemu/sh4eb-r2d/linux-4.11.config
rename to board/qemu/sh4eb-r2d/linux-4.9.config
