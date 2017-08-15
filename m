From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 15 Aug 2017 22:14:41 +0300
Subject: [Buildroot] [PATCH v2 2/2] whois: use github repo as home page
In-Reply-To: <a73c8c9cceb698f9b2fa61339baa694087a00377.1502824481.git.baruch@tkos.co.il>
References: <a73c8c9cceb698f9b2fa61339baa694087a00377.1502824481.git.baruch@tkos.co.il>
Message-ID: <5238381800b4c59088db472757ec95155c96a7cc.1502824481.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The github repo is more informative than the list Marco's software on
the previous link.

Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/whois/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/whois/Config.in b/package/whois/Config.in
index 9505d5832056..d2a030282b76 100644
--- a/package/whois/Config.in
+++ b/package/whois/Config.in
@@ -4,4 +4,4 @@ config BR2_PACKAGE_WHOIS
 	help
 	  Improved whois client.
 
-	  http://www.linux.it/~md/software/
+	  https://github.com/rfc1036/whois
-- 
2.14.1
