From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 20 Oct 2014 11:09:51 +0200
Subject: [Buildroot] [git commit] libplayer: fix typo on BR2_nios2
Message-ID: <20141020091130.2C095AFFBD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=de7523259b019b676c11df431cca0fb50494d86b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libplayer is using BR2_nios, but it should be BR2_nios2.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libplayer/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libplayer/Config.in b/package/libplayer/Config.in
index 4f5404c..703b96d 100644
--- a/package/libplayer/Config.in
+++ b/package/libplayer/Config.in
@@ -14,7 +14,7 @@ config BR2_PACKAGE_LIBPLAYER_MPLAYER
 	bool "mplayer backend"
 	# mplayer
 	depends on !(BR2_bfin || BR2_sh2a || BR2_sh4a || BR2_sh4aeb || \
-		   BR2_microblaze || BR2_aarch64 || BR2_nios)
+		   BR2_microblaze || BR2_aarch64 || BR2_nios2)
 	# mplayer
 	depends on BR2_LARGEFILE
 	# mplayer
