From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 25 Oct 2020 16:05:46 +0100
Subject: [Buildroot] [git commit] package/meson: fix
 cross-compilation.conf.in formatting
Message-ID: <20201025145339.6DC2F8469F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=60ef34b414d2763f51de86c72e1e94bf63b578d2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add missing space for the cross-compilation.conf.in cpu_family
entry.

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
