From: Mark Corbin <mark@dibsco.co.uk>
Date: Tue, 26 Nov 2019 12:24:36 +0000
Subject: [Buildroot] [PATCH 1/1] package/ca-certificates: update the
 upstream URL in Config.in
Message-ID: <20191126122436.12499-1-mark@dibsco.co.uk>
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
 package/ca-certificates/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ca-certificates/Config.in b/package/ca-certificates/Config.in
index 6bb71820d2..cd9825a811 100644
--- a/package/ca-certificates/Config.in
+++ b/package/ca-certificates/Config.in
@@ -9,4 +9,4 @@ config BR2_PACKAGE_CA_CERTIFICATES
 	  Debian infrastructure and those shipped with Mozilla's
 	  browsers.
 
-	  http://anonscm.debian.org/gitweb/?p=collab-maint/ca-certificates.git
+	  https://salsa.debian.org/debian/ca-certificates
-- 
2.20.1
