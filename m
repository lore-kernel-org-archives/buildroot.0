From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  4 Jul 2016 11:25:29 +0200
Subject: [Buildroot] [PATCH 78/83 v2] boot/at91bootstrap3: use 'menuconfig'
In-Reply-To: <cover.1467624132.git.yann.morin.1998@free.fr>
References: <cover.1467624132.git.yann.morin.1998@free.fr>
Message-ID: <6c721a2ea394af68c03dd2346aec6b808a35f99c.1467624132.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

at91bootstrap3 has more than 5 options, so use a 'menuconfig' to
group the options in a sub-menu.

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
2.7.4
