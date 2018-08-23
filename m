From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 24 Aug 2018 00:39:45 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] package/samba4: drop
 patch numbering in patch 0003
Message-ID: <20180824063612.7A3A58E529@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=85fb63649e83ac512e424fe43bbfb5dedbe4ee2c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 15045fba99a688977dc1aaca01f7f0d42250a4dc)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0003-Fix-uClibc-build-on-64bit-platforms-by-including-std.patch     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/samba4/0003-Fix-uClibc-build-on-64bit-platforms-by-including-std.patch b/package/samba4/0003-Fix-uClibc-build-on-64bit-platforms-by-including-std.patch
index 3b248e690d..1256d1c969 100644
--- a/package/samba4/0003-Fix-uClibc-build-on-64bit-platforms-by-including-std.patch
+++ b/package/samba4/0003-Fix-uClibc-build-on-64bit-platforms-by-including-std.patch
@@ -1,7 +1,7 @@
 From 4a63f267efab2ef86adbeddda45909127135d7c8 Mon Sep 17 00:00:00 2001
 From: Bernd Kuhls <bernd.kuhls@t-online.de>
 Date: Sun, 28 Jan 2018 11:57:11 +0100
-Subject: [PATCH 1/1] Fix uClibc build on 64bit platforms by including stdint.h
+Subject: [PATCH] Fix uClibc build on 64bit platforms by including stdint.h
 
 Fixes an error detected by buildroot autobuilders:
 http://autobuild.buildroot.net/results/573/573e2268e205e10d1352fa81122d8f225fdb4575/build-end.log
