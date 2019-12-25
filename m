From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 Dec 2019 21:00:06 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/wsapi-fcgi:
 update the upstream URL in Config.in
Message-ID: <20191225195101.9108A8E3F7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8727b7210b0635cf8af768de39b6c684e08ae969
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Update the upstream URL in the help text in Config.in. This
addresses the 'Invalid(406)' URL status in the package stats
web page output.

Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 4c9494a187d80db82c6b25534f18708fcea6f52f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wsapi-fcgi/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/wsapi-fcgi/Config.in b/package/wsapi-fcgi/Config.in
index 73ef8cb00c..657ae78c66 100644
--- a/package/wsapi-fcgi/Config.in
+++ b/package/wsapi-fcgi/Config.in
@@ -8,4 +8,4 @@ config BR2_PACKAGE_WSAPI_FCGI
 	  applications. This is the rock that contains the FCGI module
 	  lfcgi.
 
-	  http://www.keplerproject.org/wsapi
+	  https://luarocks.org/modules/mascarenhas/wsapi-fcgi
