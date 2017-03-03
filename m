From: Baruch Siach <baruch@tkos.co.il>
Date: Fri,  3 Mar 2017 07:34:30 +0200
Subject: [Buildroot] [PATCH] python-ipaddr: update homepage link
Message-ID: <a56e1d52da2bf26da4735ff18b1e1535b36f87bf.1488519270.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Cc: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/python-ipaddr/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-ipaddr/Config.in b/package/python-ipaddr/Config.in
index 746d720d866c..9db2dab38b01 100644
--- a/package/python-ipaddr/Config.in
+++ b/package/python-ipaddr/Config.in
@@ -6,4 +6,4 @@ config BR2_PACKAGE_PYTHON_IPADDR
 	  used to create/poke/manipulate IPv4 and IPv6 addresses and
 	  prefixes.
 
-	  https://code.google.com/p/ipaddr-py/
+	  https://github.com/google/ipaddr-py
-- 
2.11.0
