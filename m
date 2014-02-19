From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 19 Feb 2014 11:00:29 +0100
Subject: [Buildroot] [git commit] mplayer: remove sh2 support
Message-ID: <20140219150025.102AA8D411@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=209b48ae2aff742e2dd131797d3229ed25b5a90c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove a leftover of the commit commit e543f5a10488b020bb4ccb03e6de0e455c64841a
(arch: remove sh2, sh3 and sh3eb support).

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mplayer/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/mplayer/Config.in b/package/mplayer/Config.in
index f2b3620..cfe824d 100644
--- a/package/mplayer/Config.in
+++ b/package/mplayer/Config.in
@@ -29,6 +29,6 @@ config BR2_PACKAGE_MPLAYER_MENCODER
 endif
 
 comment "mplayer needs a toolchain w/ largefile"
-	depends on !(BR2_bfin || BR2_sh2 || BR2_sh2a || BR2_sh4a || BR2_sh4aeb \
+	depends on !(BR2_bfin || BR2_sh2a || BR2_sh4a || BR2_sh4aeb \
 			|| BR2_microblaze || BR2_aarch64)
 	depends on !BR2_LARGEFILE
