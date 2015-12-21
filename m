From: gustavo.zacarias at free-electrons.com <gustavo.zacarias@free-electrons.com>
Date: Mon, 21 Dec 2015 19:11:08 -0300
Subject: [Buildroot] [PATCH] directfb/legacy: add that it was removed
Message-ID: <1450735868-20515-1-git-send-email-gustavo.zacarias@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>

As pointed by Yann.

Signed-off-by: Gustavo Zacarias <gustavo.zacarisa@free-electrons.com>
---
 Config.in.legacy | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index a21ea82..82ab375 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,7 +146,7 @@ endif
 comment "Legacy options removed in 2016.02"
 
 config BR2_PACKAGE_DIRECTFB_CLE266
-	bool "cle266 driver for directfb"
+	bool "cle266 driver for directfb removed"
 	select BR2_LEGACY
 	help
 	  The cle266 directfb driver support has been removed.
@@ -154,7 +154,7 @@ config BR2_PACKAGE_DIRECTFB_CLE266
 	  anyone has any use for it.
 
 config BR2_PACKAGE_DIRECTFB_UNICHROME
-	bool "unichrome driver for directfb"
+	bool "unichrome driver for directfb removed"
 	select BR2_LEGACY
 	help
 	  The unichrome directfb driver support has been removed.
-- 
2.4.10
