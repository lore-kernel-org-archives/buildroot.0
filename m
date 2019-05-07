From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 7 May 2019 22:55:52 +0200
Subject: [Buildroot] [git commit] package/assimp: replace utf-8 quote by
 ascii single quote
Message-ID: <20190507210157.B98EE815D1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ad4a2b5e1c596f4ae54ff1c8810e97877809cb76
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/assimp/assimp.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/assimp/assimp.mk b/package/assimp/assimp.mk
index 4d447487ba..1316720423 100644
--- a/package/assimp/assimp.mk
+++ b/package/assimp/assimp.mk
@@ -19,7 +19,7 @@ endif
 # workaround SuperH compiler failure when static linking (i.e -fPIC is
 # not passed) in gcc versions 5.x or older. The -Os optimization level
 # causes a "unable to find a register to spill in class
-# ???GENERAL_REGS???" error. -O2 works fine.
+# 'GENERAL_REGS'" error. -O2 works fine.
 ifeq ($(BR2_sh):$(BR2_STATIC_LIBS):$(BR2_TOOLCHAIN_GCC_AT_LEAST_6),y:y:)
 ASSIMP_CXXFLAGS += -O2
 endif
