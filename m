From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 22 Apr 2015 20:09:22 +0200
Subject: [Buildroot] [PATCH 11/30] package/matchbox: point to new home
In-Reply-To: <cover.1429725549.git.yann.morin.1998@free.fr>
References: <cover.1429725549.git.yann.morin.1998@free.fr>
Message-ID: <1b8a30a38d5f4cc09e60cf5ee62d17faf76d4876.1429725549.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The new home of the matchbox project is with the Yocto
project^Wumbrella^Wbuildsystem^Wdistribution^Wwhatever
that is. ;-)

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/matchbox/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/matchbox/Config.in b/package/matchbox/Config.in
index 2f9b73d..891ac95 100644
--- a/package/matchbox/Config.in
+++ b/package/matchbox/Config.in
@@ -15,7 +15,7 @@ config BR2_PACKAGE_MATCHBOX
 	  handhelds, set-top boxes, kiosks and anything else for which
 	  screen space, input mechanisms or system resources are limited.
 
-	  http://matchbox-project.org/
+	  https://www.yoctoproject.org/tools-resources/projects/matchbox
 
 if BR2_PACKAGE_MATCHBOX
 
-- 
1.9.1
