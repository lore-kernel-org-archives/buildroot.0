From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 23 Jun 2020 23:30:55 +0200
Subject: [Buildroot] [git commit] package/nginx: fix typo in stream split
 clients
Message-ID: <20200623212913.468718263E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=13532c0c9e55116760e5212c808793978fde584c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 3e6b35900f4f4aed4fd11e0187a36a7f374271aa forgot to add a 's' to
ngx_stream_split_client_module

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/nginx/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/nginx/Config.in b/package/nginx/Config.in
index eba0d30329..6dba7e0ead 100644
--- a/package/nginx/Config.in
+++ b/package/nginx/Config.in
@@ -365,7 +365,7 @@ config BR2_PACKAGE_NGINX_STREAM_MAP_MODULE
 	  Enable ngx_stream_map_module
 
 config BR2_PACKAGE_NGINX_STREAM_SPLIT_CLIENTS_MODULE
-	bool "ngx_stream_split_client_module"
+	bool "ngx_stream_split_clients_module"
 	default y
 	help
 	  Enable ngx_stream_split_clients_module
