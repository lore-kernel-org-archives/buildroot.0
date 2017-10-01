From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 1 Oct 2017 23:23:43 +0200
Subject: [Buildroot] [git commit] Config.in: rename xbmc -> kodi
Message-ID: <20171001211817.312B28041A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4f3fdf1544d7aacfd36fdb13ddece4b82753147e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is a left-over of the xbmc->kodi rename patch
https://git.buildroot.net/buildroot/commit/package/kodi?id=3578459748d80cd469729319543b199380a4370f

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Config.in b/Config.in
index e395995..814dc02 100644
--- a/Config.in
+++ b/Config.in
@@ -63,7 +63,7 @@ config BR2_HOST_GCC_AT_LEAST_7
 	select BR2_HOST_GCC_AT_LEAST_6
 
 # Hidden boolean selected by packages in need of Java in order to build
-# (example: xbmc)
+# (example: kodi)
 config BR2_NEEDS_HOST_JAVA
 	bool
 
