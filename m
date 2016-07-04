From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  4 Jul 2016 11:25:32 +0200
Subject: [Buildroot] [PATCH 81/83 v2] boot/mxs-bootlets: use 'menuconfig'
In-Reply-To: <cover.1467624132.git.yann.morin.1998@free.fr>
References: <cover.1467624132.git.yann.morin.1998@free.fr>
Message-ID: <4bfe754981197eba1916d12532f3b31e8bc1dc8a.1467624132.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

mxs-bootlets has 5 options, so use a 'menuconfig' to
group the options in a sub-menu.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 boot/mxs-bootlets/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/boot/mxs-bootlets/Config.in b/boot/mxs-bootlets/Config.in
index 4bb07a0..2712d8d 100644
--- a/boot/mxs-bootlets/Config.in
+++ b/boot/mxs-bootlets/Config.in
@@ -1,4 +1,4 @@
-config BR2_TARGET_MXS_BOOTLETS
+menuconfig BR2_TARGET_MXS_BOOTLETS
 	bool "mxs-bootlets"
 	depends on BR2_arm
 	help
-- 
2.7.4
