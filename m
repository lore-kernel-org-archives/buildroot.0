From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 12 Mar 2014 22:26:00 +0100
Subject: [Buildroot] [git commit] luajit: bump to version 2.0.3
Message-ID: <20140312212628.535978F006@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=48c12351685660f31facee2606990fb5bbf9a5e6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/luajit/luajit.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/luajit/luajit.mk b/package/luajit/luajit.mk
index 859425a..c4b065d 100644
--- a/package/luajit/luajit.mk
+++ b/package/luajit/luajit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUAJIT_VERSION = 2.0.2
+LUAJIT_VERSION = 2.0.3
 LUAJIT_SOURCE  = LuaJIT-$(LUAJIT_VERSION).tar.gz
 LUAJIT_SITE    = http://luajit.org/download
 LUAJIT_LICENSE = MIT
