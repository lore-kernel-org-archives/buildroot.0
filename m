From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 6 Jun 2019 17:20:16 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/flare-engine: fix
 typo in comment
Message-ID: <20190606154047.B7A1B7FB93@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=99b9fddc9cfbabb2c75ea331318302b9c4ce24d3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 56b6bd893a3ed45511a97f18a8c61d74e093cd4b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/flare-engine/flare-engine.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/flare-engine/flare-engine.mk b/package/flare-engine/flare-engine.mk
index 1ec50bfed4..3ed0256901 100644
--- a/package/flare-engine/flare-engine.mk
+++ b/package/flare-engine/flare-engine.mk
@@ -22,7 +22,7 @@ endif
 ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_85180),y)
 # CMakeLists.txt sets CMAKE_CXX_FLAGS_<BUILD_TYPE> depending on
 # BUILD_TYPE, and this comes after the generic CMAKE_CXX_FLAGS. 
-# Overrice CMAKE_BUILD_TYPE so no overrides are applied.
+# Override CMAKE_BUILD_TYPE so no overrides are applied.
 FLARE_ENGINE_CONF_OPTS += -DCMAKE_BUILD_TYPE=Buildroot
 FLARE_ENGINE_CONF_OPTS += -DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) -O0"
 endif
