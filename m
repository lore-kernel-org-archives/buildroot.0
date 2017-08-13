From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 13 Aug 2017 21:34:18 +0300
Subject: [Buildroot] [PATCH 2/3] whois: use github repo as home page
In-Reply-To: <37040459db3e6ca01e2dc8236cf57a993f1831ed.1502649259.git.baruch@tkos.co.il>
References: <37040459db3e6ca01e2dc8236cf57a993f1831ed.1502649259.git.baruch@tkos.co.il>
Message-ID: <fa924d0754ef385b1706721751e5f6f00e60c199.1502649259.git.baruch@tkos.co.il>
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
