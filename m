From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Aug 2012 12:48:24 +0200
Subject: [Buildroot] [git commit] luasocket: add license info
Message-ID: <20120806104901.22F4B96D55@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e61976104404251381fd9111f719b9141c5a4a0d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/luasocket/luasocket.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/luasocket/luasocket.mk b/package/luasocket/luasocket.mk
index 755b61a..45fb9a3 100644
--- a/package/luasocket/luasocket.mk
+++ b/package/luasocket/luasocket.mk
@@ -7,6 +7,8 @@
 LUASOCKET_VERSION = 2.0.2
 LUASOCKET_SITE = http://luaforge.net/frs/download.php/2664
 LUASOCKET_DEPENDENCIES = lua
+LUASOCKET_LICENSE = MIT
+LUASOCKET_LICENSE_FILES = LICENSE
 
 define LUASOCKET_BUILD_CMDS
 	$(MAKE) -C $(@D) -f makefile \
