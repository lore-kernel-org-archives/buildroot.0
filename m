From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 24 Dec 2019 14:58:44 +0100
Subject: [Buildroot] [git commit] package/libfcgi: update the upstream URL
 in Config.in
Message-ID: <20191224134935.28F538E260@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=def14ddd4bbf56d5b76c1565f5123ea705b6062f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update the upstream URL in the help text in Config.in. This
addresses the 'Invalid(Err)' URL status in the package stats
web page output.

Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libfcgi/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libfcgi/Config.in b/package/libfcgi/Config.in
index 47ff8a2d13..aceea3e897 100644
--- a/package/libfcgi/Config.in
+++ b/package/libfcgi/Config.in
@@ -4,4 +4,4 @@ config BR2_PACKAGE_LIBFCGI
 	help
 	  FCGI, a fastcgi developer library for C/C++
 
-	  http://www.fastcgi.com/
+	  https://fastcgi-archives.github.io/
