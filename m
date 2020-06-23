From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 23 Jun 2020 23:27:26 +0200
Subject: [Buildroot] [PATCH 1/1] package/nginx: fix typo in stream split
 clients
Message-ID: <20200623212726.1039911-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit 3e6b35900f4f4aed4fd11e0187a36a7f374271aa forgot to add a 's' to
ngx_stream_split_client_module

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/nginx/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/nginx/Config.in b/package/nginx/Config.in
index 1cf6d41248..714ab2431d 100644
--- a/package/nginx/Config.in
+++ b/package/nginx/Config.in
@@ -381,7 +381,7 @@ config BR2_PACKAGE_NGINX_STREAM_MAP_MODULE
 	  Enable ngx_stream_map_module
 
 config BR2_PACKAGE_NGINX_STREAM_SPLIT_CLIENTS_MODULE
-	bool "ngx_stream_split_client_module"
+	bool "ngx_stream_split_clients_module"
 	default y
 	help
 	  Enable ngx_stream_split_clients_module
-- 
2.26.2
