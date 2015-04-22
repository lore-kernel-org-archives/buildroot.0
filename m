From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 22 Apr 2015 20:09:32 +0200
Subject: [Buildroot] [PATCH 21/30] package/matchbox: make it a menu
In-Reply-To: <cover.1429725549.git.yann.morin.1998@free.fr>
References: <cover.1429725549.git.yann.morin.1998@free.fr>
Message-ID: <533fd5f85aa1c8de1d693443c78be0902b87ed8d.1429725549.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We're about to add a few more options, so it now warrants a menu for
itself.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/matchbox/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/matchbox/Config.in b/package/matchbox/Config.in
index 39eb616..9d8d060 100644
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
