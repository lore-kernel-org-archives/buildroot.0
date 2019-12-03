From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 3 Dec 2019 14:48:57 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/ca-certificates:
 update the upstream URL in Config.in
Message-ID: <20191203134049.5B44F84278@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7a2abe8542ffd2d974c1c26e78a4f3dfb746dad4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Update the upstream URL in the help text in Config.in. This
addresses the 'Invalid(404)' URL status in the package stats
web page output.

Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit a9695f46111b6a68a4d9f80b2d4ec25d906b4d4c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
