From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 16 Jan 2016 23:38:07 +0100
Subject: [Buildroot] [PATCH 75/80 v1] boot/at91bootstrap3: use 'menuconfig'
In-Reply-To: <cover.1452983019.git.yann.morin.1998@free.fr>
References: <cover.1452983019.git.yann.morin.1998@free.fr>
Message-ID: <1714a38576fa17e12fb74f531ca44069d077ae3d.1452983019.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

at91bootstrap3 has more than 5 options, so use a 'menuconfig' to
group the options in an sub-menu.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 boot/at91bootstrap3/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/boot/at91bootstrap3/Config.in b/boot/at91bootstrap3/Config.in
index b8ebe80..6f4050c 100644
--- a/boot/at91bootstrap3/Config.in
+++ b/boot/at91bootstrap3/Config.in
@@ -1,4 +1,4 @@
-config BR2_TARGET_AT91BOOTSTRAP3
+menuconfig BR2_TARGET_AT91BOOTSTRAP3
 	depends on BR2_arm926t || BR2_cortex_a5
 	bool "AT91 Bootstrap 3"
 	help
-- 
1.9.1
