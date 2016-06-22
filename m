From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 22 Jun 2016 07:09:47 -0300
Subject: [Buildroot] [PATCH] glibc: bump default to version 2.23
Message-ID: <1466590187-21862-1-git-send-email-gustavo@zacarias.com.ar>
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
index 02cae35..f86822d 100644
--- a/package/glibc/Config.in
+++ b/package/glibc/Config.in
@@ -8,7 +8,7 @@ config BR2_PACKAGE_GLIBC
 
 choice
 	prompt "glibc version"
-	default BR2_GLIBC_VERSION_2_22
+	default BR2_GLIBC_VERSION_2_23
 
 config BR2_GLIBC_VERSION_2_22
 	bool "2.22"
-- 
2.7.3
