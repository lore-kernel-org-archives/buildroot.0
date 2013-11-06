From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  6 Nov 2013 07:21:34 -0300
Subject: [Buildroot] [PATCH] curl: fix homepage
Message-ID: <1383733294-20038-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cURL's homepage is curl.haxx.se and not curl.haxx.nu

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libcurl/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libcurl/Config.in b/package/libcurl/Config.in
index 1d6d08e..8e2953e 100644
--- a/package/libcurl/Config.in
+++ b/package/libcurl/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_LIBCURL
 	  cURL is a tool for getting files from FTP, HTTP, Gopher, Telnet,
 	  and Dict servers, using any of the supported protocols.
 
-	  http://curl.haxx.nu/
+	  http://curl.haxx.se/
 
 config BR2_PACKAGE_CURL
 	bool "curl binary"
-- 
1.8.1.5
