From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 24 Dec 2020 12:53:03 +0100
Subject: [Buildroot] [git commit branch/2020.11.x] package/go: fix
 s/amrv7/armv7/ typo in comment
Message-ID: <20201224113602.C055A8898C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=48c0c717a27bde37cf82c296150d79ce15d7f7b4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.11.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit f470ce5f0d846a0636c20611dc21ff438dc00df6)
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
