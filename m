From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 5 May 2017 10:46:23 +0200
Subject: [Buildroot] [git commit] lua-resty-http: correct license file path
Message-ID: <20170505084630.EC22E825B3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6d711c5868a4a890ef16df9f4ae6705a3abf7ca6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

LICENSE file is present in subdirectory.

Fixes:
  http://autobuild.buildroot.net/results/d33/d33a322b4d2618b55849b5637082100702a91eea

Signed-off-by: Rahul Bedarkar <rahulbedarkar89@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
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
