From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 29 Nov 2019 10:12:25 +0100
Subject: [Buildroot] [git commit] package/libsexy: update the upstream URL
 in Config.in
Message-ID: <20191129090526.5A17281350@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a79aa2392cf5bb97f0a3808e232ddd7a5a54bdc0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update the upstream URL in the help text in Config.in. This
addresses the 'Invalid(500)' URL status in the package stats
web page output.

Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libsexy/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libsexy/Config.in b/package/libsexy/Config.in
index 5d1e710c44..a2a2cc820c 100644
--- a/package/libsexy/Config.in
+++ b/package/libsexy/Config.in
@@ -8,4 +8,4 @@ config BR2_PACKAGE_LIBSEXY
 	  GtkLabel by subclassing them and working around the
 	  limitations of the widgets.
 
-	  http://www.chipx86.com/wiki/Libsexy
+	  https://blog.chipx86.com/tag/libsexy/
