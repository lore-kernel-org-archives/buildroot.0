From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Sep 2017 22:02:30 +0200
Subject: [Buildroot] [git commit] lua-resty-http: bump to version 0.11
Message-ID: <20170902195515.1504A8041D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=161b8aa917673291076c990b206f435f4a436266
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lua-resty-http/lua-resty-http.hash | 2 +-
 package/lua-resty-http/lua-resty-http.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lua-resty-http/lua-resty-http.hash b/package/lua-resty-http/lua-resty-http.hash
index 02c5659..95f011b 100644
--- a/package/lua-resty-http/lua-resty-http.hash
+++ b/package/lua-resty-http/lua-resty-http.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	3d30dd5a273438e39741fcf87ae5e147d8700bd8faa7dfe9916ea425f9c716f7  lua-resty-http-0.10-0.src.rock
+sha256 12d9aa9a49efdb752c1afb19a6d0a758de6c8dd2dad24ea48bd09e03f7a0e0f1  lua-resty-http-0.11-0.src.rock
diff --git a/package/lua-resty-http/lua-resty-http.mk b/package/lua-resty-http/lua-resty-http.mk
index 7ab8b0e..e79982e 100644
--- a/package/lua-resty-http/lua-resty-http.mk
+++ b/package/lua-resty-http/lua-resty-http.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUA_RESTY_HTTP_VERSION = 0.10-0
+LUA_RESTY_HTTP_VERSION = 0.11-0
 LUA_RESTY_HTTP_SUBDIR = lua-resty-http
 LUA_RESTY_HTTP_LICENSE = BSD-2-Clause
 LUA_RESTY_HTTP_LICENSE_FILES = $(LUA_RESTY_HTTP_SUBDIR)/LICENSE
