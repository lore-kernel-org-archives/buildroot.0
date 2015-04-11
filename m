From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 11 Apr 2015 10:00:46 +0200
Subject: [Buildroot] [PATCH 1/1] package/e2fsprogs: Show toolchain comment
	only on mmu archs
Message-ID: <1428739246-3867-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/e2fsprogs/Config.in |    1 +
 1 file changed, 1 insertion(+)

diff --git a/package/e2fsprogs/Config.in b/package/e2fsprogs/Config.in
index f5011d1..12d135b 100644
--- a/package/e2fsprogs/Config.in
+++ b/package/e2fsprogs/Config.in
@@ -100,3 +100,4 @@ endif
 
 comment "e2fsprogs needs a toolchain w/ wchar"
 	depends on !BR2_USE_WCHAR
+	depends on BR2_USE_MMU
-- 
1.7.10.4
