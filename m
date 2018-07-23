From: julien.boibessot at free.fr <julien.boibessot@free.fr>
Date: Mon, 23 Jul 2018 17:10:11 +0200
Subject: [Buildroot] [PATCH 1/2] package/crda: update website infos
Message-ID: <1532358612-4150-1-git-send-email-julien.boibessot@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Julien BOIBESSOT <julien.boibessot@armadeus.com>

Now Linux wireless infos are on corresponding wiki.

Signed-off-by: Julien BOIBESSOT <julien.boibessot@armadeus.com>
---
 package/crda/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/crda/Config.in b/package/crda/Config.in
index b9a2613..469fa77 100644
--- a/package/crda/Config.in
+++ b/package/crda/Config.in
@@ -15,7 +15,7 @@ config BR2_PACKAGE_CRDA
 	  query and apply the regulatory domain settings wireless
 	  devices may operate within for a given location.
 
-	  http://linuxwireless.org/en/developers/Regulatory/CRDA
+	  https://wireless.wiki.kernel.org/en/developers/regulatory/crda
 
 comment "crda needs a toolchain w/ threads, dynamic library"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
-- 
2.1.4
