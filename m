From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 21 Sep 2013 22:44:53 +0200
Subject: [Buildroot] [git commit] package/Config.in: sort the real-time menu
	entries
Message-ID: <20130921204914.DA9E69B81F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1baca6252391ff793d15122f83006b8ec341bf41
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Reported-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Acked-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index e1dfd5d..1dd60d1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -910,8 +910,8 @@ endif
 endmenu
 
 menu "Real-Time"
-source "package/xenomai/Config.in"
 source "package/rtai/Config.in"
+source "package/xenomai/Config.in"
 endmenu
 
 menu "Shell and utilities"
