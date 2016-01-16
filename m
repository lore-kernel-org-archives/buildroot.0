From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 16 Jan 2016 23:37:27 +0100
Subject: [Buildroot] [PATCH 35/80 v1] package/dejavu: use 'menuconfig'
In-Reply-To: <cover.1452983019.git.yann.morin.1998@free.fr>
References: <cover.1452983019.git.yann.morin.1998@free.fr>
Message-ID: <c8d745353cc1f057e18ce556d4becabe0d0b97b2.1452983019.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

dejavu has 5 options, so use a 'menuconfig' to group the
options in an sub-menu.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/dejavu/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/dejavu/Config.in b/package/dejavu/Config.in
index 5d21e56..8e114f0 100644
--- a/package/dejavu/Config.in
+++ b/package/dejavu/Config.in
@@ -1,4 +1,4 @@
-config BR2_PACKAGE_DEJAVU
+menuconfig BR2_PACKAGE_DEJAVU
 	bool "DejaVu fonts"
 	help
 	  The DejaVu fonts are a font family based on the Vera Fonts.
-- 
1.9.1
