From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Apr 2015 22:59:54 +0200
Subject: [Buildroot] [git commit] configs: drop redundant IPv6 option
Message-ID: <20150422210725.0756581D89@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=29ad3471909f07e235439f9083c1ea0e97839ab2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop the buildroot toolchain IPv6 option from the only config that's got
it since it's now a non-option.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 configs/armadeus_apf9328_defconfig |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/configs/armadeus_apf9328_defconfig b/configs/armadeus_apf9328_defconfig
index 3ad8feb..d6388db 100644
--- a/configs/armadeus_apf9328_defconfig
+++ b/configs/armadeus_apf9328_defconfig
@@ -6,7 +6,6 @@ BR2_arm920t=y
 BR2_PACKAGE_GDB=y
 BR2_PACKAGE_HOST_GDB=y
 BR2_ENABLE_LOCALE_PURGE=y
-BR2_TOOLCHAIN_BUILDROOT_INET_IPV6=y
 BR2_TOOLCHAIN_BUILDROOT_INET_RPC=y
 BR2_TOOLCHAIN_BUILDROOT_LOCALE=y
 BR2_TOOLCHAIN_BUILDROOT_CXX=y
