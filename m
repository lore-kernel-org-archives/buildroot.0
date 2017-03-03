From: Baruch Siach <baruch@tkos.co.il>
Date: Fri,  3 Mar 2017 07:16:19 +0200
Subject: [Buildroot] [PATCH] python-pyasn: update homepage link
Message-ID: <156036bd8ea375c3ffc7c32a89b203a58ad49ecd.1488518179.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/python-pyasn/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-pyasn/Config.in b/package/python-pyasn/Config.in
index 997b737f5b97..2396194df660 100644
--- a/package/python-pyasn/Config.in
+++ b/package/python-pyasn/Config.in
@@ -8,7 +8,7 @@ config BR2_PACKAGE_PYTHON_PYASN
 	  perform very fast IP address to Autonomous System Number
 	  lookups.
 
-	  https://code.google.com/p/pyasn/
+	  https://github.com/hadiasghari/pyasn
 
 comment "python-pyasn needs a toolchain w/ C++"
 	depends on !BR2_INSTALL_LIBSTDCPP
-- 
2.11.0
