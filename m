From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 5 Oct 2011 14:02:46 +0200
Subject: [Buildroot] [git commit] package/libcgi/Config.in: help text should
	be indented by <tab> and 2 spaces
Message-ID: <20111005120418.DB1BF8E248@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3b3d129c377e657fa1c2d64c45e9ccd90a1b8077
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the help text for package/libcgi/Config.in.

Signed-off-by: H Hartley Sweeten <hsweeten@visionengravers.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libcgi/Config.in |   12 ++++++------
 1 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/libcgi/Config.in b/package/libcgi/Config.in
index 491ae2e..430039e 100644
--- a/package/libcgi/Config.in
+++ b/package/libcgi/Config.in
@@ -1,11 +1,11 @@
 config BR2_PACKAGE_LIBCGI
 	bool "libcgi"
 	help
-		LibCGI is a library written from scratch to easily make
-		CGI applications in C.
+	  LibCGI is a library written from scratch to easily make
+	  CGI applications in C.
 
-		There are a lot of functions like string manipulation,
-		session and cookie support, GET and POST methods manipulation
-		etc..., to help you to quickly write powerful CGI programs.
+	  There are a lot of functions like string manipulation,
+	  session and cookie support, GET and POST methods manipulation
+	  etc..., to help you to quickly write powerful CGI programs.
 
-		http://libcgi.sourceforge.net/
+	  http://libcgi.sourceforge.net/
