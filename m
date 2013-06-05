From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 5 Jun 2013 11:01:09 +0200
Subject: [Buildroot] [git commit] luajit: bump to version 2.0.2
Message-ID: <20130605090359.534DA9A95D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f26b054a326d1b7c12735fc03b6ea273de324884
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/luajit/luajit.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/luajit/luajit.mk b/package/luajit/luajit.mk
index bf9cfe8..8078a51 100644
--- a/package/luajit/luajit.mk
+++ b/package/luajit/luajit.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-LUAJIT_VERSION = 2.0.1
+LUAJIT_VERSION = 2.0.2
 LUAJIT_SOURCE  = LuaJIT-$(LUAJIT_VERSION).tar.gz
 LUAJIT_SITE    = http://luajit.org/download
 LUAJIT_LICENSE = MIT
