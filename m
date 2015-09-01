From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 1 Sep 2015 22:28:49 +0200
Subject: [Buildroot] [git commit] tar: move package to 'system tools'
Message-ID: <20150901202951.26AA381E6C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=91f12b7e7a013e3db639e0fa44ac395ac46442f2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Package was previously in the 'Development' section

Signed-off-by: Francesco Nwokeka <francesco.nwokeka@gmail.com>
Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in |    4 +---
 1 files changed, 1 insertions(+), 3 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 6ba21a1..58b7380 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -140,9 +140,6 @@ if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 endif
 	source "package/sstrip/Config.in"
 	source "package/subversion/Config.in"
-if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
-	source "package/tar/Config.in"
-endif
 	source "package/tree/Config.in"
 	source "package/yasm/Config.in"
 endmenu
@@ -1508,6 +1505,7 @@ endif
 	source "package/systemd/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	source "package/sysvinit/Config.in"
+	source "package/tar/Config.in"
 endif
 	source "package/util-linux/Config.in"
 endmenu
