From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 21 Dec 2015 23:35:59 +0100
Subject: [Buildroot] [git commit] directfb/legacy: add that it was removed
Message-ID: <20151221223603.6EBF482579@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e989ddbe07a05aaed6748bb2ca67b120c84263b5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As pointed by Yann.

Signed-off-by: Gustavo Zacarias <gustavo.zacarisa@free-electrons.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
