From: Peter Seiderer <ps.report@gmx.net>
Date: Sat, 24 Oct 2020 20:38:10 +0200
Subject: [Buildroot] [PATCH v1] package/meson: fix cross-compilation.conf.in
 formatting
Message-ID: <20201024183810.28154-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add missing space for the cross-compilation.conf.in cpu_family
entry.

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/meson/cross-compilation.conf.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/meson/cross-compilation.conf.in b/package/meson/cross-compilation.conf.in
index e9344e2b2f..1880051315 100644
--- a/package/meson/cross-compilation.conf.in
+++ b/package/meson/cross-compilation.conf.in
@@ -24,6 +24,6 @@ pkg_config_static = '@STATIC@'
 
 [host_machine]
 system = 'linux'
-cpu_family ='@TARGET_ARCH@'
+cpu_family = '@TARGET_ARCH@'
 cpu = '@TARGET_CPU@'
 endian = '@TARGET_ENDIAN@'
-- 
2.28.0
