From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 Dec 2019 20:59:41 +0100
Subject: [Buildroot] [git commit branch/2019.11.x] package/wsapi-xavante:
 update the upstream URL in Config.in
Message-ID: <20191225195045.D5ACD8A29D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c4754ed2ef6ffc704b4bd816f798cf78713ae847
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.11.x

Update the upstream URL in the help text in Config.in. This
addresses the 'Invalid(406)' URL status in the package stats
web page output.

Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 784186fdacaf9baca7a704fc53b7e25991dddca7)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wsapi-xavante/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/wsapi-xavante/Config.in b/package/wsapi-xavante/Config.in
index 7079ad4eda..7af23b84e4 100644
--- a/package/wsapi-xavante/Config.in
+++ b/package/wsapi-xavante/Config.in
@@ -7,4 +7,4 @@ config BR2_PACKAGE_WSAPI_XAVANTE
 	  applications. This is the rock that contains the Xavante
 	  adapter and launcher.
 
-	  http://www.keplerproject.org/wsapi
+	  https://keplerproject.github.io/wsapi/
