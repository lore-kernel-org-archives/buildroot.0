From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  4 Aug 2014 10:20:27 -0300
Subject: [Buildroot] [PATCH 04/17] gpm: add comment mmu depends
In-Reply-To: <1407158440-26783-1-git-send-email-gustavo@zacarias.com.ar>
References: <1407158440-26783-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1407158440-26783-4-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Otherwise it shows up indirectly when toolchain options aren't enough
and then vanishes when they are fulfilled.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gpm/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/gpm/Config.in b/package/gpm/Config.in
index 0a60f6a..0148c13 100644
--- a/package/gpm/Config.in
+++ b/package/gpm/Config.in
@@ -23,3 +23,4 @@ endif
 
 comment "gpm mouse server needs a toolchain w/ dynamic library"
 	depends on BR2_PREFER_STATIC_LIB
+	depends on BR2_USE_MMU
-- 
1.8.5.5
