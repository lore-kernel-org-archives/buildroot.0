From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 23 Dec 2020 22:35:03 +0100
Subject: [Buildroot] [git commit] package/go: fix s/amrv7/armv7/ typo in
 comment
Message-ID: <20201223211830.6586983E70@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f470ce5f0d846a0636c20611dc21ff438dc00df6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/go/go.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/go/go.mk b/package/go/go.mk
index f2d10f5dad..e9f8be7783 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -41,7 +41,7 @@ else ifeq ($(BR2_ARM_CPU_ARMV7A),y)
 GO_GOARM = 7
 else ifeq ($(BR2_ARM_CPU_ARMV8A),y)
 # Go doesn't support 32-bit GOARM=8 (https://github.com/golang/go/issues/29373)
-# but can still benefit from amrv7 optimisations
+# but can still benefit from armv7 optimisations
 GO_GOARM = 7
 endif
 else ifeq ($(BR2_aarch64),y)
