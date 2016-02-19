From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 19 Feb 2016 10:32:34 -0300
Subject: [Buildroot] [PATCH 2/2] glibc: bump default to version 2.22
In-Reply-To: <1455888754-10726-1-git-send-email-gustavo@zacarias.com.ar>
References: <1455888754-10726-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1455888754-10726-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/glibc/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/glibc/Config.in b/package/glibc/Config.in
index d8f54b6..f839e29 100644
--- a/package/glibc/Config.in
+++ b/package/glibc/Config.in
@@ -32,7 +32,7 @@ config BR2_PACKAGE_GLIBC
 
 choice
 	prompt "glibc version"
-	default BR2_GLIBC_VERSION_2_21
+	default BR2_GLIBC_VERSION_2_22
 
 config BR2_GLIBC_VERSION_2_21
 	bool "2.21"
-- 
2.4.10
