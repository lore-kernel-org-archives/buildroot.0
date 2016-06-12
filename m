From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Jun 2016 23:11:31 +0200
Subject: [Buildroot] [git commit] libsodium: add host variant
Message-ID: <20160612212023.C195F7FDF6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=333531f9fd1cf7148ab63d5f02fdec46d8b6fee7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Wojciech Nizi??ski <niziak@spox.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libsodium/libsodium.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libsodium/libsodium.mk b/package/libsodium/libsodium.mk
index bd6f58d..13dba8d 100644
--- a/package/libsodium/libsodium.mk
+++ b/package/libsodium/libsodium.mk
@@ -15,3 +15,4 @@ LIBSODIUM_CONF_OPTS += --disable-pie
 endif
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
