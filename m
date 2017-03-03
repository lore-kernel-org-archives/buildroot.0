From: Baruch Siach <baruch@tkos.co.il>
Date: Fri,  3 Mar 2017 07:40:39 +0200
Subject: [Buildroot] [PATCH] snappy: update homepage link
Message-ID: <8610903991e28635308c9c32d0111d1395df38e9.1488519639.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/snappy/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/snappy/Config.in b/package/snappy/Config.in
index 06d537f1c90b..d5f70699c102 100644
--- a/package/snappy/Config.in
+++ b/package/snappy/Config.in
@@ -7,7 +7,7 @@ config BR2_PACKAGE_SNAPPY
 	  library; instead, it aims for very high speeds and reasonable
 	  compression.
 
-	  http://code.google.com/p/snappy/
+	  http://google.github.io/snappy/
 
 comment "snappy needs a toolchain w/ C++"
 	depends on !BR2_INSTALL_LIBSTDCPP
-- 
2.11.0
