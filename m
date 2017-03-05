From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Mar 2017 22:02:08 +0100
Subject: [Buildroot] [git commit] lua-coat: use PKG_NAME_UPSTREAM
Message-ID: <20170305210518.AB1F77FCAC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9bc9bd7323c29ad720fabc6eb8ede451dfafcfe2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lua-coat/lua-coat.mk | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/lua-coat/lua-coat.mk b/package/lua-coat/lua-coat.mk
index 205995e..80ca6b1 100644
--- a/package/lua-coat/lua-coat.mk
+++ b/package/lua-coat/lua-coat.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-LUA_COAT_VERSION_UPSTREAM = 0.9.1
-LUA_COAT_VERSION = $(LUA_COAT_VERSION_UPSTREAM)-1
-LUA_COAT_SUBDIR = lua-Coat-$(LUA_COAT_VERSION_UPSTREAM)
+LUA_COAT_VERSION = 0.9.1-1
+LUA_COAT_NAME_UPSTREAM = lua-Coat
 LUA_COAT_LICENSE = MIT
 LUA_COAT_LICENSE_FILES = $(LUA_COAT_SUBDIR)/COPYRIGHT
 
