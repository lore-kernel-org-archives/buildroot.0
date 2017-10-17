From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 17 Oct 2017 10:44:00 +0200
Subject: [Buildroot] [git commit branch/2017.08.x] qemu: drop obsolete
	"--disable-uuid" configuration parameter
Message-ID: <20171017090326.604B87FDC1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3879f737c73601285220fc45ec6c0c3bb17fff7c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.08.x

./configure: --disable-uuid is obsolete, UUID support is always built

Change-Id: I9e278418d19e15bbbd3ea233658cd62f75e3385c
Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit f911406f4f36cb6be4bc82d7faae1a3c4f07fc59)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qemu/qemu.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index f02df8b..f42d649 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -238,7 +238,6 @@ define QEMU_CONFIGURE_CMDS
 			--disable-curses \
 			--disable-curl \
 			--disable-bluez \
-			--disable-uuid \
 			--disable-vde \
 			--disable-linux-aio \
 			--disable-cap-ng \
