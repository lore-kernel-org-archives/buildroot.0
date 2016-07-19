From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 19 Jul 2016 09:10:35 -0500
Subject: [Buildroot] [PATCH] nginx-upload: select BR2_PACKAGE_NGINX_HTTP
Message-ID: <1468937435-62705-1-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Bimal Jacob <Bimal.Jacob@rockwellcollins.com>

Resolves:
http://autobuild.buildroot.net/results/64b/64b1bde02346ca67b670f0b095bd3acad707e8cd

Signed-off-by: Bimal Jacob <bimal.jacob@rockwellcollins.com>
Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
---
 package/nginx-upload/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/nginx-upload/Config.in b/package/nginx-upload/Config.in
index b4ee71c..bd2d51f 100644
--- a/package/nginx-upload/Config.in
+++ b/package/nginx-upload/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_NGINX_UPLOAD
 	bool "nginx-upload"
 	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_NGINX_HTTP
 	help
 	  A module for nginx web server for handling file uploads
 	  using multipart/form-data encoding (RFC 1867).
-- 
1.9.1
