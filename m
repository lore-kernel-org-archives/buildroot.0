From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 2 Feb 2012 16:07:02 +0100
Subject: [Buildroot] [git commit] u-boot: only apply 2011.12 at91 patch if
	building 2011.12
Message-ID: <20120202150750.19333909A0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=88404d6b80a58b6d0729de1617822c69c7dfd7ca
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 ...11.12-change-kernel-address-in-dataflash.patch} |    0
 1 files changed, 0 insertions(+), 0 deletions(-)

diff --git a/boot/uboot/uboot-v2011.12-change-kernel-address-in-dataflash.patch b/boot/uboot/uboot-2011.12/uboot-2011.12-change-kernel-address-in-dataflash.patch
similarity index 100%
rename from boot/uboot/uboot-v2011.12-change-kernel-address-in-dataflash.patch
rename to boot/uboot/uboot-2011.12/uboot-2011.12-change-kernel-address-in-dataflash.patch
