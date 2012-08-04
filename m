From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 4 Aug 2012 23:43:48 +0200
Subject: [Buildroot] [git commit] luaexpat: Add license info
Message-ID: <20120804214853.3E8A697018@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b6d7ce7e021e16f7ab5964c5b5e6e0d0c7657c37
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/luaexpat/luaexpat.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/luaexpat/luaexpat.mk b/package/luaexpat/luaexpat.mk
index 400d7b4..2d4c517 100644
--- a/package/luaexpat/luaexpat.mk
+++ b/package/luaexpat/luaexpat.mk
@@ -7,6 +7,7 @@
 LUAEXPAT_VERSION      = 1.2.0
 LUAEXPAT_SITE         = http://matthewwild.co.uk/projects/luaexpat
 LUAEXPAT_DEPENDENCIES = lua expat
+LUAEXPAT_LICENSE      = MIT
 
 
 LUAEXPAT_MFLAGS += LUA_VERSION_NUM=501
