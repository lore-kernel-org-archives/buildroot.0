From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Aug 2012 12:48:00 +0200
Subject: [Buildroot] [git commit] cgilua: add license info
Message-ID: <20120806104900.DD9899704D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8c5707020c64d7cd0184f01f71c231eeec7da2e4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/cgilua/cgilua.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/cgilua/cgilua.mk b/package/cgilua/cgilua.mk
index 038fee1..48ee005 100644
--- a/package/cgilua/cgilua.mk
+++ b/package/cgilua/cgilua.mk
@@ -7,6 +7,7 @@
 CGILUA_VERSION = 5.1.4
 CGILUA_SITE = http://github.com/downloads/keplerproject/cgilua
 CGILUA_DEPENDENCIES = luafilesystem
+CGILUA_LICENSE = MIT
 
 define CGILUA_INSTALL_TARGET_CMDS
 	$(MAKE) -C $(@D) install LUA_DIR="$(TARGET_DIR)/usr/share/lua"
