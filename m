From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  4 Jul 2016 11:24:40 +0200
Subject: [Buildroot] [PATCH 29/83 v2] package/cairo: use 'menuconfig'
In-Reply-To: <cover.1467624132.git.yann.morin.1998@free.fr>
References: <cover.1467624132.git.yann.morin.1998@free.fr>
Message-ID: <dd08a7a30014da91bd7c1e50cbc0e3ec98487031.1467624132.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cairo has more than 5 options, so use a 'menuconfig' to group the
options in a sub-menu.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/cairo/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/cairo/Config.in b/package/cairo/Config.in
index 0c87a29..abedee2 100644
--- a/package/cairo/Config.in
+++ b/package/cairo/Config.in
@@ -1,4 +1,4 @@
-config BR2_PACKAGE_CAIRO
+menuconfig BR2_PACKAGE_CAIRO
 	bool "cairo"
 	select BR2_PACKAGE_PIXMAN
 	select BR2_PACKAGE_FONTCONFIG
-- 
2.7.4
