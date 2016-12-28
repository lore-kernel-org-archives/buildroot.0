From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 28 Dec 2016 23:28:51 +0100
Subject: [Buildroot] [git commit] luafilesystem: add license file
Message-ID: <20161228223855.4DC2B81A1A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2ffd07aaae4504c8b8681235e88c984e6b0d75a5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/luafilesystem/luafilesystem.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/luafilesystem/luafilesystem.mk b/package/luafilesystem/luafilesystem.mk
index 5826e1e..a54ae23 100644
--- a/package/luafilesystem/luafilesystem.mk
+++ b/package/luafilesystem/luafilesystem.mk
@@ -6,6 +6,7 @@
 
 LUAFILESYSTEM_VERSION = 1.6.3-1
 LUAFILESYSTEM_LICENSE = MIT
+LUAFILESYSTEM_LICENSE_FILES = luafilesystem/LICENSE
 LUAFILESYSTEM_SUBDIR = luafilesystem
 
 $(eval $(luarocks-package))
