From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 4 Aug 2012 13:14:53 +0200
Subject: [Buildroot] [git commit] lua: Add license info
Message-ID: <20120804112012.79C3C9701D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=80e184610b16417b079c44c7fa5f855fbdcac09c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 package/lua/lua.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/lua/lua.mk b/package/lua/lua.mk
index 26c1576..de60c57 100644
--- a/package/lua/lua.mk
+++ b/package/lua/lua.mk
@@ -7,6 +7,8 @@
 LUA_VERSION = 5.1.5
 LUA_SITE = http://www.lua.org/ftp
 LUA_INSTALL_STAGING = YES
+LUA_LICENSE = MIT
+LUA_LICENSE_FILES = COPYRIGHT
 
 LUA_CFLAGS = -Wall
 ifeq ($(BR2_PACKAGE_LUA_SHARED_LIBRARY),y)
