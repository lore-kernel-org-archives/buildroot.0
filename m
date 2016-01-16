From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 16 Jan 2016 23:38:10 +0100
Subject: [Buildroot] [PATCH 78/80 v1] boot/mxs-bootlets: use 'menuconfig'
In-Reply-To: <cover.1452983019.git.yann.morin.1998@free.fr>
References: <cover.1452983019.git.yann.morin.1998@free.fr>
Message-ID: <18a807a8578fe5f80db664719ee2e41a2cad8faa.1452983019.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

mxs-bootlets has 5 options, so use a 'menuconfig' to
group the options in an sub-menu.

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
1.9.1
