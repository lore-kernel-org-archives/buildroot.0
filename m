From: H Hartley Sweeten <hartleys@visionengravers.com>
Date: Tue, 4 Oct 2011 13:45:32 -0500
Subject: [Buildroot] [PATCH] package/libcgi/Config.in: help text should be
 indented by <tab> and 2 spaces
Message-ID: <ADE657CA350FB648AAC2C43247A983F001F39DC56E5B@AUSP01VMBX24.collaborationhost.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix the help text for package/libcgi/Config.in.

Signed-off-by: H Hartley Sweeten <hsweeten@visionengravers.com>

---

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
