From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 16 Dec 2018 12:07:06 +0100
Subject: [Buildroot] [git commit] luaexpat: bump to version 1.3.3
Message-ID: <20181216110337.D4FB27FDF4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c4afb74863d19ebca13635ec3ed9223826b8efcf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/luaexpat/luaexpat.hash | 2 +-
 package/luaexpat/luaexpat.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/luaexpat/luaexpat.hash b/package/luaexpat/luaexpat.hash
index 27f6ed0342..a810e58b56 100644
--- a/package/luaexpat/luaexpat.hash
+++ b/package/luaexpat/luaexpat.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	aa7883a0d44f500e32ef306c04632546f97f33159fffa7bcdc3f451170f95896  luaexpat-1.3.0-1.src.rock
+sha256 b55908fcd7df490a59aab25284460add8283f1c6b94ab584900fe3e49775172a  luaexpat-1.3.3-1.src.rock
diff --git a/package/luaexpat/luaexpat.mk b/package/luaexpat/luaexpat.mk
index c7377f6afe..2b715bc0ab 100644
--- a/package/luaexpat/luaexpat.mk
+++ b/package/luaexpat/luaexpat.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-LUAEXPAT_VERSION = 1.3.0-1
+LUAEXPAT_VERSION = 1.3.3-1
 LUAEXPAT_DEPENDENCIES = expat
 LUAEXPAT_LICENSE = MIT
-LUAEXPAT_LICENSE_FILES = $(LUAEXPAT_SUBDIR)/doc/us/license.html
+LUAEXPAT_LICENSE_FILES = $(LUAEXPAT_SUBDIR)/LICENSE
 
 $(eval $(luarocks-package))
