From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 22 Dec 2019 10:51:49 +0100
Subject: [Buildroot] [git commit] package/wsapi: update the upstream URL in
 Config.in
Message-ID: <20191222094509.74FD08D486@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=01e4f712aacf1c888225bc25942f007db6c9998f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update the upstream URL in the help text in Config.in. This
addresses the 'Invalid(406)' URL status in the package stats
web page output.

Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/wsapi/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/wsapi/Config.in b/package/wsapi/Config.in
index 72e2dcd8e0..e758e8e0a6 100644
--- a/package/wsapi/Config.in
+++ b/package/wsapi/Config.in
@@ -6,4 +6,4 @@ config BR2_PACKAGE_WSAPI
 	help
 	  API that abstracts the web server from Lua web applications.
 
-	  http://www.keplerproject.org/wsapi
+	  https://keplerproject.github.io/wsapi/
