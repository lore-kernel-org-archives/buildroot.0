From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 27 Jul 2014 10:44:26 +0200
Subject: [Buildroot] [git commit] luainterpreter: add host variant
Message-ID: <20140727122851.014789D05C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f93de3fb20469d16d54db83be647c3bdf1f57dee
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

host-luainterpreter is host-lua or host-luajit

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/luainterpreter/luainterpreter.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/luainterpreter/luainterpreter.mk b/package/luainterpreter/luainterpreter.mk
index aa02696..4ef0a45 100644
--- a/package/luainterpreter/luainterpreter.mk
+++ b/package/luainterpreter/luainterpreter.mk
@@ -7,3 +7,4 @@
 LUAINTERPRETER_ABIVER = $(call qstrip,$(BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION))
 
 $(eval $(virtual-package))
+$(eval $(host-virtual-package))
