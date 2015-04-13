From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 13 Apr 2015 09:43:02 +0200
Subject: [Buildroot] [git commit] package/kodi: Fix path to binary in service
Message-ID: <20150413074325.C402980E27@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=62165ae464bbaee05ac4c2cd20c13a99133d15cf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Acked-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/kodi/kodi.service |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/kodi/kodi.service b/package/kodi/kodi.service
index acd3b8e..f30741c 100644
--- a/package/kodi/kodi.service
+++ b/package/kodi/kodi.service
@@ -4,7 +4,7 @@ After = network.target
 
 [Service]
 Type = simple
-ExecStart = /usr/lib/xbmc/xbmc.bin --standalone -fs -n
+ExecStart = /usr/lib/kodi/kodi.bin --standalone -fs -n
 Restart = on-failure
 
 [Install]
