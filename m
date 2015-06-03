From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed,  3 Jun 2015 22:41:28 +0200
Subject: [Buildroot] [PATCH 11/32 v2] package/matchbox: point to new home
In-Reply-To: <cover.1433362840.git.yann.morin.1998@free.fr>
References: <cover.1433362840.git.yann.morin.1998@free.fr>
Message-ID: <4b5bcd8acdc0066232191a5869d876f469fe9e56.1433362840.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The new home of the matchbox project is with the Yocto project.
The old home was already redirecting to it anyway, but better point
directly to the official location.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

---
Changes v1 -> v2:
  - change commit log to remove dubious sarcastic joke  (Alexandre)
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
