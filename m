From: Rahul Bedarkar <rahulbedarkar89@gmail.com>
Date: Fri,  5 May 2017 14:05:55 +0530
Subject: [Buildroot] [PATCH v2] lua-resty-http: correct license file path
Message-ID: <1493973355-6187-1-git-send-email-rahulbedarkar89@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

LICENSE file is present in subdirectory.

Fixes:
  http://autobuild.buildroot.net/results/d33/d33a322b4d2618b55849b5637082100702a91eea

Signed-off-by: Rahul Bedarkar <rahulbedarkar89@gmail.com>
---
v2:
  - Add link to Buildroot autobuild failure

 package/lua-resty-http/lua-resty-http.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/lua-resty-http/lua-resty-http.mk b/package/lua-resty-http/lua-resty-http.mk
index 927fdae..7ab8b0e 100644
--- a/package/lua-resty-http/lua-resty-http.mk
+++ b/package/lua-resty-http/lua-resty-http.mk
@@ -7,6 +7,6 @@
 LUA_RESTY_HTTP_VERSION = 0.10-0
 LUA_RESTY_HTTP_SUBDIR = lua-resty-http
 LUA_RESTY_HTTP_LICENSE = BSD-2-Clause
-LUA_RESTY_HTTP_LICENSE_FILES = LICENSE
+LUA_RESTY_HTTP_LICENSE_FILES = $(LUA_RESTY_HTTP_SUBDIR)/LICENSE
 
 $(eval $(luarocks-package))
-- 
2.7.4
