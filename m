From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  2 Jan 2013 10:54:33 -0300
Subject: [Buildroot] [PATCH 2/2] qemu/sparc-ss10: switch to v8 optimization
In-Reply-To: <1357134873-18514-1-git-send-email-gustavo@zacarias.com.ar>
References: <1357134873-18514-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1357134873-18514-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Switch to generic V8 optimization for gcc since we dropped the explicit
supersparc one and works just the same.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 configs/qemu_sparc_ss10_defconfig |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/configs/qemu_sparc_ss10_defconfig b/configs/qemu_sparc_ss10_defconfig
index 38bf243..0b65866 100644
--- a/configs/qemu_sparc_ss10_defconfig
+++ b/configs/qemu_sparc_ss10_defconfig
@@ -1,6 +1,6 @@
 # Architecture
 BR2_sparc=y
-BR2_sparc_supersparc=y
+BR2_sparc_v8=y
 
 # filesystem
 BR2_TARGET_ROOTFS_EXT2=y
-- 
1.7.8.6
