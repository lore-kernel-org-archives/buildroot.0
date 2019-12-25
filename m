From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 Dec 2019 20:59:18 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/wsapi: update the
 upstream URL in Config.in
Message-ID: <20191225195021.35A118E3E9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a2e3f0e085bcbde9a8943903b0b18c46f12bc48b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Update the upstream URL in the help text in Config.in. This
addresses the 'Invalid(406)' URL status in the package stats
web page output.

Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 01e4f712aacf1c888225bc25942f007db6c9998f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
