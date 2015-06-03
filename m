From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed,  3 Jun 2015 22:41:39 +0200
Subject: [Buildroot] [PATCH 22/32 v2] package/matchbox: make it a menu
In-Reply-To: <cover.1433362840.git.yann.morin.1998@free.fr>
References: <cover.1433362840.git.yann.morin.1998@free.fr>
Message-ID: <b2d425c2be2a609adf3e4aa783ee3f66306c4419.1433362840.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We're about to add a few more options, so it now warrants a menu for
itself.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/matchbox/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/matchbox/Config.in b/package/matchbox/Config.in
index d850a39..ae33ecf 100644
--- a/package/matchbox/Config.in
+++ b/package/matchbox/Config.in
@@ -1,4 +1,4 @@
-config BR2_PACKAGE_MATCHBOX
+menuconfig BR2_PACKAGE_MATCHBOX
 	bool "matchbox"
 	depends on BR2_PACKAGE_XORG7
 	depends on BR2_USE_MMU # fork()
-- 
1.9.1
