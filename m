From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 26 Nov 2019 21:01:17 +0100
Subject: [Buildroot] [git commit] package/ca-certificates: update the
 upstream URL in Config.in
Message-ID: <20191126203656.3D2148120D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a9695f46111b6a68a4d9f80b2d4ec25d906b4d4c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update the upstream URL in the help text in Config.in. This
addresses the 'Invalid(404)' URL status in the package stats
web page output.

Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
