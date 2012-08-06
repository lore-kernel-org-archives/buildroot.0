From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Aug 2012 12:48:31 +0200
Subject: [Buildroot] [git commit] wsapi: add license info
Message-ID: <20120806104901.3E7D596D55@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=96638cf8414529b0400d7b388b976e15866124e9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/wsapi/wsapi.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/wsapi/wsapi.mk b/package/wsapi/wsapi.mk
index f5423f3..eb2b51c 100644
--- a/package/wsapi/wsapi.mk
+++ b/package/wsapi/wsapi.mk
@@ -7,6 +7,7 @@
 WSAPI_VERSION = 1.5
 WSAPI_SITE = http://github.com/downloads/keplerproject/wsapi
 WSAPI_DEPENDENCIES = coxpcall luafilesystem rings
+WSAPI_LICENSE = MIT
 
 define WSAPI_INSTALL_TARGET_CMDS
 	mkdir -p $(TARGET_DIR)/usr/share/lua/wsapi
