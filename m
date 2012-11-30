From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 29 Nov 2012 23:13:10 -0800
Subject: [Buildroot] [git commit] Change Filesystem utilities heading
	because it has mtd utils too.
Message-ID: <20121130072906.EF3AF994D1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=40f175b37ad15969e297c566037fc3ffd15541b3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changing it to Filesystem and flash utilities gives far better navigation
for mtd utils.

Signed-off-by: Charles Manning <cdhmanning@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 5d9783a..15d7ad6 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -177,7 +177,7 @@ source "package/xterm/Config.in"
 source "package/xvkbd/Config.in"
 endmenu
 
-menu "Filesystem utilities"
+menu "Filesystem and flash utilities"
 source "package/cifs-utils/Config.in"
 source "package/cramfs/Config.in"
 source "package/dosfstools/Config.in"
