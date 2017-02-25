From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 24 Feb 2017 21:34:45 -0300
Subject: [Buildroot] [PATCH next 1/4] glibc: bump default to version 2.24
Message-ID: <20170225003448.32459-1-gustavo@zacarias.com.ar>
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
index 85aace6..0442626 100644
--- a/package/glibc/Config.in
+++ b/package/glibc/Config.in
@@ -8,7 +8,7 @@ config BR2_PACKAGE_GLIBC
 
 choice
 	prompt "glibc version"
-	default BR2_GLIBC_VERSION_2_23
+	default BR2_GLIBC_VERSION_2_24
 
 config BR2_GLIBC_VERSION_2_22
 	bool "2.22"
-- 
2.10.2
