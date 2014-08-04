From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  4 Aug 2014 10:20:28 -0300
Subject: [Buildroot] [PATCH 05/17] inadyn: add comment mmu depends
In-Reply-To: <1407158440-26783-1-git-send-email-gustavo@zacarias.com.ar>
References: <1407158440-26783-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1407158440-26783-5-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Otherwise it shows up indirectly when toolchain options aren't enough
and then vanishes when they are fulfilled.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/inadyn/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/inadyn/Config.in b/package/inadyn/Config.in
index a436111..c1f7a77 100644
--- a/package/inadyn/Config.in
+++ b/package/inadyn/Config.in
@@ -11,3 +11,4 @@ config BR2_PACKAGE_INADYN
 
 comment "inadyn needs a toolchain w/ dynamic library"
         depends on BR2_PREFER_STATIC_LIB
+	depends on BR2_USE_MMU
-- 
1.8.5.5
