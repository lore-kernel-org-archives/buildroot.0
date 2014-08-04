From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  4 Aug 2014 10:20:33 -0300
Subject: [Buildroot] [PATCH 10/17] mtools: add comment mmu depends
In-Reply-To: <1407158440-26783-1-git-send-email-gustavo@zacarias.com.ar>
References: <1407158440-26783-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1407158440-26783-10-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Otherwise it shows up indirectly when toolchain options aren't enough
and then vanishes when they are fulfilled.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/mtools/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/mtools/Config.in b/package/mtools/Config.in
index 5865223..e51bac1 100644
--- a/package/mtools/Config.in
+++ b/package/mtools/Config.in
@@ -12,3 +12,4 @@ config BR2_PACKAGE_MTOOLS
 
 comment "mtools needs a toolchain w/ wchar"
 	depends on !BR2_USE_WCHAR
+	depends on BR2_USE_MMU
-- 
1.8.5.5
