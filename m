From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 1 Aug 2019 10:11:09 +0200
Subject: [Buildroot] [git commit] package/luaposix: bump to version 34.1
Message-ID: <20190801080944.64A1688689@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f3a3a597bce0361f8517a5f435f8cc5e5dc11ad9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/luaposix/luaposix.hash | 2 +-
 package/luaposix/luaposix.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/luaposix/luaposix.hash b/package/luaposix/luaposix.hash
index a13cb4a9eb..a6b5cd42d4 100644
--- a/package/luaposix/luaposix.hash
+++ b/package/luaposix/luaposix.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 eb6e7322da3013bdb3d524f68df4f5510a2efd805c06bf7cc27be6611eab7483  luaposix-34.0.4.tar.gz
+sha256 b0f8bdfe4b43b6d79b8f3e8ef5b158de889e5dde046618a33335a38d2b5b90f9  luaposix-34.1.tar.gz
diff --git a/package/luaposix/luaposix.mk b/package/luaposix/luaposix.mk
index f4679929c0..c7a9542969 100644
--- a/package/luaposix/luaposix.mk
+++ b/package/luaposix/luaposix.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUAPOSIX_VERSION = 34.0.4
+LUAPOSIX_VERSION = 34.1
 LUAPOSIX_SITE = $(call github,luaposix,luaposix,v$(LUAPOSIX_VERSION))
 LUAPOSIX_LICENSE = MIT
 LUAPOSIX_LICENSE_FILES = LICENSE
