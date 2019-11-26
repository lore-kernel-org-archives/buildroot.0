From: Mark Corbin <mark@dibsco.co.uk>
Date: Tue, 26 Nov 2019 19:18:59 +0000
Subject: [Buildroot] [PATCH 1/1] package/ifenslave: update the upstream URL
 in Config.in
Message-ID: <20191126191859.10772-1-mark@dibsco.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update the upstream URL in the help text in Config.in. This
addresses the 'Invalid(404)' URL status in the package stats
web page output.

Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
---
 package/ifenslave/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ifenslave/Config.in b/package/ifenslave/Config.in
index 2203284db0..d28e0f7c29 100644
--- a/package/ifenslave/Config.in
+++ b/package/ifenslave/Config.in
@@ -4,4 +4,4 @@ config BR2_PACKAGE_IFENSLAVE
 	help
 	  Configure network interfaces for parallel routing (bonding)
 
-	  http://anonscm.debian.org/cgit/collab-maint/ifenslave.git
+	  https://salsa.debian.org/debian/ifenslave
-- 
2.20.1
