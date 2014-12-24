From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 24 Dec 2014 12:00:51 +0100
Subject: [Buildroot] [git commit] lua-coat: bump to version 0.9.1
Message-ID: <20141224111107.5C07E7FA48@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5e4a7332f699d154412722aa14b92699ddc0ac8e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lua-coat/lua-coat.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/lua-coat/lua-coat.mk b/package/lua-coat/lua-coat.mk
index e5a09b0..205995e 100644
--- a/package/lua-coat/lua-coat.mk
+++ b/package/lua-coat/lua-coat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUA_COAT_VERSION_UPSTREAM = 0.9.0
+LUA_COAT_VERSION_UPSTREAM = 0.9.1
 LUA_COAT_VERSION = $(LUA_COAT_VERSION_UPSTREAM)-1
 LUA_COAT_SUBDIR = lua-Coat-$(LUA_COAT_VERSION_UPSTREAM)
 LUA_COAT_LICENSE = MIT
